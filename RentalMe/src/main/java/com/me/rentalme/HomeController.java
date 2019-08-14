package com.me.rentalme;

import java.sql.SQLException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.me.rentalme.service.RentalMeService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	RentalMeService rentalmeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws SQLException {
		
		model.addAttribute("alist", rentalmeService.list());
		return "home";
	}
	
	@RequestMapping(value = "userActList", method = RequestMethod.GET)
	public String view(Model model) throws SQLException {
		
		return "/mp/user/userActList";
	}
	
	
}
