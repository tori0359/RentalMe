package com.me.rentalme.cs.controller;

import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		return "cs/csInquiry";
		
	}
	@RequestMapping(value = "/csNotice", method = RequestMethod.GET)
	public ModelAndView home() throws SQLException {
		System.out.println("mapping..");
		ModelAndView mav=new ModelAndView();
		mav.addObject("alist", csService.csList());
		mav.setViewName("cs/csNotice");
		return mav;
	}
	@RequestMapping(value="/csFAQ")
	public ModelAndView csfaq(Model model) throws SQLException {
		System.out.println("자주묻는질문");
		ModelAndView mav=new ModelAndView();
		mav.addObject("alist", csService.csList());
		mav.setViewName("cs/csFAQ");
		return mav;
	}
	/*
	 * @RequestMapping(value="/csFAQ") public String csbtn(@RequestParam int num,
	 * Model model) throws SQLException{ csService.selectListOne(model,num); return
	 * "cs/csFAQ"; }
	 */
	
	
	
	@RequestMapping(value="/csDetail", method=RequestMethod.GET)
	public String csDetail(String faqNo,Model model) throws Exception{
		
		System.out.println("detail start"+faqNo);
		model.addAttribute("list",csService.csDetail(faqNo));
		System.out.println("detail end");
		return "cs/csDetail";
		
	}
	
	/**
	* 고객센터 - 문의 등록 폼 
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	
	  @RequestMapping(value = "/csQuestAdd", method = RequestMethod.GET) 
	  public String getCsQuestForm() {
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
