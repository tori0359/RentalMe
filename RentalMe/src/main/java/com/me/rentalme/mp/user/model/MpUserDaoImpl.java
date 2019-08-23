package com.me.rentalme.mp.user.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.me.rentalme.model.entity.CallVo;

@Repository
public class MpUserDaoImpl implements MpUserDao{

	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	SqlSession sqlSession;
	
	
	@Override
	public List<CallVo> selectOrd() throws SQLException {
		return sqlSession.selectList("mpUser.selectOrd");
	}
	
	
	@Override
	public List<CallVo> selectWish() throws SQLException {
		//log.debug("마이페이지(찜한상품) Dao");
		
		return sqlSession.selectList("mpUser.selectWish");
	}

	@Override
	public void deleteWish(CallVo callVo) throws SQLException {
		
		sqlSession.update("mpUser.delete");
	}

	

}
