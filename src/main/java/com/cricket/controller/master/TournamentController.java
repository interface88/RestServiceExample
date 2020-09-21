package com.cricket.controller.master;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cricket.model.Player;
import com.cricket.model.Team;
import com.cricket.model.TeamGroup;
import com.cricket.model.Tournament;
import com.cricket.service.TeamGroupService;
import com.cricket.service.TeamService;
import com.cricket.service.TournamentService;
import com.cricket.vo.TeamGroupVO;
import com.cricket.vo.TeamVO;
import com.cricket.vo.TournamentVO;

@Controller
@RequestMapping("/mvc/tournament")
public class TournamentController  extends AbstractBaseController{

	@Autowired
	TournamentService tournamentService;
	
	
	@Autowired
	TeamGroupService teamGroupService;
	@Autowired
	TeamService teamService;
	
	@RequestMapping(value = "/tournamentList", method = RequestMethod.GET)
	public String list(@RequestParam(required = false) Long uuid, Model model) {
		List<Tournament> tournamentList =  tournamentService.getList(null);
		model.addAttribute("tournamentList",tournamentList);
		return "tournamentList";
	}
	
	@RequestMapping(value = "/viewTournament", method = RequestMethod.GET)
	public String viewTournament(@RequestParam(required = false) Long uuid, Model model) {
		Tournament tournament = new Tournament();
		TournamentVO tournamentVO = new TournamentVO();
		
		if(uuid!=null) {
			tournament = tournamentService.getByUuid(uuid);
			tournamentVO = convertDTOtoVO(tournament);
		}

		//model.addAttribute("tournament",tournament);
		
		model.addAttribute("tournamentVO", tournamentVO);
		model.addAttribute("teamList", teamService.getList(null));
		return "viewTournament";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	  public String save(@ModelAttribute("tournament") TournamentVO tournamentVO, Model model, RedirectAttributes rm) {

		Tournament tournament = convertVoToDTO(tournamentVO);
			
		
		if (tournament.getUuid() != null) {
			tournamentService.update(tournament);
		} else {
			tournamentService.save(tournament);
		}
		 

	    model.addAttribute("tournament", tournament);
	    
		
		Set<TeamGroup> teamGroups = (Set<TeamGroup>) tournament.getTeamGroups();

		for (TeamGroup t : teamGroups) {
			/*
			 * TeamGroup teamGroup = new TeamGroup();
			 * 
			 * teamGroup.setTournament(tournament); teamGroup.setName(t.getName());
			 * teamGroup.setTeam(teamService.getByUuid(t.getTeam().getUuid()));
			 */
			if (t.getUuid() !=null) {
				
			}else
			{
				
			}
			teamGroupService.save(t);
		} 
		
		/*
		 * TeamGroup teamGroup = new TeamGroup(); teamGroup.setTournament(tournament);
		 * teamGroup.setName("Group A"); teamGroup.setTeam(teamService.getByUuid(1l));
		 * teamGroupService.save(teamGroup);
		 */
	    
	    rm.addFlashAttribute("message", "Record Saved Sucessfully");
	    return "redirect:viewTournament?uuid=" + tournament.getUuid();
	  }
	
	private Tournament convertVoToDTO(TournamentVO tournamentVO) {
		
		Tournament tournament= new Tournament();
		tournament.setUuid(tournamentVO.getUuid());
		tournament.setTournamentName(tournamentVO.getTournamentName());
		tournament.setOrganiser(tournamentVO.getOrganiser());
		tournament.setStartDate(tournamentVO.getStartDate());
		tournament.setEndDate(tournamentVO.getEndDate());
		tournament.setPlace(tournamentVO.getPlace());
		tournament.setTournamentType(tournamentVO.getTournamentType());
		
		List<TeamGroupVO> playerIdList =  tournamentVO.getTeamGroupList();
		for (TeamGroupVO teamGroupVO : playerIdList) {
			TeamGroup teamGroup = new TeamGroup();
			
			Team team = new Team();
			team.setUuid(teamGroupVO.getTeamList().get(0).getUuid());
			teamGroup.setUuid(teamGroupVO.getUuid());
			teamGroup.setTeam(team);
			teamGroup.setName(teamGroupVO.getName());
			teamGroup.setTournament(tournament);
			
			tournament.getTeamGroups().add(teamGroup);
		}
		return tournament;
	}
	
	private TournamentVO convertDTOtoVO(Tournament tournament) {
		
		TournamentVO tournamentVO= new TournamentVO();
		tournamentVO.setUuid(tournament.getUuid());
		tournamentVO.setTournamentName(tournament.getTournamentName());
		tournamentVO.setOrganiser(tournament.getOrganiser());
		tournamentVO.setStartDate(tournament.getStartDate());
		tournamentVO.setEndDate(tournament.getEndDate());
		tournamentVO.setPlace(tournament.getPlace());
		tournamentVO.setTournamentType(tournament.getTournamentType());
		
		Set<TeamGroup> teamGroups = tournament.getTeamGroups();
		
		for (TeamGroup teamGroup:teamGroups) {
			TeamGroupVO teamGroupVO = new TeamGroupVO();
			teamGroupVO.setUuid(teamGroup.getUuid());
			teamGroupVO.setName(teamGroup.getName());
			
			TeamVO teamVO= new TeamVO(); 
			teamVO.setUuid(teamGroup.getTeam().getUuid());
			teamVO.setName(teamGroup.getTeam().getName());
			
			teamGroupVO.getTeamList().add(teamVO);
			tournamentVO.getTeamGroupList().add(teamGroupVO);
		}
		
		return tournamentVO;
	}
}
