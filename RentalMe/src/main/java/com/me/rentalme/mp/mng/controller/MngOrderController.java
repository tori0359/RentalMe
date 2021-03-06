package com.me.rentalme.mp.mng.controller;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.me.rentalme.mp.mng.service.MngService;

@Controller
@RequestMapping("/mp/mng")
public class MngOrderController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	MngService mngService;
	
	
	/**
	 * @throws SQLException 
	* 주문내역
	* 
	* @param  
	* @return String 
	* @author 박재환
	* @exception 
	*/
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getMngOrderList(Model model) throws SQLException {
		model.addAttribute("sub", "주문");
		model.addAttribute("alist", mngService.selectOrd());
		
		return "mp/manager/mngOrdList";
	}
	
	/**
	 * @throws SQLException 
	* 주문상세내역
	* 
	* @param  
	* @return String 
	* @author 박재환
	* @exception 
	*/
	@RequestMapping(value = "/detail/{idx}", method = RequestMethod.GET)
	public String getMngOrderDetail(Model model,@PathVariable("idx") String ordNo) throws SQLException {
		model.addAttribute("ordNo", ordNo);
		model.addAttribute("alist", mngService.selectOrdOne(ordNo));
		model.addAttribute("info", mngService.selectOrdOneInfo(ordNo));
		return "mp/manager/mngOrdDetail";
	}
	
	/**
	 * @throws SQLException 
	 * 주문상세내역
	 * 
	 * @param  
	 * @return String 
	 * @author 박재환
	 * @exception 
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String getMngOrderUpdate(@RequestParam(value = "odrNo") String odrNo) throws SQLException {
		String[] array;
		array=odrNo.split(",");
		
		for(int i=0; i<array.length; i++) {
			mngService.updateStsPC(array[i]);
		}
		return "redirect:/mp/mng/list";
	}

}
