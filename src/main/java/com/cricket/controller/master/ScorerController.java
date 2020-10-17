package com.cricket.controller.master;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cricket.common.AppConstant;
import com.cricket.model.BatsmanMatchDtls;
import com.cricket.model.BowlerMatchDtls;
import com.cricket.model.Match;
import com.cricket.model.Player;
import com.cricket.model.Scorebook;
import com.cricket.service.BatsmanDtlsService;
import com.cricket.service.BowlerDtlsService;
import com.cricket.service.MatchService;
import com.cricket.service.ScorebookService;
import com.cricket.vo.BatsmanMatchDtlsVO;
import com.cricket.vo.BowlerMatchDtlsVO;
import com.cricket.vo.MatchVO;
import com.cricket.vo.ScorebookDisplayVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/mvc/scorer")
public class ScorerController extends AbstractBaseController{

	@Autowired
	ScorebookService scorebookService;

	@Autowired
	MatchService matchService;

	@Autowired
	BatsmanDtlsService batsmanDtlsService;

	@Autowired
	BowlerDtlsService bowlerDtlsService;


	@RequestMapping(value = "/toss", method = RequestMethod.GET)
	public String toss(@RequestParam(required = false) Long uuid, Model model) {
		Match match = matchService.getByUuid(uuid);
		model.addAttribute("match", match);
		return "toss";
	}

	@RequestMapping(value = "/saveToss", method = RequestMethod.POST)
	public String saveToss(@ModelAttribute("match") Match match, Model model,BindingResult bindingResult) {

		// TODO : Need to add
		if(AppConstant.TOSS_DECISION_BAT.equalsIgnoreCase(match.getTossDecision())) {
			if(match.getTossWinnerTeam().getUuid() == match.getTeam1().getUuid()) {
				// TEAM 1 WILL BAT
				match.setFirstInningsTeam(match.getTeam1());
				match.setSecondInningsTeam(match.getTeam2());
			}else {
				// TEAM 2 WILL BAT
				match.setFirstInningsTeam(match.getTeam2());
				match.setSecondInningsTeam(match.getTeam1());
			}

		}else {
			if(match.getTossWinnerTeam().getUuid() == match.getTeam1().getUuid())
			{
				// TEAM 1 WILL BOWL
				match.setFirstInningsTeam(match.getTeam2());
				match.setSecondInningsTeam(match.getTeam1());
			}else {
				// TEAM 2 WILL BOWL
				match.setFirstInningsTeam(match.getTeam1());
				match.setSecondInningsTeam(match.getTeam2());
			}
		}
		match.setCurrentInning(1);
		matchService.save(match);
		return "redirect:scorebook?uuid=" + match.getUuid();
	}

	/*
	@RequestMapping(value = "/playerSelection", method = RequestMethod.GET)
	public String playerSelection(@RequestParam(required = false) Long uuid, Model model) {
		Match match = matchService.getByUuid(uuid);
			if(match.getTeam1().getUuid() == match.getTossWinnerTeam().getUuid() && match.getTossDecision() == "BAT") {

			}
		model.addAttribute("match", match);
		return "playerSelection";
	}

	@RequestMapping(value = "/savePlayerSelection", method = RequestMethod.GET)
	public String savePlayerSelection(@RequestParam(required = false) Long uuid, Model model) {
		return "playerSelection";
	}

	*/
	@RequestMapping(value = "/scorebook", method = RequestMethod.GET)
	public String scorebook(@RequestParam(required = false) Long uuid, Model model) throws JsonProcessingException {
		// other detail will be loaded here
		Match match = matchService.getByUuid(uuid);

		Map<Long,String> team1PlayerList = new HashMap<>();
		for (Player player : match.getTeam1().getPlayers()) {
			team1PlayerList.put(player.getUuid(),player.getPlayerName());
		}

		Map<Long,String> team2PlayerList = new HashMap<>();
		for (Player player : match.getTeam2().getPlayers()) {
			team2PlayerList.put(player.getUuid(),player.getPlayerName());
		}

		String team1PlayerListJson = "";
		String team2PlayerListJson = "";

		ObjectMapper mapper = new ObjectMapper();
		if(match.getCurrentInning()== 1) {
			model.addAttribute("battingteam", match.getFirstInningsTeam().getName());
			model.addAttribute("bowlingteam", match.getSecondInningsTeam().getName());
			if(match.getTeam1().getName().equalsIgnoreCase(match.getFirstInningsTeam().getName()) ) {
				team1PlayerListJson = mapper.writeValueAsString(team1PlayerList);
				team2PlayerListJson = mapper.writeValueAsString(team2PlayerList);
			}else {
				team1PlayerListJson = mapper.writeValueAsString(team2PlayerList);
				team2PlayerListJson = mapper.writeValueAsString(team1PlayerList);
			}
		}else {
			model.addAttribute("battingteam", match.getSecondInningsTeam().getName());
			model.addAttribute("bowlingteam", match.getFirstInningsTeam().getName());

			if(match.getTeam1().getName().equalsIgnoreCase(match.getSecondInningsTeam().getName()) ) {
				team1PlayerListJson = mapper.writeValueAsString(team1PlayerList);
				team2PlayerListJson = mapper.writeValueAsString(team2PlayerList);
			}else {
				team1PlayerListJson = mapper.writeValueAsString(team2PlayerList);
				team2PlayerListJson = mapper.writeValueAsString(team1PlayerList);
			}
		}

		model.addAttribute("match", match);
		model.addAttribute("team1PlayerListJson", team1PlayerListJson);
		model.addAttribute("team2PlayerListJson", team2PlayerListJson);

		model.addAttribute("scorebook", new Scorebook());
		return "scorebook";
	}

