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

import com.me.rentalme.mp.mng.service.MngService;

@Controller
@RequestMapping("/mp/mng/refund")
public class MngRefundController {
Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	MngService mngService;
	
	/**
	 * @throws SQLException 
	* 환불내역
	* 
	* @param  
	* @return String 
	* @author 박재환
	* @exception 
	*/
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String getMngRefundList(Model model) throws SQLException {
		model.addAttribute("alist", mngService.selectRefundList());
		return "mp/manager/mngDepositRefund";
	}
	
	/**
	 * @throws SQLException 
	* 환불 확정
	* 
	* @param  
	* @return String 
	* @author 박재환
	* @exception 
	*/
	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public String getMngRefundConfirm(Model model, @RequestParam("mbNo") String mbNo) throws SQLException {
		mngService.updateRefundConfirm(mbNo);
		return "redirect:/mp/mng/refund";
	}
	
	/**
	 * @throws SQLException 
	 * 환불 반려
	 * 
	 * @param  
	 * @return String 
	 * @author 박재환
	 * @exception 
	 */
	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
	public String getMngRefundCancel(Model model, @RequestParam("mbNo") String mbNo) throws SQLException {
		mngService.updateRefundCancel(mbNo);
		return "redirect:/mp/mng/refund";
	}
}
