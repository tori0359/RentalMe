package com.me.rentalme.mp.mng.user.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.model.entity.UserVo;
import com.me.rentalme.mp.mng.service.MngService;
import com.me.rentalme.mp.user.service.MpUserService;

/**
* 마이페이지(관리자) - 사용자관리
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.14
* 수정일자 : 2019.09.11
*/
@Controller
@RequestMapping("/mp/mng")
public class MngUserController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	MngService mngService; 
	
	/**
	* 사용자 리스트
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* 등록일자 : 2019.09.11
	*/
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public ModelAndView getUserList() {
		log.debug("사용자 리스트 컨트롤러");
		
		//사용자 리스트 서비스 작성
		List<UserVo> userInfo =  mngService.getUserInfo();
		
		ModelAndView mav = new ModelAndView("mp/manager/mngUserList");
		mav.addObject("userInfo", userInfo);
		return mav;
	}

	/**
	* 사용자 상세정보
	* 
	* @param  String memNo - 회원번호
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/act/{memNo}", method = RequestMethod.GET)
	public ModelAndView getUserDetail(@PathVariable("memNo") String memNo) {
		log.debug("사용자 상세정보 컨트롤러");
		
		//사용자 상세정보 서비스 작성
		
		
		ModelAndView mav = new ModelAndView("mp/manager/mngUserDetail");
		return mav;
	}

}
