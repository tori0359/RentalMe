package com.me.rentalme.mp.mng.controller;

import java.sql.SQLException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.me.rentalme.act.service.ActService;
import com.me.rentalme.common.Paging;
import com.me.rentalme.model.entity.DeclVo;
import com.me.rentalme.model.entity.RentalAppliVo;
import com.me.rentalme.mp.mng.service.MngService;
import com.me.rentalme.rental.Appli.service.RentalAppliService;

@Controller
@RequestMapping("/mp/mng/act/spec")
public class MngActSpecController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	String path= "/mp/mng/act/spec";
	@Inject
	ActService actService;
	@Inject
	RentalAppliService rentalAppliService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String getMngActSpec(Model model,
			@RequestParam(required = false, defaultValue = "1")int page, 
			@RequestParam(required = false, defaultValue = "1")int range) throws SQLException {
		
		model.addAttribute("alist", actService.SelectMngActSpec());
		
		return "mp/manager/mngActSpec";
	}
	
	/* 관리자 경매내역 취소 */
	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
	public String getMngActSpecCancel(Model model,
			@RequestParam(required = false, defaultValue = "1")int page, 
			@RequestParam(required = false, defaultValue = "1")int range,
			@RequestParam("gdsCd") String gdsCd) throws SQLException {
		
		actService.updateMngBidCancel(gdsCd);
		actService.updateBidWin(gdsCd);
		
		
		return "redirect:/mp/mng/act/spec";
	}
	
	
	/**
	 * 경매관리 입금확인
	 * 
	 * @param  
	 * @return String 
	 * @author 황태연
	 * @exception 
	 */
	@RequestMapping(value = "/decision", method = RequestMethod.POST) 
	public String modifyDecisionOdr(@RequestParam("crudGbCd")String crudGbCd, @RequestParam("odrGbCd")String odrGbCd, @RequestParam("odrNo")String odrNo,
			RentalAppliVo rentalAppliVo, Model model, HttpSession session ){
		
		rentalAppliVo.setCrudGbCd(crudGbCd);
		rentalAppliVo.setOdrGbCd(odrGbCd);
		rentalAppliVo.setOdrNo(odrNo);
		rentalAppliVo.setMbNo((String) session.getAttribute("loginMbNo"));
		
		int result1 = rentalAppliService.decisionOdr(rentalAppliVo);			// 주문자료 생성
		model.addAttribute("rtnCd", Integer.toString(result1));
		return "redirect:/mp/mng/act/spec";
	}
	
}
