package com.me.rentalme.cs.controller;

import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.cs.service.CsService;


/**
* 고객센터 컨트롤러
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.18
*/
@Controller
@RequestMapping("/cs")
public class CsController {
	@Inject
	CsService csService; 
	
	/**
	 * @throws SQLException 
	* 고객센터 리스트 
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value="/csInquiry")
	public String inquery(Model model) throws SQLException {
		System.out.println("질문");
		csService.getList(model);
		return "cs/csInquiry";
		
	}
	@RequestMapping(value = "/csNotice", method = RequestMethod.GET)
	public String home(Model model) throws SQLException {
		System.out.println("mapping..");
		csService.getList(model);
		return "cs/csNotice";
	}
	@RequestMapping(value="/csFAQ")
	public String csfaq(Model model) throws SQLException {
		System.out.println("자주묻는질문");
		csService.getList(model);
		return "cs/csFAQ";
	}
	
	/**
	* 고객센터 - 문의 등록 폼 
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	
	  @RequestMapping(value = "/csQuestAdd", method = RequestMethod.GET) public
	  String getCsQuestForm() {
		  return "cs/csQuestAdd"; 
	  }
	 
	
	/**
	* 고객센터 - 문의 등록 
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/csQuest", method = RequestMethod.POST)
	public ModelAndView setCsQuestAdd() {
		
		
		ModelAndView mav = new ModelAndView("cs/csList");
		return mav;
	}
}
