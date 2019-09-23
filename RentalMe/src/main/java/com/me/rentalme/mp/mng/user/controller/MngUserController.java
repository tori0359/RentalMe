package com.me.rentalme.mp.mng.user.controller;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.common.Paging;
import com.me.rentalme.cs.entity.CsVo;
import com.me.rentalme.cs.service.CsService;
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
	
	@Inject
	CsService csService;
	
	@Inject
	MpUserService mpUserService;
	
	/**
	* 사용자 리스트
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* 등록일자 : 2019.09.11
	*/
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public ModelAndView getUserList() {
		log.debug("사용자 리스트 컨트롤러");
		
		
		//사용자 리스트 서비스
		List<UserVo> userInfo =  mngService.getUserInfo();
		
		ModelAndView mav = new ModelAndView("mp/manager/mngUserList");
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
	 * @throws SQLException 내 문의 상세
	 * 
	 * @param @return ModelAndView @author 강민수 @exception
	 */
	@RequestMapping(value = "/questDetail")
	public ModelAndView myQuestDetail(HttpSession session, CsVo csVo,@RequestParam("pquestNo") String pquestNo) throws SQLException {
		
		ModelAndView mav = new ModelAndView();
		String user = (String) session.getAttribute("loginUserId");
		String mbNo = (String) session.getAttribute("loginMbNo");
		UserVo userVo = csService.userLevel(mbNo);
		String userLevel = userVo.getLevelGbCd();
		System.out.println(userLevel);
		csVo.setPquestNo(pquestNo);
		
		csService.selectReply(csVo.getPquestNo());
		System.out.println("답글은..."+csVo.getReplyContent());
		mav.addObject("levelGbCd",userLevel);
		mav.addObject("bean", mpUserService.myInqDetail(csVo));
		mav.addObject("reply", csService.selectReply(csVo.getPquestNo()));
		mav.addObject("id", user);
		mav.setViewName("mp/manager/mngQuestDetail");
		return mav;
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
