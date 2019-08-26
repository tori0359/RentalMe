package com.me.rentalme.login.service;

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
* 수정일자 : 2019.08.26
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


}
