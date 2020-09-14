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
import com.cricket.service.PlayerService;
import com.cricket.service.TeamService;
import com.cricket.vo.PlayerVO;
import com.cricket.vo.TeamVO;

@Controller
@RequestMapping("/mvc/team")
public class TeamController extends AbstractBaseController {

	@Autowired
	TeamService teamService;
	@Autowired
	PlayerService playerService;

	@RequestMapping(value = "/teamList", method = RequestMethod.GET)
	public String list(@RequestParam(required = false) Long uuid, Model model) {
		List<Team> teamList = teamService.getList(null);
		model.addAttribute("teamList", teamList);
		return "teamList";
	}

	@RequestMapping(value = "/viewTeam", method = RequestMethod.GET)
	public String viewTeam(@RequestParam(required = false) Long uuid,
			Model model) {
		TeamVO teamVo = new TeamVO();
		if (uuid != null) {
			Team team = teamService.getByUuid(uuid);
			teamVo = convertDTOtoVO(team);
		}

		model.addAttribute("teamVO", teamVo);
		model.addAttribute("playerList", playerService.getList(null));
		return "viewTeam";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("teamVO") TeamVO teamVO, Model model,
			RedirectAttributes rm) {
		Team team = convertVoToDTO(teamVO);
		if (team.getUuid() != null) {
			teamService.update(team);
		} else {
			teamService.save(team);
		}
		model.addAttribute("team", team);
		rm.addFlashAttribute("message", "Record Saved Sucessfully");
		return "redirect:viewTeam?uuid=" + team.getUuid();
	}

	private TeamVO convertDTOtoVO(Team team) {
		TeamVO teamVO = new TeamVO();
		teamVO.setUuid(team.getUuid());
		teamVO.setName(team.getName());
		teamVO.setPlace(team.getPlace());
		teamVO.setName(team.getName());
		Set<Player> playerSet =  team.getPlayers();
		for (Player player : playerSet) {
			PlayerVO playerVO = new PlayerVO();
			playerVO.setPlayerName(player.getPlayerName());
			playerVO.setAdhaarNumber(player.getAdhaarNumber());
			playerVO.setUuid(player.getUuid());
			teamVO.getPlayerList().add(playerVO);
		}

		return teamVO;
	}

	private Team convertVoToDTO(TeamVO teamVO) {
		Team team = new Team();
		team.setUuid(teamVO.getUuid());
		team.setName(teamVO.getName());
		team.setPlace(teamVO.getPlace());
		team.setName(teamVO.getName());

		List<Long> playerIdList =  teamVO.getPlayerIdList();
		for (Long playerUuid : playerIdList) {
			Player player = new Player();
			player.setUuid(playerUuid);
			team.getPlayers().add(player);
		}
		return team;
	}
}
