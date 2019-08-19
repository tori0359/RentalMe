package com.me.rentalme.act.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


/**
* �̺�Ʈ ��� ��Ʈ�ѷ�
* 
* @author Ȳ����
* @version ver1.0
* @see 
* ������� : 2019.08.18
*/
@Controller
@RequestMapping("/act")
public class ActController {

	/**
	* �̺�Ʈ ��� ����Ʈ
	* 
	* @param  None
	* @return ModelAndView 
	* @author Ȳ����
	* @exception 
	*/
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView getActList() {
		
		
		ModelAndView mav = new ModelAndView("act/actList");
		return mav;
	}
	
	/**
	* �̺�Ʈ ��� �󼼺���
	* 
	* @param  None
	* @return ModelAndView 
	* @author Ȳ����
	* @exception 
	*/
	@RequestMapping(value="/{idx}", method=RequestMethod.GET)
	public ModelAndView getActDetail(@PathVariable int idx) {
		
		
		ModelAndView mav = new ModelAndView("act/actDetail");
		return mav;
	}
	
	/**
	* �̺�Ʈ ��� �󼼼���
	* 
	* @param  None
	* @return ModelAndView 
	* @author Ȳ����
	* @exception 
	*/
	@RequestMapping(value="/gds/{idx}", method=RequestMethod.GET)
	public ModelAndView getDiscript(@PathVariable int idx) {
		
		
		ModelAndView mav = new ModelAndView("act/actGdsDetail");
		return mav;
	}
	
	
	/**
	* �̺�Ʈ ��� ������� - ��Ʈ�ѷ� ���� ��� ����
	* 
	* @param  None
	* @return ModelAndView 
	* @author Ȳ����
	* @exception 
	*/
	
	
}