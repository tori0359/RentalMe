package com.me.rentalme.rental.Appli.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.model.entity.RentalAppliVo;
import com.me.rentalme.rental.Appli.service.RentalAppliService;


/**
* 렌탈페이지 - 리스트, 상세보기
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.17
*/
@Controller
@RequestMapping("/rental/Appli/lg")
public class RentalAppliController {

	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	RentalAppliService rentalAppliService; 
	
	/**
	* 대형가전렌탈 리스트
	* 
	* @param  
	* @return String 
	* @author 황태연
	* @exception 
	*/
	
	@RequestMapping(value = "/{menu}", method = RequestMethod.GET)
	public String getLgList(@PathVariable("menu") String gdsSclassCd, @RequestParam(value="brandNm", required = false, defaultValue="") List<String> brandNm
			, @RequestParam(value="sts", required = false, defaultValue = "") String sts, @RequestParam(value="search", required = false, defaultValue = "") String search 
			, @RequestParam(value="searchPriceSt", required = false, defaultValue = ""  ) String searchPriceSt, @RequestParam(value="searchPriceEd", required = false, defaultValue = "") String searchPriceEd
			, @RequestParam(value="sort", required = false, defaultValue = "1") String sort
			, RentalAppliVo rentalAppliVo, Model model, HttpSession session) {
		
		// RequestParm 세션 셋팅
		session.removeAttribute("menu");
		session.setAttribute("menu", gdsSclassCd);
		session.removeAttribute("brandNm");
		session.setAttribute("brandNm", brandNm);
		session.removeAttribute("sts");
		session.setAttribute("sts", sts);
		session.removeAttribute("search");
		session.setAttribute("search", search);
		session.removeAttribute("searchPriceSt");
		session.setAttribute("searchPriceSt", searchPriceSt);
		session.removeAttribute("searchPriceEd");
		session.setAttribute("searchPriceEd", searchPriceEd);
		session.removeAttribute("sort");
		session.setAttribute("sort", sort);
		
//		System.out.println("=========구분1 시작=========");
//		System.out.println(brandNm.size());
//		System.out.println(rentalAppliVo.getBrandNm2());
//		System.out.println("=========구분1 끝=========");
		
		// Vo 셋팅
		rentalAppliVo.setGdsSclassCd(gdsSclassCd);
		if(brandNm.size() > 0 ) {
			rentalAppliVo.setBrandNm2(brandNm);
		}
		rentalAppliVo.setSts(sts);
		rentalAppliVo.setSearch(search);
		rentalAppliVo.setSearchPriceSt(searchPriceSt);
		rentalAppliVo.setSearchPriceEd(searchPriceEd);
		rentalAppliVo.setSort(sort);

//		System.out.println("=========구분2 시작=========");
//		System.out.println(brandNm.size());
//		System.out.println(rentalAppliVo.getBrandNm2());
//		System.out.println("=========구분2 끝=========");
		
		
		List<RentalAppliVo> path = rentalAppliService.rentalPath(rentalAppliVo);	//	PATH 경로
		List<RentalAppliVo> list1 = rentalAppliService.rentalMenu(rentalAppliVo);	//	소메뉴명 리스트
		List<RentalAppliVo> list2 = rentalAppliService.rentalOption(rentalAppliVo, "1");	//	옵션 브랜드명 리스트
		List<RentalAppliVo> list3 = rentalAppliService.rentalOption(rentalAppliVo, "2");	//	옵션 가격대 리스트
		List<RentalAppliVo> list4 = rentalAppliService.rentalBest(rentalAppliVo);	//	Best 캐러셀 상품리스트
		List<RentalAppliVo> list5 = rentalAppliService.rentalGds(rentalAppliVo, sort);	//상품리스트
		
		
//		path test 
//		System.out.println("getGubunCd 			== " + path.get(0).getGubunCd());
//		System.out.println("getGdsMclassNm 		== " + path.get(0).getGdsMclassNm());
//		System.out.println("getGdsSclassNm		== " + path.get(0).getGdsSclassNm());
		
//		session test
		System.out.println("-----------------session start ----------------------");
		System.out.println("sessionMenu			== " + session.getAttribute("menu"));
		System.out.println("sessionBrandnm  	== " + session.getAttribute("brandNm"));
		System.out.println("sessionSts  		== " + session.getAttribute("sts"));
		System.out.println("search  			== " + session.getAttribute("search"));
		System.out.println("searchPriceSt  		== " + session.getAttribute("searchPriceSt"));
		System.out.println("searchPriceEd  		== " + session.getAttribute("searchPriceEd"));
		System.out.println("sort		  		== " + session.getAttribute("sort"));
		System.out.println("-----------------session end ----------------------");
		
//		gds test
//		System.out.println("gdsCd				== " + list5.get(0).getGdsCd());
//		System.out.println("gdsLclassCd			== " + list5.get(0).getGdsLclassCd());
//		System.out.println("gdsMclassCd			== " + list5.get(0).getGdsMclassCd());
//		System.out.println("gdsSclassCd			== " + list5.get(0).getGdsSclassCd());
//		System.out.println("gdsNm				== " + list5.get(0).getGdsNm());
//		System.out.println("brandNm				== " + list5.get(0).getBrandNm());
//		System.out.println("modelNm				== " + list5.get(0).getModelNm());
//		System.out.println("mig1				== " + list5.get(0).getImg1());
//		System.out.println("regDt				== " + list5.get(0).getRegDt());
//		System.out.println("gdsPrice			== " + list5.get(0).getGdsPrice());

		
		model.addAttribute("path", path);
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);
		model.addAttribute("list5", list5);

