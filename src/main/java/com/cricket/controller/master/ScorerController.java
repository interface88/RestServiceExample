package com.cricket.controller.master;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cricket.model.Match;
import com.cricket.model.Player;
import com.cricket.model.Scorebook;
import com.cricket.service.MatchService;
import com.cricket.service.ScorebookService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/mvc/scorer")
public class ScorerController extends AbstractBaseController{

	@Autowired
	ScorebookService scorebookService;

	@Autowired
	MatchService matchService;

	@RequestMapping(value = "/toss", method = RequestMethod.GET)
	public String toss(@RequestParam(required = false) Long uuid, Model model) {
		Match match = matchService.getByUuid(uuid);
		model.addAttribute("match", match);
		return "toss";
	}

	@RequestMapping(value = "/saveToss", method = RequestMethod.POST)
	public String saveToss(@ModelAttribute("match") Match match, Model model,BindingResult bindingResult) {
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
		for (Player player : match.getTeam1().getPlayers()) {
			team2PlayerList.put(player.getUuid(),player.getPlayerName());
		}

		ObjectMapper mapper = new ObjectMapper();

		String team1PlayerListJson = mapper.writeValueAsString(team1PlayerList);
		String team2PlayerListJson = mapper.writeValueAsString(team2PlayerList);
		model.addAttribute("match", match);
		model.addAttribute("team1PlayerListJson", team1PlayerListJson);
		model.addAttribute("team2PlayerListJson", team2PlayerListJson);
		model.addAttribute("battingteam", "team1");
		model.addAttribute("bowlingteam", "team1");



		model.addAttribute("scorebook", new Scorebook());
		return "scorebook";
	}

	@RequestMapping(value = "/saveScorebook", method = RequestMethod.POST)
	public String save(@ModelAttribute("scorebook") Scorebook scorebook, Model model, RedirectAttributes rm) {
		scorebookService.save(scorebook);

		// need to return calculated json
		return "redirect:viewPlayer";
	}
}
