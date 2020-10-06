package com.cricket.controller.master;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cricket.model.Scorebook;
import com.cricket.service.ScorebookService;

@Controller
@RequestMapping("/mvc/scorer")
public class ScorerController extends AbstractBaseController{

	@Autowired
	ScorebookService scorebookService;



	@RequestMapping(value = "/toss", method = RequestMethod.GET)
	public String toss(@RequestParam(required = false) Long uuid, Model model) {
		return "toss";
	}

	@RequestMapping(value = "/saveToss", method = RequestMethod.GET)
	public String saveToss(@RequestParam(required = false) Long uuid, Model model) {
		return "viewScorer";
	}


	@RequestMapping(value = "/playerSelection", method = RequestMethod.GET)
	public String playerSelection(@RequestParam(required = false) Long uuid, Model model) {
		return "playerSelection";
	}

	@RequestMapping(value = "/savePlayerSelection", method = RequestMethod.GET)
	public String savePlayerSelection(@RequestParam(required = false) Long uuid, Model model) {
		return "playerSelection";
	}

	@RequestMapping(value = "/scorebook", method = RequestMethod.GET)
	public String scorebook(@RequestParam(required = false) Long matchId, Model model) {
		// other detail will be loaded here

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
