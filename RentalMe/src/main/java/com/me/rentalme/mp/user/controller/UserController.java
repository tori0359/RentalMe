package com.me.rentalme.mp.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.model.entity.UserVo;

/**
* 마이페이지 컨트롤러
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.14
*/
@Controller
public class UserController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	/**
	* 주문내역
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mp/", method = RequestMethod.GET)
	public ModelAndView getOrderList() {
		log.debug("주문내역 리스트 컨트롤러...");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mp/user/userOrdList");
		
		return mav;
	}
	
	/**
	* 장바구니
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mp/cart", method = RequestMethod.GET)
	public ModelAndView getCartList() {
		log.debug("장바구니 컨트롤러...");
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mp/user/userCartList");
		return mav;
	}	
	
	/**
	* 찜한 상품
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mp/wish", method = RequestMethod.GET)
	public ModelAndView getWishList() {
		log.debug("찜한상품 컨트롤러...");
	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mp/user/userWishList");
		return mav;
	}
	
	/**
	* 예치금
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mp/deposit", method = RequestMethod.GET)
	public ModelAndView getDeposit() {
		log.debug("예치금 컨트롤러...");
	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mp/user/userDeposit");
		return mav;
	}	
	
	/**
	* 내 정보 수정 폼
	* 
	* @param  
	* @return String 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mp/updInfo", method = RequestMethod.GET)
	public String modifyInfo() {
		log.debug("내 정보 수정 폼 컨트롤러...");
	
		return "mp/user/userUpdInfo";
	}
	
	/**
	* 내 정보 수정
	* 
	* @param  UserVo
	* @return String 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mp/updInfo", method = RequestMethod.PUT)
	public String modifyInfo(UserVo bean) {
		log.debug("내 정보 수정 컨트롤러...");
	
		return "mp/user/userUpdInfo";
	}
	
	/**
	* 내 문의 보기
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mp/quest", method = RequestMethod.GET)
	public ModelAndView getQuestList() {
		log.debug("내 문의 보기 컨트롤러...");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mp/user/userQuestList");
		return mav;
	}
	
	/**
	* 나의 중고 상점
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mp/used", method = RequestMethod.GET)
	public ModelAndView getUsedList() {
		log.debug("나의 중고 상점 컨트롤러...");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mp/user/userMyUsedList");
		return mav;
	}
	
	/**
	* 거래내역
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mp/act", method = RequestMethod.GET)
	public ModelAndView getActList() {
		log.debug("내 문의 보기 컨트롤러...");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mp/user/userActList");
		return mav;
	}

}
