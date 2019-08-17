package com.me.rentalme.rental.reserve.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.model.entity.UserVo;

/**
* 렌탈페이지 - 상담예약
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.18
*/
@Controller
@RequestMapping("/rental/reserve")
public class RentalReserveController {
	
	/**
	* 대형가전렌탈 상담예약 폼
	* 
	* @param  String lg
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/{lg}", method = RequestMethod.GET)
	public ModelAndView getReserveLg(@PathVariable String lg) {
		
		
		ModelAndView mav = new ModelAndView("rental/rentalReserve");
		return mav;
	}

	/**
	* 대형가전렌탈 상담예약
	* 
	* @param  UserVo bean
	* @param  String lg
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/{lg}", method = RequestMethod.POST)
	public ModelAndView setReserveLg(@PathVariable UserVo bean, @PathVariable String lg) {
		
		
		ModelAndView mav = new ModelAndView("rental/rentalAppliLgList");
		return mav;
	}
	
	/**
	* 소형가전렌탈 상담예약 폼
	* 
	* @param  String sm
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/{sm}", method = RequestMethod.GET)
	public ModelAndView setReserveSm(@PathVariable String sm) {
		
		
		ModelAndView mav = new ModelAndView("rental/rentalReserve");
		return mav;
	}
	
	/**
	* 소형가전렌탈 상담예약
	* 
	* @param  UserVo bean
	* @param  String sm
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/{sm}", method = RequestMethod.POST)
	public ModelAndView setReserveSm(@PathVariable UserVo bean, @PathVariable String sm) {
		
		
		ModelAndView mav = new ModelAndView("rental/rentalAppliSmList");
		return mav;
	}
	
	/**
	* 주방가전렌탈 상담예약 폼
	* 
	* @param  String kitc
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/{kitc}", method = RequestMethod.GET)
	public ModelAndView getReserveKitc(@PathVariable String kitc) {
		
		
		ModelAndView mav = new ModelAndView("rental/rentalReserve");
		return mav;
	}
	
	/**
	* 주방가전렌탈 상담예약
	* 
	* @param  UserVo bean
	* @param  String kitc
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/{kitc}", method = RequestMethod.POST)
	public ModelAndView setReserveKitc(@PathVariable UserVo bean, @PathVariable String kitc) {
		
		
		ModelAndView mav = new ModelAndView("rental/rentalAppliKitcList");
		return mav;
	}
	
	/**
	* 가구렌탈 상담예약 폼
	* 
	* @param  String furn
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/{furn}", method = RequestMethod.GET)
	public ModelAndView getReserveFurn(@PathVariable String furn) {
		
		
		ModelAndView mav = new ModelAndView("rental/rentalReserve");
		return mav;
	}
	
	/**
	* 가구렌탈 상담예약
	* 
	* @param  UserVo bean
	* @param  String furn
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/{furn}", method = RequestMethod.POST)
	public ModelAndView setReserveFurn(@PathVariable UserVo bean, @PathVariable String furn) {
		
		
		ModelAndView mav = new ModelAndView("rental/rentalAppliFurnList");
		return mav;
	}
	
	/**
	* 기타렌탈 상담예약 폼
	* 
	* @param  String rest
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/{rest}", method = RequestMethod.GET)
	public ModelAndView getReserveRest(@PathVariable String rest) {
		
		
		ModelAndView mav = new ModelAndView("rental/rentalReserve");
		return mav;
	}
	
	/**
	* 기타렌탈 상담예약
	* 
	* @param  UserVo bean
	* @param  String lg
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/{rest}", method = RequestMethod.POST)
	public ModelAndView setReserveRest(@PathVariable UserVo bean, @PathVariable String rest) {
		
		
		ModelAndView mav = new ModelAndView("rental/rentalAppliRestList");
		return mav;
	}
	
	/**
	* 패키지렌탈 상담예약 폼
	* 
	* @param  String pkg
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/{pkg}", method = RequestMethod.GET)
	public ModelAndView getReservePkg(@PathVariable String pkg) {
		
		
		ModelAndView mav = new ModelAndView("rental/rentalReserve");
		return mav;
	}
	
	/**
	* 주방가전렌탈 상담예약
	* 
	* @param  UserVo bean
	* @param  String lg
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/{pkg}", method = RequestMethod.POST)
	public ModelAndView setReservePkg(@PathVariable UserVo bean, @PathVariable String pkg) {
		
		
		ModelAndView mav = new ModelAndView("rental/rentalAppliPkgList");
		return mav;
	}
}
