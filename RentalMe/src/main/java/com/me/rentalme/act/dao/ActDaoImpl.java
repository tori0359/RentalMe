package com.me.rentalme.act.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.me.rentalme.model.entity.ActVo;

@Repository
public class ActDaoImpl implements ActDao {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ActVo> selectActList() throws SQLException {
		System.out.println("sql문으로 리스트뽑기");
		return sqlSession.selectList("actRental.actList");
	}

	@Override
	public int insertAct300(ActVo actVo) throws SQLException {
		System.out.println("insert sql300");
		return sqlSession.insert("actRental.actAdd300", actVo);
	}

	@Override
	public int insertAct100(ActVo actVo) throws SQLException {
		System.out.println("insert sql100");
		return sqlSession.insert("actRental.actAdd", actVo);
	}

}
