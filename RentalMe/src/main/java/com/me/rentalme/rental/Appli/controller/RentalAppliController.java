package com.me.rentalme.rental.Appli.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
@RequestMapping("/rental/Appli")
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
	
	@RequestMapping(value = "/lg/{menu}", method = RequestMethod.GET)
	public String getLgList(@PathVariable("menu") String gdsSclassCd, RentalAppliVo rentalAppliVo, Model model) {
		rentalAppliVo.setGdsSclassCd(gdsSclassCd);
		List<RentalAppliVo> path = rentalAppliService.rentalPath(rentalAppliVo);	//	PATH 경로
		List<RentalAppliVo> list1 = rentalAppliService.rentalList1(rentalAppliVo);	//	소메뉴명 리스트
		List<RentalAppliVo> list2 = rentalAppliService.rentalList2(rentalAppliVo);	//	옵션 브랜드명 리스트
		
		model.addAttribute("path", path);
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
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
