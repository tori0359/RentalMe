package com.me.rentalme.login.service;

import java.sql.Date;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.me.rentalme.login.dao.LoginDao;
import com.me.rentalme.model.entity.UserVo;

/**
* 로그인 서비스
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.13
* 수정일자 : 2019.08.27
*/
@Service
public class LoginServiceImpl implements LoginService {
	
	Logger log = LoggerFactory.getLogger(getClass());

	@Inject
	LoginDao loginDao; 
	
	/**
	* 입력한 로그인 아이디 체크
	* 
	* @param  UserVo
	* @return String 
	* @author 황인준
	* @exception none
	*/
	@Override
	public UserVo getId(String userId) {
		log.debug("로그인 아이디 체크");
		
		return loginDao.getId(userId);
	}

	/**
	* 비밀번호 오류횟수 1회 카운트
	* 
	* @param  int pwFailCnt
	* @param  String userId
	* @return String 
	* @author 황인준
	* @exception none
	*/
	@Override
	public int addPwFailCnt(int pwFailCnt, String userId) {
		log.debug("비밀번호 입력실패 오류횟수 1회 카운트 service");
		
		return loginDao.addPwFailCnt(pwFailCnt, userId);
	}

	/**
	* 정지사용자로 변경
	* 
	* @param  String userId
	* @return None 
	* @author 황인준
	* @exception none
	*/
	@Override
	public void setUserBann(String userId) {
		log.debug("정지 사용자로 변경 service");
		
		loginDao.setUserBann(userId);
	}

	/**
	* 비밀번호 오류횟수 초기화
	* 
	* @param  String userId
	* @return None 
	* @author 황인준
	* @exception none
	*/
	@Override
	public void initPwFailCnt(String userId) {
		log.debug("비밀번호 오류횟수 초기화 service");
		
		loginDao.initPwFailCnt(userId);
	}

	/**
	* 로그인 유지
	* 
	* @param  String userId		- 사용자아이디
	* @param  String sessionKey	- 세션쿠키값
	* @param  String sessionDt	- 세션쿠키일자
	* @return None 
	* @author 황인준
	* 등록일자 : 2019-09-01
	*/
	@Override
	public void keepLogin(String userId, String sessionKey, Date sessionDt) {
		log.debug("로그인 유지 service");
		
		loginDao.keepLogin(userId, sessionKey, sessionDt);
	}

	/**
	* 세션쿠키값 체크
	* 
	* @param  String userId
	* @return None 
	* @author 황인준
	* @exception none
	* 등록일자 : 2019-09-01
	*/
	@Override
	public UserVo checkLoginSessionKey(String value) {
		log.debug("세션쿠키값 체크 service");
		
		return loginDao.checkLoginSessionKey(value);
	}


}
