package com.me.rentalme;

import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.me.rentalme.cs.service.CsService;

@Controller
public class CsController {
	@Inject
	CsService csService; 
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws SQLException {
		System.out.println("mapping..");
		csService.getList(model);
		return "csNotice";
		
	}
	
	@RequestMapping(value="/csInquiry")
	public String inquery(Model model) throws SQLException {
		System.out.println("질문");
		csService.getList(model);
		return "csInquiry";
	}
	@RequestMapping(value="/csFAQ")
	public String csfaq(Model model) throws SQLException {
		System.out.println("자주묻는질문");
		csService.getList(model);
		return "csFAQ";
	}
}
