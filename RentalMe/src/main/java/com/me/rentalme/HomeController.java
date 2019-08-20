package com.me.rentalme;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.me.rentalme.service.RentalMeService;

@Controller
public class HomeController {
	String uploadDir="C:\\Users\\speed\\git\\RentalMe\\RentalMe\\src\\main\\webapp\\imgs\\";
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	RentalMeService rentalmeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws SQLException {
		
		model.addAttribute("alist", rentalmeService.list());
		return "home";
	}
	
	@RequestMapping(value = "userActList", method = RequestMethod.GET)
	public String getActList(Model model) throws SQLException {
		
		return "/mp/user/userActList";
	}
	
	@RequestMapping(value = "userOrdList", method = RequestMethod.GET)
	public String getOrderList(Model model) throws SQLException {
		
		return "/mp/user/userOrdList";
	}
	
}
