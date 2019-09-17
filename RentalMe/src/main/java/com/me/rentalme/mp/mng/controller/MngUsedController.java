package com.me.rentalme.mp.mng.controller;

import java.sql.SQLException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.me.rentalme.common.Paging;
import com.me.rentalme.mp.mng.service.MngService;

@Controller
@RequestMapping("/mp/mng/used")
public class MngUsedController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	@Inject
	MngService mngService;
	
	
	/**
	 * @throws SQLException 
	* 중고 리스트
	* 
	* @param  
	* @return String 
	* @author 박재환
	* @exception 
	*/
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String getMngUsedList(Model model) throws SQLException {
		
		model.addAttribute("alist", mngService.selectUsed());
		
		return "mp/manager/mngUsedList";
	}
	/**
	 * @throws SQLException 
	 * 중고 검색
	 * 
	 * @param  
	 * @return String 
	 * @author 박재환
	 * @exception 
	 */
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String getMngUsedOne(Model model,@RequestParam(value = "usedGdsNo") String usedGdsNo) throws SQLException {
		model.addAttribute("alist", mngService.selectUsedSearch(usedGdsNo));
		return "mp/manager/mngUsedList";
	}
	
}
