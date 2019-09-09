package com.me.rentalme.login.find.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.mindrot.jbcrypt.BCrypt;
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
			return loginFindDao.getId(email);
		}else {				//아이디가 없으면
			return list;
		}
	}
	
	/**
	* 비밀번호 찾기 - 데이터 검증
	* 
	* @param  UserVo userVo
	* @return boolean 
	* @author 황인준
	* 등록일자 : 2019-09-04
	*/
	@Override
	public String checkData(UserVo userVo) {
		log.debug("비밀번호 찾기 - 데이터 검증 service");
		
		if(!userVo.getEmail().equals("") && userVo.getEmail()!=null) {	//이메일찾기 인 경우
			String userId 	= userVo.getUserId();		//입력한 사용자 아이디
			String email	= userVo.getEmail();		//입력한 사용자 이메일
			
			int result = loginFindDao.checkPwEmail(userId, email);	//입력한 데이터를 체크
			
			if(result > 0) {	//데이터가 일치
				return "not empty";
			}else {				//데이터가 불일치
				return "empty";
			}	

		}else if(!userVo.getHp().equals("") && userVo.getHp()!=null) {	//핸드폰찾기 인 경우

		}		
		
		return "empty";
	}

	/**
	* 비밀번호 변경
	* 
	* @param  UserVo userVo
	* @return boolean 
	* @author 황인준
	* 등록일자 : 2019-09-04
	*/
	@Override
	public void modifyPw(UserVo userVo) {
		log.debug("비밀번호 변경 service");
		
		//비밀번호 변경시 암호화해서 변경한다.
		String userPw = BCrypt.hashpw(userVo.getUserPw(), BCrypt.gensalt()); 
		String userId = userVo.getUserId();
		String email  = userVo.getEmail();
		loginFindDao.updPw(userPw, userId, email);
	}
	
	
	
	

}
