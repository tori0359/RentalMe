package com.me.rentalme.act.model;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.me.rentalme.model.entity.RentalAppliVo;

@Repository
public class ActDaoImpl implements ActDao{

	@Inject
	SqlSession sqlSession;
	
	//경매 진행중 리스트
	@Override
	public List<RentalAppliVo> selectActRun() throws SQLException {
		return sqlSession.selectList("act.selectActRun");
	}

}
