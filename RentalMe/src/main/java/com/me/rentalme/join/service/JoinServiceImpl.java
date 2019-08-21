package com.me.rentalme.join.service;

import java.text.SimpleDateFormat;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.me.rentalme.join.model.JoinDao;
import com.me.rentalme.model.entity.UserVo;

/**
* 회원가입 서비스
* 
* @author 황인준
* @version ver1.0
* @see 
*/
@Service
public class JoinServiceImpl implements JoinService{
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	JoinDao joinDao;

	/**
	* 회원정보 입력
	* 
	* @param  UserVo 
	* @return int result - 결과값
	* @author 황인준
	* @exception None
	*/
	@Override
	public int addInfo(UserVo bean) {
		log.debug("회원정보 입력 서비스...");
		
		String levelGbCd = "1"; //일반회원
		
		bean.setlevelGbCd(levelGbCd); //일반회원으로 등록
		
		//생년월일(yyyy-mm-dd to yyyymmdd)로 변경
		String birthDay = bean.getBirthDay(); 
		birthDay = birthDay.replace("-", "");
		bean.setBirthDay(birthDay);
		
		return joinDao.insertJoin(bean);
	}

}
