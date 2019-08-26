package com.me.rentalme.login.dao;

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
* 수정일자 : 2019.08.26
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

}
