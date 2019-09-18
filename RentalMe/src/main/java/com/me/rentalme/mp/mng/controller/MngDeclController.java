package com.me.rentalme.mp.mng.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	* @param  
	* @return String 
	* @author 박재환
	* @exception 
	*/
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String getMngDeclList(Model model) throws SQLException {
		mngService.getUsedListCnt(); 
		
		model.addAttribute("alist", mngService.selectDecl());
		return "mp/manager/mngDeclList";
	}
	
	/**
	 * @throws IOException 
	* 신고접수관리 - 처리완료 업데이트
	* 
	* @param  
	* @return String 
	* @author 박재환
	* @exception 
	*/
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String getMngDeclUdt(@RequestParam String declNo, HttpServletResponse res, HttpServletRequest req) throws SQLException, IOException{
		String[] array;
		array=declNo.split(",");
		
		for(int i=0; i<array.length; i++) {
			mngService.changeDeclSts(array[i]);
		}
		
//		res.setContentType("text/html; charset=utf-8");
//		PrintWriter out = res.getWriter();		
//		out.println("<script>alert(\"정상적으로 처리되었습니다.\"); location.href=\""+req.getContextPath()+"/mp/mng/decl\";</script>");
//		out.flush();
		
		return "redirect:/mp/mng/decl";
	}
	
}
