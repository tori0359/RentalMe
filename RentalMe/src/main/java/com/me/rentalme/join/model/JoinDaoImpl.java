package com.me.rentalme.join.model;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.me.rentalme.model.entity.UserVo;

/**
* 회원가입 Dao
* 
* @author 황인준
* @version ver1.0
* @see 
*/
@Repository
public class JoinDaoImpl implements JoinDao {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	SqlSession sqlSession;
	
	/**
	* 회원정보 입력
	* 
	* @param  UserVo 
	* @return int result - 결과값(성공 : 1)
	* @author 황인준
	* @exception return("namespace.id명", 파라미터)
	*/
	@Override
	public int insertJoin(UserVo bean) {
		
		log.debug("회원정보 입력 Dao...");
		
		
		return sqlSession.insert("join.insertOne", bean);
	}

	/**
	* 이메일 인증 난수 생성
	* 
	* @param  
	* @return 
	* @author 황인준
	* @exception return("namespace.id명", 파라미터)
	*/
	@Override
	public int getKey(String userId, String key) {
		
		log.debug("이메일 인증 난수 생성 Dao...");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("emailKey", key);
		
		return sqlSession.update("join.updateKeyOne", map);
	}

	/**
	* 이메일 인증하기 완료 (이메일인증확인 컬럼 Y로 업데이트)
	* 
	* @param  
	* @return 
	* @author 황인준
	* @exception return("namespace.id명", 파라미터)
	*/
	@Override
	public int updEmailKey(String userId, String key) {
		
		log.debug("이메일 인증하기 상태(Y) 업데이트 Dao...");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("emailKey", key);
		
		return sqlSession.update("join.updateKeyYn", map);
	}

}
