package com.me.rentalme.mp.mng.controller;

import java.sql.SQLException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.me.rentalme.mp.mng.service.MngService;

@Controller
@RequestMapping("/mp/mng")
public class MngDepositController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	MngService mngService;
	
	
	/**
	 * @throws SQLException 
	* 주문내역
	* 
	* @param  
	* @return String 
	* @author 박재환
	* @exception 
	*/
	@RequestMapping(value = "/deposit", method = RequestMethod.GET)
	public String getMngDepositList(Model model) throws SQLException {
		model.addAttribute("alist", mngService.selectDep());
		
		return "mp/manager/mngOrdList";
	}
}
