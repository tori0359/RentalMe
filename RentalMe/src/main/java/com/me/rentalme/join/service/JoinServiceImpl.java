package com.me.rentalme.join.service;

import javax.inject.Inject;

import org.mindrot.jbcrypt.BCrypt;
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
	* 회원정보 시퀀스 추가
	* 
	* @param   
	* @return void
	* @author 황인준
	* @exception None
	*/
	@Override
	public void addMemNoSeq() {
		log.debug("회원번호 시퀀스 서비스");
		
		joinDao.insertMemnoSeq();
	}
	
	/**
	* 회원번호 조회
	* 
	* @param   
	* @return void
	* @author 황인준
	* @exception None
	*/
	@Override
	public String getMemNo() {
		log.debug("회원번호 조회 서비스");
		
		String memNo = joinDao.getMemNo();
		return memNo;
	}

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
		
		//회원번호 등록
		String memNo = getMemNo();
		bean.setMbNo(memNo);
		
		//비밀번호 암호화
		String hashPw = BCrypt.hashpw(bean.getUserPw(), BCrypt.gensalt());
		bean.setUserPw(hashPw);
		
		String levelGbCd = "1"; //일반회원
		bean.setLevelGbCd(levelGbCd); //일반회원으로 등록
		
		//핸드폰 수신여부
		if(bean.getHpYn() == null) {
			bean.setHpYn("N");
		}
		
		//이메일 키 난수코드 -> Y
		String emailKey = "Y";
		bean.setEmailKey(emailKey);
		
		//생년월일(yyyy-mm-dd to yyyymmdd)로 변경
		String birthDay = bean.getBirthDay(); 
		birthDay = birthDay.replace("-", "");
		bean.setBirthDay(birthDay);
		
		return joinDao.insertJoin(bean);
	}
	
	/**
	* 아이디 중복체크
	*
	* @param  String userId 
	* @return String msg (dupl - 중복, notDupl - 중복x)
	* @author 황인준
	* @exception None
	*/
	@Override
	public String getId(String userId) {
		log.debug("아이디 중복체크 서비스...");
		
		String msg = "";
		
		int result = joinDao.selectId(userId);
		if(result > 0) {
			msg = "dupl";		// 아이디 중복
		}else {
			msg = "notDupl";	// 아이디 중복 x
		}
		return msg;
	}

	/**
	* 회원예치금 초기화
	* 
	* @param  String mbNo - 사용자 회원번호
	* @return int
	* @author 박재환
	* @exception 
	*/
	@Override
	public int insertMb(String mbNo) {
		return joinDao.insertMb(mbNo);
	}




}