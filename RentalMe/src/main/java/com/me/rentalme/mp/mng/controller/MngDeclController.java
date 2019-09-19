package com.me.rentalme.mp.mng.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.me.rentalme.common.Paging;
import com.me.rentalme.model.entity.DeclVo;
import com.me.rentalme.model.entity.UsedVo;
import com.me.rentalme.mp.mng.service.MngService;

@Controller
@RequestMapping("/mp/mng/decl")
public class MngDeclController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	@Inject
	MngService mngService;
	
		
	/**
	* 신고접수관리 - 리스트
	* 
	* @param  Model model
	* @param  String usedGdsNo
	* @return String 
	* @author 박재환
	* @exception 
	*/
	@RequestMapping(value = "", method = RequestMethod.GET)

	public String getMngDeclList(Model model,
			@RequestParam(required = false, defaultValue = "") String usedGdsNo) throws SQLException {		
		model.addAttribute("alist", mngService.selectDecl());
		return "mp/manager/mngDeclList";
	}
	
	/**
	 * @throws IOException 
	* 신고접수관리 - 처리완료 업데이트
	* 
	* @param  declList - view에서 넘어온 json형태의 체크된 값
	* @return String 
	* @author 황인준
	* 수정일자 : 2019-09-19
	*/
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String getMngDeclUdt(@RequestBody List<String> declList) throws SQLException, IOException{
				
		mngService.changeDeclSts(declList);
		
		return "redirect:/mp/mng/decl";
	}
	
}