	@RequestMapping(value = "/saveScorebook", method = RequestMethod.POST, produces="application/json")
	public  @ResponseBody ScorebookDisplayVO save(@ModelAttribute("scorebook") Scorebook scorebook, Model model, RedirectAttributes rm) throws JsonProcessingException {
		scorebookService.save(scorebook);

		//TODO : Change to one function for both batsman
		BatsmanMatchDtls batsman =  batsmanDtlsService.getInningsBatsmanData(scorebook.getMatchId(), scorebook.getBatsmanUuid());
		BatsmanMatchDtls nonStriker =  batsmanDtlsService.getInningsBatsmanData(scorebook.getMatchId(), scorebook.getNonStrikerUuid());


		BowlerMatchDtls bowlerMatchDtls = bowlerDtlsService.getInningsBowlerDtls(scorebook.getMatchId(), scorebook.getBolwerUuid());

		Match match = matchService.getByUuid(scorebook.getMatchId());

		// clubing all data in one class to generate updated json;
		ScorebookDisplayVO scorebookDisplayVO = new ScorebookDisplayVO();
		scorebookDisplayVO.setBatsman(convertBatsmanMatchDtlsDTOtoVO(batsman));
		scorebookDisplayVO.setNonStriker(convertBatsmanMatchDtlsDTOtoVO(nonStriker));
		scorebookDisplayVO.setBowler(convertBowlerMatchDtlsDTOtoVO(bowlerMatchDtls));
		scorebookDisplayVO.setMatch(convertMatchDTOtoVO(match));

		ObjectMapper mapper = new ObjectMapper();

		String json = mapper.writeValueAsString(scorebookDisplayVO);

		// need to build json with scorebook information

		// inning_score
		// inning_wicket
		// inning_run_rate
		// batsman [name , 4, 6, sr , run , ball ]
		//bowler [name , over, maiden, run , wicket , economy_rate ]

		// need to return calculated json
		return scorebookDisplayVO;
	}

	private BatsmanMatchDtlsVO convertBatsmanMatchDtlsDTOtoVO(BatsmanMatchDtls batsmanMatchDtls) {

		BatsmanMatchDtlsVO batsmanMatchDtlsVO = new BatsmanMatchDtlsVO();
		BeanUtils.copyProperties(batsmanMatchDtls, batsmanMatchDtlsVO);
		return batsmanMatchDtlsVO;
	}
	private BowlerMatchDtlsVO convertBowlerMatchDtlsDTOtoVO(BowlerMatchDtls bowlerMatchDtls) {
		BowlerMatchDtlsVO bowlerMatchDtlsVO = new BowlerMatchDtlsVO();
		BeanUtils.copyProperties(bowlerMatchDtls, bowlerMatchDtlsVO);
		return bowlerMatchDtlsVO;
	}
	private MatchVO convertMatchDTOtoVO(Match match) {
		MatchVO matchVO = new MatchVO();
		BeanUtils.copyProperties(matchVO, match);
		matchVO.setTournamentUuid(match.getTournament().getUuid());
		matchVO.setTeam1Uuid(match.getTeam1().getUuid());
		matchVO.setTeam1Name(match.getTeam1().getName());

		matchVO.setTeam2Uuid(match.getTeam2().getUuid());
		matchVO.setTeam2Name(match.getTeam2().getName());

		// TODO: OTHER INFORMATION REAMING TO COPY

		return matchVO;
	}
}
