package com.me.rentalme.mp.mng.appli.controller;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.common.Paging;
import com.me.rentalme.model.entity.RentalAppliVo;

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
	
	String pagingPath="/mp";
	
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
	public ModelAndView getMainList(Model model,
			@RequestParam(required = false, defaultValue = "1")int page, @RequestParam(required = false, defaultValue = "1")int range) throws SQLException {
		
		log.debug("마이페이지(관리자) 메인 컨트롤러");
	 
		pagingPath="/mp";
		pagingPath+="/mng/goodsList";
		
		int listCnt=MngService.goodsListCnt();
		System.out.println("컬럼수"+listCnt);
		
		Paging apliPaging=new Paging();
		
		apliPaging.pageInfo(page, range, listCnt);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("rlist", MngService.selectGoodsList(apliPaging));
		model.addAttribute("pathPaging",pagingPath);
		model.addAttribute("paging", apliPaging);
		mav.setViewName("mp/manager/mngMainList");
		return mav;
	}
	
	
	
	/**
	 * @throws SQLException 
	* 마이페이지(관리자) - 대형가전 리스트
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng/Appli/lg", method = RequestMethod.GET)
	public ModelAndView getLgList(Model model,
			@RequestParam(required = false, defaultValue = "1")int page, @RequestParam(required = false, defaultValue = "1")int range) throws SQLException {
		log.debug("대형가전 리스트 컨트롤러");
		
		pagingPath="/mp";
		pagingPath+="/mng/Appli/lg";
		int listCnt=MngService.lGoodsListCnt();
		Paging apliPaging=new Paging();
		apliPaging.pageInfo(page, range, listCnt);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("rlist", MngService.lGoodsList(apliPaging));
		model.addAttribute("pathPaging",pagingPath);
		model.addAttribute("paging", apliPaging);
		mav.setViewName("mp/manager/mngAppliLgList");
		return mav;
	}
	
	/**
	 * @throws SQLException 
	* 마이페이지(관리자) - 소형가전 리스트
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng/Appli/sm", method = RequestMethod.GET)
	public ModelAndView getSmList(Model model,
			@RequestParam(required = false, defaultValue = "1")int page, @RequestParam(required = false, defaultValue = "1")int range) throws SQLException {
		log.debug("소형가전 리스트 컨트롤러");
		
		pagingPath="/mp";
		pagingPath+="/mng/Appli/sm";
		int listCnt=MngService.sGoodsListCnt();
		System.out.println("소형가전 컬럼 수"+listCnt);
		Paging apliPaging=new Paging();
		apliPaging.pageInfo(page, range, listCnt);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("rlist", MngService.sGoodsList(apliPaging));
		model.addAttribute("pathPaging",pagingPath);
		model.addAttribute("paging", apliPaging);
		mav.setViewName("mp/manager/mngAppliSmList");
		return mav;
	}
	
	/**
	 * @throws SQLException 
	*  마이페이지(관리자) - 주방용품 리스트
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng/Appli/kitc", method = RequestMethod.GET)
	public ModelAndView getKitcList(Model model,
			@RequestParam(required = false, defaultValue = "1")int page, @RequestParam(required = false, defaultValue = "1")int range) throws SQLException {
		log.debug("주방 리스트 컨트롤러");
		pagingPath="/mp";
		pagingPath+="/mng/Appli/kitc";
		int listCnt=MngService.kGoodsListCnt();
		System.out.println("주방가전 컬럼 수"+listCnt);
		Paging apliPaging=new Paging();
		apliPaging.pageInfo(page, range, listCnt);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("rlist", MngService.kGoodsList(apliPaging));
		model.addAttribute("pathPaging",pagingPath);
		model.addAttribute("paging", apliPaging);
		
		mav.setViewName("mp/manager/mngAppliKitcList");
		return mav;
	}
	
	/**
	 * @throws SQLException 
	*  마이페이지(관리자) - 가구 리스트
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng/Appli/furn", method = RequestMethod.GET)
	public ModelAndView getFurnList(Model model,
			@RequestParam(required = false, defaultValue = "1")int page, @RequestParam(required = false, defaultValue = "1")int range) throws SQLException {
		log.debug("가구 리스트 컨트롤러");
		
		
		pagingPath="/mp";
		pagingPath+="/mng/Appli/furn";
		int listCnt=MngService.fGoodsListCnt();
		System.out.println("가구 컬럼 수"+listCnt);
		Paging apliPaging=new Paging();
		apliPaging.pageInfo(page, range, listCnt);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("rlist", MngService.fGoodsList(apliPaging));
		model.addAttribute("pathPaging",pagingPath);
		model.addAttribute("paging", apliPaging);
		
		mav.setViewName("mp/manager/mngAppliFurnList");
		return mav;
	}
	
	/**
	 * @throws SQLException 
	*  마이페이지(관리자) - 기타 리스트
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng/Appli/rest", method = RequestMethod.GET)
	public ModelAndView getRestList(Model model,
			@RequestParam(required = false, defaultValue = "1")int page, @RequestParam(required = false, defaultValue = "1")int range) throws SQLException {
		log.debug("기타 리스트 컨트롤러");


		pagingPath="/mp";
		pagingPath+="/mng/Appli/rest";
		int listCnt=MngService.otherGoodsListCnt();
		System.out.println("기타가전 컬럼 수"+listCnt);
		Paging apliPaging=new Paging();
		apliPaging.pageInfo(page, range, listCnt);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("rlist", MngService.otherGoodsList(apliPaging));
		model.addAttribute("pathPaging",pagingPath);
		model.addAttribute("paging", apliPaging);
		
		mav.setViewName("mp/manager/mngAppliRestList");
		return mav;
	}
	
	/**
	 * @throws SQLException 
	*  마이페이지(관리자) - 패키지 리스트
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng/Appli/pkg", method = RequestMethod.GET)
	public ModelAndView getPkgList(Model model,
			@RequestParam(required = false, defaultValue = "1")int page, @RequestParam(required = false, defaultValue = "1")int range) throws SQLException {
		log.debug("패키지 리스트 컨트롤러");
		

		pagingPath="/mp";
		pagingPath+="/mng/Appli/pkg";
		int listCnt=MngService.pacGoodsListCnt();
		System.out.println("패키지가전 컬럼 수"+listCnt);
		Paging apliPaging=new Paging();
		apliPaging.pageInfo(page, range, listCnt);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("rlist", MngService.pacGoodsList(apliPaging));
		model.addAttribute("pathPaging",pagingPath);
		model.addAttribute("paging", apliPaging);
		
		mav.setViewName("mp/manager/mngAppliPkgList");
		return mav;
	}
	
	//렌탈상품 선택삭제
		@RequestMapping(value = "/mng/deleteAppliList", method = RequestMethod.POST)
		public ModelAndView deleteCart(@RequestParam(value = "chbox[]") List<String> chArr
				,RentalAppliVo rentalAppliVo) throws SQLException {
		
			System.out.println("경매상품 삭제 컨트롤러");
			
			ModelAndView mav=new ModelAndView();

			for (String gdsCd : chArr) {
				rentalAppliVo.setGdsCd(gdsCd);
				
				MngService.deleteAppli(gdsCd);
			}

			mav.setViewName("/mp/manager/mngMainList");
			return mav;
		}

	
}
