package com.me.rentalme.mp.mng.cs.cotroller;

import java.sql.SQLException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.cs.entity.CsVo;
import com.me.rentalme.cs.service.CsService;
import com.me.rentalme.model.entity.ProductVo;


/**
* 고객센터 컨트롤러 - 공지/FAQ, 1:1문의
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.14
*/
@Controller
@RequestMapping("/mp/mng")
public class MngCsController {

	@Inject
	CsService csService;
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	/**
	 * @throws SQLException 
	* 공지/FAQ 
	* 
	* @param  String code - c : 공지/FAQ 등록 폼, R : 공지/FAQ 리스트
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/csNoticeList", method = RequestMethod.GET)
	public ModelAndView getCsNotice() throws SQLException {
		log.debug("공지/FAQ 컨트롤러");
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("mapping..");
		mav.addObject("alist", csService.csNoticeList());
		
		mav.setViewName("/mp/manager/mngCsList");
		return mav;
	}
	
	@RequestMapping(value = "/csFaqList", method = RequestMethod.GET)
	public ModelAndView getCsFaq() throws SQLException {
		log.debug("공지/FAQ 컨트롤러");
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("mapping..");
		mav.addObject("blist", csService.csFaqList());
		
		mav.setViewName("/mp/manager/mngCsFaqList");
		return mav;
	}
	

	/**
	 * @throws SQLException 
	*  공지/FAQ 등록
	* 
	* @param  ProductVo - 상품
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/csNoticeAdd", method = RequestMethod.POST)
	public ModelAndView addCs(CsVo csVo) throws SQLException {
		log.debug("공지/FAQ 등록 컨트롤러");
		//공지/FAQ 등록 서비스 작성
		
		if(csVo.getCsGbCd().equals("10")) {
			csService.seqNocUp();
		}
		if(csVo.getCsGbCd().equals("20")) {
			csService.seqFaqUp();
		}
		csService.addfaq(csVo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/mp/mng/csNoticeList");
		return mav;
	}
	
	@RequestMapping(value = "/csAdd")
	public ModelAndView addCs() {
		log.debug("공지/FAQ 등록 컨트롤러");
		//공지/FAQ 등록 서비스 작성
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mp/manager/mngCsAdd");
		return mav;
	}
	
	@RequestMapping(value="/noticeDelete", method=RequestMethod.POST)
	public ModelAndView listdel(@RequestParam("num") int num) throws SQLException {
		
		csService.noticDel(num);
		System.out.println(num);
		ModelAndView  mav=new ModelAndView("redirect:/mp/mng/csNoticeList");
		return mav;
	}
	
	/**
	* 1:1 문의
	* 
	* @param  String code - c : 1:1문의 등록 폼, R : 1:1문의 리스트
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/csQuest", method = RequestMethod.GET)
	public ModelAndView getCsQuest(String code) {
		log.debug("1:1문의 리스트 컨트롤러");
		
		ModelAndView mav = new ModelAndView();
		if(code.equals("R")) {
			//R : 1:1문의 리스트 서비스 작성
			
		}else if(code.equals("C")) {
			//C : 1:1문의 등록 폼
			return new ModelAndView("/mp/manager/mngCsQuestAdd");
		}
		mav.setViewName("/mp/manager/mngCsQuestList");
		return mav;
	}

	/**
	* 1:1 문의 등록  
	* 
	* @param  ProductVo - 상품
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/csQuest", method = RequestMethod.POST)
	public ModelAndView addCsQuest(ProductVo bean) {
		log.debug("1:1문의 등록 컨트롤러");
		
		//1:1문의 등록 서비스 작성
		
		ModelAndView mav = new ModelAndView("redirect:/mp/mng/csQuest");
		return mav;
	}
	
}
