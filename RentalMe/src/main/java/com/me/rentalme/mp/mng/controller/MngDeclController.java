package com.me.rentalme.mp.mng.controller;

import java.sql.SQLException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.me.rentalme.mp.mng.service.MngService;

@Controller
@RequestMapping("/mp/mng/decl")
public class MngDeclController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	MngService mngService;
	
	
	/**
	 * @throws SQLException 
	* 
	* 
	* @param  
	* @return String 
	* @author ¹ÚÀçÈ¯
	* @exception 
	*/
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String getMngDeclList(Model model) throws SQLException {
		model.addAttribute("alist", mngService.selectDecl());
		
		return "mp/manager/mngDeclList";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String getMngDeclUdt(@RequestParam(value = "declNo") String declNo) throws SQLException{
		String[] array;
		array=declNo.split(",");
		
		for(int i=0; i<array.length; i++) {
			mngService.changeDeclSts(array[i]);
		}
		
		return "redirect:/mp/mng/decl";
	}
	
}
