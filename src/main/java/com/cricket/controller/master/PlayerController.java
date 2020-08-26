package com.cricket.controller.master;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mvc/player")
public class PlayerController {

	@RequestMapping(value = "/addPlayer", method = RequestMethod.GET)
	public String addPlayer() {
		
		System.out.println("************************");
		return "addPlayer";
	}
}
