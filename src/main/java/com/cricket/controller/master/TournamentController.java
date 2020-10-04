package com.cricket.controller.master;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cricket.model.Match;
import com.cricket.model.Player;
import com.cricket.model.Team;
import com.cricket.model.TeamGroup;
import com.cricket.model.Tournament;
import com.cricket.service.MatchService;
import com.cricket.service.TeamGroupService;
import com.cricket.service.TeamService;
import com.cricket.service.TournamentService;
import com.cricket.vo.MatchVO;
import com.cricket.vo.ScheduleVO;
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
	@Autowired
	MatchService matchService;
	
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
		List<String> uuids = new ArrayList<String>();
		
		for (TeamGroup t : teamGroups) {
			if (t.getUuid() !=null) {
				uuids.add(t.getUuid().toString());
			}
		}
		
		if(!uuids.isEmpty() && uuids.size()>0)
			teamGroupService.deleteByIds(uuids);
		
		for (TeamGroup t : teamGroups) {
			/*
			 * TeamGroup teamGroup = new TeamGroup();
			 * 
			 * teamGroup.setTournament(tournament); teamGroup.setName(t.getName());
			 * teamGroup.setTeam(teamService.getByUuid(t.getTeam().getUuid()));
			 */
			teamGroupService.update(t);
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
			for(TeamVO teamVO : teamGroupVO.getTeamList()) {
				TeamGroup teamGroup = new TeamGroup();
				Team team = new Team();
				
				team.setUuid(teamVO.getUuid());
				
				teamGroup.setTeam(team);		
				//teamGroup.setUuid(teamGroupVO.getUuid());
				teamGroup.setUuid(teamVO.getGroupUuid());
				teamGroup.setName(teamGroupVO.getName());
				teamGroup.setTournament(tournament);
				
				tournament.getTeamGroups().add(teamGroup);
			}
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
		
		Map<String,TeamGroupVO> teamGroupMap = new HashMap<String, TeamGroupVO>();
		
		for (TeamGroup teamGroup:teamGroups) {
			
			TeamGroupVO teamGroupVO = teamGroupMap.get(teamGroup.getName());
			
			if(teamGroupVO==null) {
				teamGroupVO = new TeamGroupVO();
				teamGroupVO.setUuid(teamGroup.getUuid());
				teamGroupVO.setName(teamGroup.getName());
				teamGroupMap.put(teamGroup.getName(), teamGroupVO);
			}
			
			TeamVO teamVO = new TeamVO();
			teamVO.setUuid(teamGroup.getTeam().getUuid());
			teamVO.setName(teamGroup.getTeam().getName());
			teamVO.setGroupUuid(teamGroup.getUuid());
			
			teamGroupVO.getTeamList().add(teamVO); 
 
			//tournamentVO.getTeamGroupList().add(teamGroupVO);
		}
		
		for (Map.Entry<String,TeamGroupVO> entry : teamGroupMap.entrySet()) {  
			tournamentVO.getTeamGroupList().add(entry.getValue());
		}
		
		return tournamentVO;
	}
	
	@RequestMapping(value = "/viewSchedule", method = RequestMethod.GET)
	public String viewSchedule(@RequestParam(required = false) Long uuid, Model model) {
		Tournament tournament = new Tournament();
		//TournamentVO tournamentVO = new TournamentVO();
		List<Match> match = new ArrayList<Match>();
		
		ScheduleVO scheduleVO = new ScheduleVO();
		Map<String, String> paramList = new HashMap<String, String>();
		
		if(uuid!=null) {
			paramList.put("tournament.uuid", uuid.toString());
			match = matchService.getList(paramList);
			tournament = tournamentService.getByUuid(uuid);
			scheduleVO = convertMatchDTOtoScheduleVO(match,tournament);
		}

		//model.addAttribute("tournament",tournament);
		
		//model.addAttribute("tournamentVO", tournamentVO);
		model.addAttribute("scheduleVO", scheduleVO);
		model.addAttribute("teamList", teamService.getList(null));
		Map<String, String> groupParamList = new HashMap<String, String>();
		groupParamList.put("tournament.uuid", uuid.toString());
		model.addAttribute("teamGroupList",teamGroupService.getFilterList(groupParamList));//remove duplicate
		
		return "viewSchedule";
	}

	@RequestMapping(value = "/saveSchedule", method = RequestMethod.POST)
	  public String save(@ModelAttribute("schedule") ScheduleVO scheduleVO, Model model, RedirectAttributes rm) {
		
		List<Match> matchs = convertScheduleVOtoMatchDTO(scheduleVO);
		List<String> uuids = new ArrayList<String>();
		
		for (Match match : matchs) {
			if (match.getUuid() !=null) {
				uuids.add(match.getUuid().toString());
			}
		}
		
		if(!uuids.isEmpty() && uuids.size()>0)
			matchService.deleteByIds(uuids);
		
		for(Match m:matchs) {
			matchService.save(m);
		}
		
		//Convert Vo -> DTO -> Vo
		model.addAttribute("scheduleVO",scheduleVO);
		rm.addFlashAttribute("message", "Record Saved Sucessfully");
	    return "redirect:viewSchedule?uuid=" + scheduleVO.getTournamentUuid();
	}
	
	private List<Match> convertScheduleVOtoMatchDTO(ScheduleVO scheduleVO) {
		List<Match> matchs = new ArrayList<Match>();
		
		Tournament tournament = new Tournament();
		tournament.setUuid(scheduleVO.getTournamentUuid());
		tournament.setTournamentName(scheduleVO.getTournamentName());
		
		for(MatchVO matchVO:scheduleVO.getMatchVOList()) {
			Match match = new Match();
			match.setUuid(matchVO.getUuid());
			match.setMatchNo(matchVO.getMatchNo());
			match.setMatchTitle(matchVO.getMatchTitle());
			match.setGroupName(matchVO.getTeamGroupName());
			
			match.setTournament(tournament);
			
			Team team1 = new Team();
			team1.setUuid(matchVO.getTeam1Uuid());
			match.setTeam1(team1);
			
			Team team2 = new Team();
			team2.setUuid(matchVO.getTeam2Uuid());
			match.setTeam2(team2);
			
			match.setEstStartDatetime(matchVO.getEstStartDatetime());
			match.setEstEndDatetime(matchVO.getEstEndDatetime());
			matchs.add(match);
		}
		return matchs;
	}

	private ScheduleVO convertMatchDTOtoScheduleVO(List<Match> matchList,Tournament tournament) {
		ScheduleVO scheduleVO =  new ScheduleVO();
		scheduleVO.setTournamentName(tournament.getTournamentName());
		scheduleVO.setTournamentUuid(tournament.getUuid());
		
		for (Match match:matchList) {
			
			
			MatchVO matchVO = new MatchVO();
			matchVO.setUuid(match.getUuid());
			matchVO.setMatchNo(match.getMatchNo());
			matchVO.setMatchTitle(match.getMatchTitle());
			matchVO.setTeam1Uuid(match.getTeam1().getUuid());
			matchVO.setTeam2Uuid(match.getTeam2().getUuid());
			matchVO.setTeam1Name(match.getTeam1().getName());
			matchVO.setTeam2Name(match.getTeam2().getName());
			matchVO.setTeamGroupName(match.getGroupName());
			matchVO.setEstStartDatetime(match.getEstStartDatetime());
			matchVO.setEstEndDatetime(match.getEstEndDatetime());
			scheduleVO.getMatchVOList().add(matchVO);
		}
		return scheduleVO;
	}
}
