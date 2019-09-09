package com.me.rentalme.login.find.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.me.rentalme.model.entity.UserVo;

/**
* 아이디/비밀번호 찾기 Dao
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.28
*/
@Repository
public class LoginFindDaoImpl implements LoginFindDao {
	
	Logger log = LoggerFactory.getLogger(getClass());

	@Inject
	SqlSession sqlSession;
	/**
	* 입력한 이메일이 등록된 이메일인지 체크 (1개이상 : 등록된 아이디, 0개 : 등록된 아이디 x)
	* 
	* @param  String email : 이메일주소
	* @return String 
	* @author 황인준
	* @exception
	*/
	@Override
	public int checkEmail(String email) {
		log.debug("이메일로 아이디 유/무 체크 Dao");
		
		return sqlSession.selectOne("loginFind.checkId", email);
	}
	
	/**
	* 등록된 이메일로 아이디 찾기 - 아이디, 가입일자
	* 
	* @param  String email : 이메일주소
	* @return String 
	* @author 황인준
	* @exception
	*/	
	@Override
	public List<UserVo> getId(String email) {
		log.debug("이메일로 아이디 찾기 Dao");
		
		return sqlSession.selectList("loginFind.getId", email);
	}
	
	/**
	* 등록된 이메일로 비밀번호 찾기 
	* 
	* @param  String userId : 입력한 사용자 아이디 
	* @param  String email  : 입력한 사용자 이메일
	* @return int 
	* @author 황인준
	* @exception
	*/	
	@Override
	public int checkPwEmail(String userId, String email) {
		log.debug("등록된 이메일로 비밀번호 찾기 Dao");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("email", email);
		int result = sqlSession.selectOne("loginFind.checkPwEmail", map);
		return result;
	}

	/**
	* 비밀번호 변경 
	* 
	* @param  String userPw
	* @return void
	* @author 황인준
	* @exception
	*/
	@Override
	public int updPw(String userPw, String userId, String email) {
		log.debug("비밀번호 변경 Dao");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userPw", userPw);
		map.put("userId", userId);
		map.put("email", email);
		
		return sqlSession.update("loginFind.changePw", map);
		
	}

}
