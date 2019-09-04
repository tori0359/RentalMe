package com.me.rentalme.mp.mng.act.cotroller;

import java.sql.SQLException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.act.service.ActService;
import com.me.rentalme.model.entity.ActVo;
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
	
	@Inject
	ActService actService;
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	/**
	 * @throws SQLException 
	* 이벤트 경매 
	* 
	* @param  String code - c : 이벤트 경매 등록 폼, R : 이벤트 경매 리스트
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/actList", method = RequestMethod.GET)
	public ModelAndView getAct() throws SQLException{
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("actList", actService.listAct() );
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
	@RequestMapping(value = "/actInsertPage")
	public ModelAndView addActPage() {
		log.debug("이벤트 경매 등록 페이지 컨트롤러");
		
	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mp/manager/mngActAdd");
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
	@RequestMapping(value = "/actInsert", method = RequestMethod.POST)
	public ModelAndView addAct(ActVo actVo) {
		log.debug("이벤트 경매 등록 컨트롤러");
		
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("actInsert", actService);
		mav.setViewName("redirect:/mp/mng/actList");
		return mav;
	}
}
