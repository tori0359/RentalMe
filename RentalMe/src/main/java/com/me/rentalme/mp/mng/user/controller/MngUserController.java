package com.me.rentalme.mp.mng.user.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.common.Paging;
import com.me.rentalme.model.entity.UserVo;
import com.me.rentalme.mp.mng.service.MngService;
import com.me.rentalme.mp.user.service.MpUserService;

/**
* 마이페이지(관리자) - 사용자관리
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.14
* 수정일자 : 2019.09.11
*/
@Controller
@RequestMapping("/mp/mng")
public class MngUserController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	String path= "/mp/mng";
	
	@Inject
	MngService mngService; 
	
	/**
	* 사용자 리스트
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* 등록일자 : 2019.09.11
	*/
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public ModelAndView getUserList(@RequestParam(required = false, defaultValue = "1")int page, @RequestParam(required = false, defaultValue = "1")int range) {
		log.debug("사용자 리스트 컨트롤러");
		
		
		int totalUserCnt = mngService.getMngUserListCnt(); 
				
		Paging mngUserPage = new Paging();
		
		mngUserPage.pageInfo(page, range, totalUserCnt);
		
		
		//사용자 리스트 서비스
		List<UserVo> userInfo =  mngService.getUserInfo(mngUserPage);
		
		ModelAndView mav = new ModelAndView("mp/manager/mngUserList");
		mav.addObject("path", path+"/userList");
		mav.addObject("paging", mngUserPage);
		mav.addObject("userInfo", userInfo);
		return mav;
	}

	/**
	* 사용자 상세정보
	* 
	* @param  String mbNo - 회원번호
	* @return UserVo 
	* @author 황인준
	* 등록일자 : 2019-09-15
	*/
	@RequestMapping(value = "UserDetail", method = RequestMethod.POST)
	public @ResponseBody UserVo getUserDetail(@RequestParam String mbNo) {
		log.debug("사용자 상세정보 컨트롤러");
		
		//사용자 상세정보 서비스 작성
		UserVo userVo = mngService.getUserDetail(mbNo);
		
				
		return userVo;
	}
	
	/**
	* 사용자 탈퇴하기
	* (이슈사항 : id를 primarykey로 잡고 있기 때문에 ''로 업데이트 시 키중복 오류가 남)
	* @param  String mbNo - 회원번호
	* @return String  
	* @author 황인준
	* 등록일자 : 2019-09-15
	* 
	*/	
	@RequestMapping(value="/userLeave", method = RequestMethod.POST)
	public @ResponseBody String removeUserLeave(@RequestParam String mbNo) {
		log.debug("사용자 탈퇴하기");
		
		//사용자 탈퇴하기
		String msg = mngService.delUserInfo(mbNo);
		
		return msg;
	}

}
