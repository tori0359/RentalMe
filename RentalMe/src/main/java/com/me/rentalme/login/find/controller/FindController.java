package com.me.rentalme.login.find.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.login.find.service.LoginFindService;
import com.me.rentalme.model.entity.UserVo;

/**
* 아이디, 비밀번호 찾기 컨트롤러
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.14
*/
@Controller
public class FindController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	LoginFindService loginFindService; 
	
	/**
	* 등록된 핸드폰으로 아이디 찾기
	* 
	* @param  String hp : 핸드폰주소
	* @return List 
	* @author 황인준
	* @exception
	* 등록일자 : 2019-09-09 
	*/
	
	@RequestMapping(value = "/hpFindId", method = RequestMethod.POST)
	public @ResponseBody List<UserVo> findHpId(@RequestParam("hp") String hp) {
		log.debug("등록된 핸드폰으로 아이디 찾기 컨트롤러 ...");
		
		//수신동의 여부를 체크한다.
		List<UserVo> infoList = loginFindService.checkHpYn(hp);
		
		for(UserVo info : infoList) {
			System.out.println("사용자 아이디 : "+info.getUserId());
			System.out.println("사용자 가입일자 : "+info.getJoinDt());
		}

		return infoList;
	}
	
	/**
	 * 등록된 이메일로 아이디 찾기
	 * 
	 * @param  String email : 이메일주소
	 * @return List 
	 * @author 황인준
	 * @exception
	 * 등록일자 : 2019-08-14 
	 */
	
	@RequestMapping(value = "/emailFindId", method = RequestMethod.GET)
	public @ResponseBody List<UserVo> findEmailId(@RequestParam("email") String email) {
		log.debug("등록된 이메일로 아이디 찾기 컨트롤러 ...");
		
		
		//등록한 이메일로 사용자 정보를 가지고온다.
		List<UserVo> infoList = loginFindService.getId(email);
		
		return infoList;
		
	}
	
	/**
	* 비밀번호 찾기 데이터 체크
	* 
	* @param  UserVo
	* @return String 
	* @author 황인준
	* @exception
	* 등록일자 : 2019-09-04 
	* 수정일자 : 2019-09-27
	*/
	@RequestMapping(value = "/pwFind", method = RequestMethod.POST)
	public ModelAndView findEmailPw(@ModelAttribute UserVo userVo) {
		log.debug("등록된 이메일로 비밀번호 찾기 컨트롤러");
		
		
		//받아온 데이터가 맞는지 체크
		String str = loginFindService.checkData(userVo);
		
		ModelAndView mav = new ModelAndView("login/login");
		
		if(str.equals("not empty")) {							//이메일로 비밀번호 찾기인 경우
						
			mav.addObject("pwMsg", "notEmpty");
			if(userVo.getEmail() != null) {
				mav.addObject("pwEmail", userVo.getEmail());
			}
			
			if(userVo.getHp() != null) {						//핸드폰으로 비밀번호 찾기인 경우
				mav.addObject("pwHp", userVo.getHp());
			}
			mav.addObject("pwId", userVo.getUserId());
		}else if(str.equals("empty")) {
			mav.addObject("pwMsg", "empty");
		}
		
		return mav;
	}
	
	/**
	* 비밀번호 변경
	* 
	* @param  String userPw	- 비밀번호
	* @return String 
	* @author 황인준
	* @exception
	* 등록일자 : 2019-08-14 
	*/
	@RequestMapping(value = "/changePw", method = RequestMethod.POST)
	public String modifyChgPw(@ModelAttribute UserVo userVo) {
		log.debug("비밀번호 변경 컨트롤러...");
		
		loginFindService.modifyPw(userVo);
		
		return "redirect:/login";
	}
	
}
