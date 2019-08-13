package com.me.rentalme.join.model;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.me.rentalme.model.entity.UserVo;

/**
* @brief 회원가입 Dao 
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
		
		int result = sqlSession.insert("join.insertOne", bean);
		
		return result;
	}

}
