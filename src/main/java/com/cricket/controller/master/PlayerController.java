package com.cricket.controller.master;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cricket.common.DropDownUtil;
import com.cricket.model.Player;
import com.cricket.service.BattingStyleService;
import com.cricket.service.BowlingStyleService;
import com.cricket.service.PlayerRoleService;
import com.cricket.service.PlayerService;

@Controller
@RequestMapping("/mvc/player")
public class PlayerController extends AbstractBaseController{

	@Autowired
	PlayerService playerService;

	@Autowired
	PlayerRoleService playerRoleService;

	@Autowired
	BattingStyleService battingStyleService;

	@Autowired
	BowlingStyleService bowlingStyleService;

	@RequestMapping(value = "/playerList", method = RequestMethod.GET)
	public String list(@RequestParam(required = false) Long uuid, Model model) {
		List<Player> playerList =  playerService.getList(null);
		model.addAttribute("playerList",playerList);
		return "playerList";
	}

	@RequestMapping(value = "/viewPlayer", method = RequestMethod.GET)
	public String viewPlayer(@RequestParam(required = false) Long uuid, Model model) {
		Player player = new Player();
		if(uuid!=null) {
			player = playerService.getByUuid(uuid);
		}

		model.addAttribute("playerRoleList", DropDownUtil.getPlayerRoleList());
		model.addAttribute("battingStyleList", DropDownUtil.getBattingStyleList());
		model.addAttribute("bowlingStyleList", DropDownUtil.getBowlingStyleList());

		model.addAttribute("player",player);
		return "viewPlayer";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	  public String save(@ModelAttribute("player") Player player, Model model, RedirectAttributes rm) {

	    if (player.getUuid() != null) {
	    	playerService.update(player);
	    } else {
	    	playerService.save(player);
	    }
	    model.addAttribute("player", player);

	    rm.addFlashAttribute("message", "Record Saved Sucessfully");
	    return "redirect:viewPlayer?uuid=" + player.getUuid();
	  }
}
