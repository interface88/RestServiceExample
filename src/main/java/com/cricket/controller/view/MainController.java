package com.cricket.controller.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class MainController {

	@Autowired
    AuthenticationTrustResolver authenticationTrustResolver;
	
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
    	boolean flag = isCurrentAuthenticationAnonymous();
    	if(flag){
    		return "login";
    	}
    	return "index";
    }
    
    @RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public String loginPage(@RequestParam(value = "error",required = false) String error,
	@RequestParam(value = "logout",	required = false) String logout, Model model) {
    	String password = "admin@123";
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password);
		System.out.println("+++++++");
		System.out.println(hashedPassword);
		System.out.println("+++++++");
		if (error != null) {
			model.addAttribute("error", "Invalid Credentials provided.");
		}
		

		if (logout != null) {
			model.addAttribute("message", "Logged out from JournalDEV successfully.");
		}
		return "login";
    }
    
    @RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
	public String forgotPassword(@RequestParam(value = "error",required = false) String error,
	@RequestParam(value = "logout",	required = false) String logout, Model model) {
    	String password = "admin@123";
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password);

		System.out.println(hashedPassword);
		if (error != null) {
			model.addAttribute("error", "Invalid Credentials provided.");
		}
		

		if (logout != null) {
			model.addAttribute("message", "Logged out from JournalDEV successfully.");
		}
		return "login";
    }
    
    /**
     * This method returns true if users is already authenticated [logged-in], else false.
     */
    private boolean isCurrentAuthenticationAnonymous() {
        final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authenticationTrustResolver.isAnonymous(authentication);
    }
}
