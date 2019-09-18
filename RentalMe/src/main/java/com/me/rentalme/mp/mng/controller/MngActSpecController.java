package com.me.rentalme.mp.mng.controller;

import java.sql.SQLException;

import javax.inject.Inject;

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
import com.me.rentalme.mp.mng.service.MngService;

@Controller
@RequestMapping("/mp/mng/act/spec")
public class MngActSpecController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	String path= "/mp/mng/act/spec";
	@Inject
	ActService actService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String getMngActSpec(Model model,
			@RequestParam(required = false, defaultValue = "1")int page, 
			@RequestParam(required = false, defaultValue = "1")int range) throws SQLException {
		
		model.addAttribute("alist", actService.SelectMngActSpec());
		
		return "mp/manager/mngActSpec";
	}
	
	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
	public String getMngActSpecCancel(Model model,
			@RequestParam(required = false, defaultValue = "1")int page, 
			@RequestParam(required = false, defaultValue = "1")int range,
			@RequestParam("gdsCd") String gdsCd) throws SQLException {
		
		actService.updateMngBidCancel(gdsCd);
		actService.updateBidWin(gdsCd);
		
		
		return "redirect:/mp/mng/act/spec";
	}
}
