package com.me.rentalme.mp.mng.act.cotroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.model.entity.ProductVo;


/**
* 마이페이지(관리자) - 이벤트 경매 컨트롤러
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.14
*/
@Controller
@RequestMapping("/mp/mng")
public class MngActController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	/**
	* 이벤트 경매 
	* 
	* @param  String code - c : 이벤트 경매 등록 폼, R : 이벤트 경매 리스트
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/act", method = RequestMethod.GET)
	public ModelAndView getAct(String code) {
		log.debug("이벤트 경매 컨트롤러");
		
		ModelAndView mav = new ModelAndView();
		if(code.equals("R")) {
			//R : 이벤트 경매 리스트 서비스 작성
			
		}else if(code.equals("C")) {
			//C : 이벤트 경매 등록 폼
			return new ModelAndView("/mp/manager/mngActAdd");
		}
		mav.setViewName("/mp/manager/mngActList");
		return mav;
	}

	/**
	* 이벤트 경매 등록 
	* 
	* @param  ProductVo - 상품
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/act", method = RequestMethod.POST)
	public ModelAndView addAct(ProductVo bean) {
		log.debug("이벤트 경매 등록 컨트롤러");
		
		//이벤트 경매 서비스 작성
		
		ModelAndView mav = new ModelAndView("redirect:/mp/mng/act");
		return mav;
	}

}
