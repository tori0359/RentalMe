package com.me.rentalme.login.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.me.rentalme.model.entity.UserVo;

/**
* 로그인 Dao
* 
* @author 황인준
* @version ver1.0
* 등록일자 : 2019.08.26
* 수정일자 : 2019.08.27
*/
@Repository
public class LoginDaoImpl implements LoginDao {

	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	SqlSession sqlSession;
	
	/**
	* 아이디 체크
	* 
	* @param  String userId - 사용자 아이디
	* @return int
	* @author 황인준
	* @exception 
	*/
	@Override
	public UserVo getId(String userId) {
		log.debug("로그인 아이디 체크 Dao");
		
		return sqlSession.selectOne("login.checkId", userId);
	}

	/**
	* 비밀번호 입력 오류 횟수 추가
	* 
	* @param  int pwFailCnt - 입력비밀번호오류횟수
	* @param  String userId - 사용자 아이디
	* @return int
	* @author 황인준
	* @exception 
	*/
	@Override
	public int addPwFailCnt(int pwFailCnt, String userId) {
		log.debug("비밀번호 입력 오류 횟수 추가 Dao");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pwFailCnt", pwFailCnt);
		map.put("userId", userId);

		return sqlSession.update("login.pwFailCntAdd", map);
	}

	/**
	* 정지된 사용자로 변경
	* 
	* @param  String userId - 사용자 아이디
	* @return None
	* @author 황인준
	* @exception 
	*/
	@Override
	public void setUserBann(String userId) {
		log.debug("정지된 사용자로 변경 Dao");
		
		sqlSession.update("login.updUserBann", userId);
	}

	/**
	* 비밀번호 오류횟수 초기화
	* 
	* @param  String userId - 사용자 아이디
	* @return None
	* @author 황인준
	* @exception 
	*/
	@Override
	public void initPwFailCnt(String userId) {
		log.debug("비밀번호 오류횟수 초기화 Dao");
		
		sqlSession.update("login.initPwFailCnt", userId);		
	}

	/**
	* 로그인 유지
	* 
	* @param  String userId - 사용자 아이디
	* @param  String sessionKey - 세션쿠키값
	* @param  String sessionDt - 세션쿠키일자
	* @return None
	* @author 황인준
	* 등록일자 : 2019-09-01
	*/
	@Override
	public void keepLogin(String userId, String sessionKey, Date sessionDt) {
		Map<String, Object> map = new HashMap<String, Object>();
		log.debug("로그인 유지 Dao");
		
		map.put("userId", userId);			//사용자아이디
		map.put("sessionKey", sessionKey);	//세션쿠키값
		map.put("sessionDt", sessionDt);	//세션쿠키일자
						
		sqlSession.update("login.keepLogin", map);
	}

	/**
	* 세션쿠키값 체크
	* 
	* @param  String value
	* @return None
	* @author 황인준
	* 등록일자 : 2019-09-01
	*/
	@Override
	public UserVo checkLoginSessionKey(String value) {
		log.debug("세션쿠키값 체크 Dao");
		
		return sqlSession.selectOne("login.checkLoginSessionKey", value);
	}

}
