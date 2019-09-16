package com.me.rentalme.mp.mng.appli.controller;

import java.sql.SQLException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
* 마이페이지(관리자) 리스트 컨트롤러
* 
* @author 황인준
* @version ver1.0 
* 등록일자 : 2019.08.14
*/
@Controller
@RequestMapping("/mp")
public class MngAppliController {
	@Inject
	com.me.rentalme.mp.mng.service.MngService MngService;
	
	Logger log = LoggerFactory.getLogger(getClass());

	
	/**
	 * @throws SQLException 
	* 마이페이지(관리자) - 메인 리스트
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng/goodsList",method = RequestMethod.GET)
	public ModelAndView getMainList() throws SQLException {
		log.debug("마이페이지(관리자) 메인 컨트롤러");
	
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("rlist", MngService.selectGoodsList());
		mav.setViewName("mp/manager/mngMainList");
		return mav;
	}
	
	/**
	* 마이페이지(관리자) - 대형가전 리스트
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng/Appli/lg", method = RequestMethod.GET)
	public ModelAndView getLgList() {
		log.debug("대형가전 리스트 컨트롤러");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mp/manager/mngAppliLgList");
		return mav;
	}
	
	/**
	* 마이페이지(관리자) - 소형가전 리스트
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng/Appli/sm", method = RequestMethod.GET)
	public ModelAndView getSmList() {
		log.debug("소형가전 리스트 컨트롤러");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mp/manager/mngAppliSmList");
		return mav;
	}
	
	/**
	*  마이페이지(관리자) - 주방용품 리스트
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng/Appli/kitc", method = RequestMethod.GET)
	public ModelAndView getKitcList() {
		log.debug("주방 리스트 컨트롤러");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mp/manager/mngAppliKitcList");
		return mav;
	}
	
	/**
	*  마이페이지(관리자) - 가구 리스트
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng/Appli/furn", method = RequestMethod.GET)
	public ModelAndView getFurnList() {
		log.debug("가구 리스트 컨트롤러");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mp/manager/mngAppliFurnList");
		return mav;
	}
	
	/**
	*  마이페이지(관리자) - 기타 리스트
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng/Appli/rest", method = RequestMethod.GET)
	public ModelAndView getRestList() {
		log.debug("기타 리스트 컨트롤러");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mp/manager/mngAppliRestList");
		return mav;
	}
	
	/**
	*  마이페이지(관리자) - 패키지 리스트
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng/Appli/pkg", method = RequestMethod.GET)
	public ModelAndView getPkgList() {
		log.debug("패키지 리스트 컨트롤러");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mp/manager/mngAppliPkgList");
		return mav;
	}

	
}
