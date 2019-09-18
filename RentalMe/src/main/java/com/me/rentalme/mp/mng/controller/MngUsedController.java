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

import com.me.rentalme.common.Paging;
import com.me.rentalme.model.entity.UsedVo;
import com.me.rentalme.mp.mng.service.MngService;

@Controller
@RequestMapping("/mp/mng/used")
public class MngUsedController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	String path= "/mp/mng/used";
	@Inject
	MngService mngService;
	
	
	/**
	 * @throws SQLException 
	* 중고 리스트
	* 
	* @param  
	* @return String 
	* @author 박재환
	* @exception 
	*/
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String getMngUsedList(Model model, 
			@RequestParam(required = false, defaultValue = "1")int page, 
			@RequestParam(required = false, defaultValue = "1")int range,
			@RequestParam(required = false, defaultValue = "") String usedGdsNo) throws SQLException {
		System.out.println("중고리스트 : page ="+page+", range = "+range);
		UsedVo bean=new UsedVo();
		Paging usedPage = new Paging();
		bean.setStartListNum(usedPage.getstartListNum());
		bean.setListSize(usedPage.getListSize());
		bean.setUsedGdsNo(usedGdsNo);
		System.out.println(bean.getStartListNum()+"z"+bean.getListSize()+"z"+bean.getUsedGdsNo()+"z");
		System.out.println(bean.getUsedGdsNo().equals(""));
		//게시물의 총갯수를 구한다.
		int totalListCnt = mngService.getUsedListCnt(bean); 
		System.out.println(totalListCnt);
		
		usedPage.pageInfo(page, range, totalListCnt);
		model.addAttribute("path", path);
		model.addAttribute("paging", usedPage);
		model.addAttribute("alist", mngService.selectUsed(bean));
		return "mp/manager/mngUsedList";
	}
	/**
	 * @throws SQLException 
	 * 중고 검색
	 * 
	 * @param  
	 * @return String 
	 * @author 박재환
	 * @exception 
	 */
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String getMngUsedOne(Model model,@RequestParam(value = "usedGdsNo") String usedGdsNo) throws SQLException {
		model.addAttribute("path", path+"/search");
		model.addAttribute("alist", mngService.selectUsedSearch(usedGdsNo));
		return "mp/manager/mngUsedList";
	}
	
}
