package com.cricket.controller.master;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cricket.model.Player;
import com.cricket.service.BattingStyleService;
import com.cricket.service.BowlingStyleService;
import com.cricket.service.PlayerRoleService;
import com.cricket.service.PlayerService;

@Controller
@RequestMapping("/mvc/scorer")
public class ScorerController extends AbstractBaseController{

	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String viewPlayer(@RequestParam(required = false) Long uuid, Model model) {
		
		return "viewScorer";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	  public String save(@ModelAttribute("player") Player player, Model model, RedirectAttributes rm) {

	    return "redirect:viewPlayer";
	  }
}
