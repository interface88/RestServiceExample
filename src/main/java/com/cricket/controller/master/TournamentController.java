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

import com.cricket.model.Player;
import com.cricket.model.Tournament;
import com.cricket.service.TournamentService;

@Controller
@RequestMapping("/mvc/tournament")
public class TournamentController  extends AbstractBaseController{

	@Autowired
	TournamentService tournamentService;
	
	@RequestMapping(value = "/tournamentList", method = RequestMethod.GET)
	public String list(@RequestParam(required = false) Long uuid, Model model) {
		List<Tournament> tournamentList =  tournamentService.getList(null);
		model.addAttribute("tournamentList",tournamentList);
		return "tournamentList";
	}
	
	@RequestMapping(value = "/viewTournament", method = RequestMethod.GET)
	public String viewTournament(@RequestParam(required = false) Long uuid, Model model) {
		Tournament tournament = new Tournament();
		if(uuid!=null) {
			tournament = tournamentService.getByUuid(uuid);
		}

		model.addAttribute("tournament",tournament);
		return "viewTournament";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	  public String save(@ModelAttribute("tournament") Tournament tournament, Model model, RedirectAttributes rm) {

	    if (tournament.getUuid() != null) {
	    	tournamentService.update(tournament);
	    } else {
	    	tournamentService.save(tournament);
	    }
	    model.addAttribute("tournament", tournament);

	    rm.addFlashAttribute("message", "Record Saved Sucessfully");
	    return "redirect:viewTournament?uuid=" + tournament.getUuid();
	  }
}
