package com.me.rentalme.used.controller;

import java.sql.SQLException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.model.entity.UsedVo;
import com.me.rentalme.used.service.UsedService;


/**
* 중고거래 컨트롤러
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.18
*/
@Controller
@RequestMapping("/used")
public class UsedController {

	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	UsedService usedService;
	/**
	 * @throws SQLException 
	* 중고거래 리스트
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String getUsedList(Model model) throws SQLException {
		
		log.debug("중고거래 컨트롤러");
		UsedVo bean=new UsedVo();
		bean.setMODEL_NM("");
		bean.setGDS_MCLASS_CD("10");
		model.addAttribute("alist1", usedService.oneList(bean));
		bean.setGDS_MCLASS_CD("20");
		model.addAttribute("alist2", usedService.oneList(bean));
		bean.setGDS_MCLASS_CD("30");
		model.addAttribute("alist3", usedService.oneList(bean));
		bean.setGDS_MCLASS_CD("40");
		model.addAttribute("alist4", usedService.oneList(bean));
		bean.setGDS_MCLASS_CD("50");
		model.addAttribute("alist5", usedService.oneList(bean));
		
		return "used/usedList";
	}
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String getUsedListNM(Model model,@RequestParam("MODEL_NM") String MODEL_NM) throws SQLException {
		
		log.debug("중고거래 컨트롤러");
		UsedVo bean=new UsedVo();
		if(MODEL_NM==null) {
			MODEL_NM="";
		}
		bean.setMODEL_NM(MODEL_NM);
		bean.setGDS_MCLASS_CD("10");
		model.addAttribute("alist1", usedService.oneList(bean));
		bean.setGDS_MCLASS_CD("20");
		model.addAttribute("alist2", usedService.oneList(bean));
		bean.setGDS_MCLASS_CD("30");
		model.addAttribute("alist3", usedService.oneList(bean));
		bean.setGDS_MCLASS_CD("40");
		model.addAttribute("alist4", usedService.oneList(bean));
		bean.setGDS_MCLASS_CD("50");
		model.addAttribute("alist5", usedService.oneList(bean));
		
		return "used/usedList";
	}

	/**
	* 중고거래 상세보기
	* 
	* @param  int idx
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/detail/{idx}", method = RequestMethod.GET)
	public ModelAndView getUsedDetail(@PathVariable("idx") int idx) {
		
		
		ModelAndView mav = new ModelAndView("used/usedDetail");
		return mav;
	}
	
	/**
	* 나의 중고상점 리스트
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/store", method = RequestMethod.GET)
	public ModelAndView getUsedMyStroe() {
		
		
		ModelAndView mav = new ModelAndView("used/usedMyStore");
		return mav;
	}
	
	/**
	* 중고거래 상품등록 폼
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng", method = RequestMethod.GET)
	public ModelAndView getUsedPrd() {
		
		
		ModelAndView mav = new ModelAndView("used/usedMng");
		return mav;
	}
	
	/**
	 * @throws SQLException 
	* 중고거래 상품등록 
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng", method = RequestMethod.POST)
	public ModelAndView addUsedPrd(UsedVo bean) throws SQLException {
		
		// 시퀀스 1증가
		usedService.seqUp();
		usedService.addUsed(bean);
		
		ModelAndView mav = new ModelAndView("used/usedMyStore");
		return mav;
	}
	
	/**
	 * 중고거래 상품수정
	 * 
	 * @param  None
	 * @return ModelAndView 
	 * @author 황인준
	 * @exception 
	 */
	@RequestMapping(value = "/mng", method = RequestMethod.PUT)
	public ModelAndView modifyUsedPrd() {
		
		
		ModelAndView mav = new ModelAndView("used/usedMyStore");
		return mav;
	}

}
