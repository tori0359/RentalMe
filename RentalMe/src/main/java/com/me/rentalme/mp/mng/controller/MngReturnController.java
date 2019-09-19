package com.me.rentalme.mp.mng.controller;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.me.rentalme.model.entity.RentalAppliVo;
import com.me.rentalme.mp.mng.service.MngService;
import com.me.rentalme.rental.Appli.service.RentalAppliService;

@Controller
@RequestMapping("/mp/mng/cart")
public class MngReturnController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	MngService mngService;
	
	@Inject
	RentalAppliService rentalAppliService; 
	
	/**
	 * @throws SQLException 
	* 반품내역
	* 
	* @param  
	* @return String 
	* @author 박재환
	* @exception 
	*/
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String getMngReturnList(Model model) throws SQLException {
		model.addAttribute("sub", "반품");
		model.addAttribute("alist", mngService.selectReturn());
		
		return "mp/manager/mngOrdList";
	}
	
	/**
	 * @throws SQLException 
	 * 반품확정으로 바꾸기
	 * 
	 * @param  
	 * @return String 
	 * @author 박재환
	 * @exception 
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String getMngReturnStsUdt(@RequestParam(value = "odrNo") String odrNo) throws SQLException {
		String[] array;
		array=odrNo.split(",");
		
		for(int i=0; i<array.length; i++) {
			mngService.updateStsRtn(array[i]);
		}
		
		return "redirect:/mp/mng/cart";
	}
	
	/**
	 * 주문관리> 반품확인
	 * 
	 * @param  
	 * @return String 
	 * @author 황태연
	 * @exception 
	 */
	@RequestMapping(value = "/decision", method = RequestMethod.POST) 
	public String modifyDecisionReturn(@RequestParam("crudGbCd")String crudGbCd, @RequestParam("odrGbCd")String odrGbCd, @RequestParam("odrNo")String odrNo,
			RentalAppliVo rentalAppliVo, Model model, HttpSession session ){
		
		System.out.println("crudGbCd"+crudGbCd);
		System.out.println("odrGbCd"+odrGbCd);
		System.out.println("odrNo"+odrNo);
		
		rentalAppliVo.setCrudGbCd(crudGbCd);
		rentalAppliVo.setOdrGbCd(odrGbCd);
		rentalAppliVo.setOdrNo(odrNo);
		rentalAppliVo.setMbNo((String) session.getAttribute("loginMbNo"));
		
		int result1 = rentalAppliService.decisionOdr(rentalAppliVo);			// 주문자료 생성
		model.addAttribute("rtnCd", Integer.toString(result1));
		return "redirect:/mp/mng/cart";
	}

}
