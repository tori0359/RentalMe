package com.me.rentalme.login.find.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.me.rentalme.login.find.dao.LoginFindDao;
import com.me.rentalme.model.entity.UserVo;


/**
* 아이디/비밀번호 찾기 서비스
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.28
*/
@Service
public class LoginFindServiceImpl implements LoginFindService {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	LoginFindDao loginFindDao;
	
	/**
	* 등록된 이메일로 아이디 찾기
	* 
	* @param  String email : 이메일주소
	* @return String 
	* @author 황인준
	* @exception
	*/
	@Override
	public List<UserVo> getId(String email) {
		
		log.debug("등록된 이메일로 아이디 찾기 service");
		
		//입력한 이메일이 등록된 이메일인지 확인
		int result = loginFindDao.checkEmail(email);
		
		List<UserVo> list = new ArrayList<UserVo>();
		
		if(result > 0) {	//아이디가 있으면
			//System.out.println("리스트의 크기는(유)? : "+list.size());
			return loginFindDao.getId(email);
		}else {				//아이디가 없으면
			//System.out.println("리스트의 크기는?(무) : "+list.size());
			return list;
		}
	}

}