		model.addAttribute("menu", session.getAttribute("menu"));
		model.addAttribute("brandNm", session.getAttribute("brandNm"));
		model.addAttribute("sts", session.getAttribute("sts"));
		model.addAttribute("search", session.getAttribute("search"));
		model.addAttribute("searchPriceSt", session.getAttribute("searchPriceSt"));
		model.addAttribute("searchPriceEd", session.getAttribute("searchPriceEd"));
		model.addAttribute("sort", session.getAttribute("sort"));
		
		return "rental/rentalAppliLgList";
	}
	
	/**
	 * 대형가전렌탈 상세보기
	 * 
	 * @param  int idx
	 * @return ModelAndView 
	 * @author 황인준
	 * @exception 
	 */
	/*
	@RequestMapping(value = "/lg/{idx}", method = RequestMethod.GET)
	public ModelAndView getLgDeatail(@PathVariable("idx") int idx) {
		log.debug("대형가전렌탈 상세보기 컨트롤러...");
		
		ModelAndView mav = new ModelAndView("rental/rentalDetail");
		return mav;
	}
	*/
	
	/**
	 * 소형가전렌탈 리스트
	 * 
	 * @param  
	 * @return ModelAndView 
	 * @author 황인준
	 * @exception 
	 */
	@RequestMapping(value = "/sm", method = RequestMethod.GET)
	public ModelAndView getSmList() {
		log.debug("대형가전렌탈 리스트 컨트롤러...");
		
		ModelAndView mav = new ModelAndView("rental/rentalAppliSmList");
		return mav;
	}	
	
	/**
	 * 소형가전렌탈 상세보기
	 * 
	 * @param  int idx
	 * @return ModelAndView 
	 * @author 황인준
	 * @exception 
	 */
	@RequestMapping(value = "/sm/{idx}", method = RequestMethod.GET)
	public ModelAndView getSmDeatail(@PathVariable("idx") int idx) {
		log.debug("소형가전렌탈 상세보기 컨트롤러...");
		
		ModelAndView mav = new ModelAndView("rental/rentalDetail");
		return mav;
	}	
	
	/**
	* 주방가전 리스트
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/kitc", method = RequestMethod.GET)
	public ModelAndView getKitcList() {
		log.debug("주방가전렌탈 리스트 컨트롤러...");
		
		ModelAndView mav = new ModelAndView("rental/rentalAppliKitcList");
		return mav;
	}	
	
	/**
	 * 주방가전 상세보기
	 * 
	 * @param  int idx
	 * @return ModelAndView 
	 * @author 황인준
	 * @exception 
	 */
	@RequestMapping(value = "/kitc/{idx}", method = RequestMethod.GET)
	public ModelAndView getKitcDeatail(@PathVariable("idx") int idx) {
		log.debug("주방가전렌탈 상세보기 컨트롤러...");
		
		ModelAndView mav = new ModelAndView("rental/rentalDetail");
		return mav;
	}
	
	/**
	* 가구렌탈 리스트
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/furn", method = RequestMethod.GET)
	public ModelAndView getFurnList() {
		log.debug("가구렌탈 리스트 컨트롤러...");
		
		ModelAndView mav = new ModelAndView("rental/rentalAppliFurnList");
		return mav;
	}	
	
	/**
	 * 가구렌탈 상세보기
	 * 
	 * @param  int idx
	 * @return ModelAndView 
	 * @author 황인준
	 * @exception 
	 */
	@RequestMapping(value = "/furn/{idx}", method = RequestMethod.GET)
	public ModelAndView getFurnDeatail(@PathVariable("idx") int idx) {
		log.debug("가구렌탈 상세보기 컨트롤러...");
		
		ModelAndView mav = new ModelAndView("rental/rentalDetail");
		return mav;
	}
	
	/**
	* 기타렌탈 리스트
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/rest", method = RequestMethod.GET)
	public ModelAndView getRestList() {
		log.debug("기타렌탈 리스트 컨트롤러...");
		
		ModelAndView mav = new ModelAndView("rental/rentalAppliRestList");
		return mav;
	}	
	
	/**
	 * 기타렌탈 상세보기
	 * 
	 * @param  int idx
	 * @return ModelAndView 
	 * @author 황인준
	 * @exception 
	 */
	@RequestMapping(value = "/rest/{idx}", method = RequestMethod.GET)
	public ModelAndView getRestDeatail(@PathVariable("idx") int idx) {
		log.debug("기타렌탈 상세보기 컨트롤러...");
		
		ModelAndView mav = new ModelAndView("rental/rentalDetail");
		return mav;
	}
	
	/**
	* 패키지렌탈 리스트
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/pkg", method = RequestMethod.GET)
	public ModelAndView getPkgList() {
		log.debug("패키지렌탈 리스트 컨트롤러...");
		
		ModelAndView mav = new ModelAndView("rental/rentalAppliPkgList");
		return mav;
	}	
	
	/**
	 * 패키지렌탈 상세보기
	 * 
	 * @param  int idx
	 * @return ModelAndView 
	 * @author 황인준
	 * @exception 
	 */
	@RequestMapping(value = "/pkg/{idx}", method = RequestMethod.GET)
	public ModelAndView getPkgDeatail(@PathVariable("idx") int idx) {
		log.debug("패키지렌탈 상세보기 컨트롤러...");
		
		ModelAndView mav = new ModelAndView("rental/rentalDetail");
		return mav;
	}
	
	
}
