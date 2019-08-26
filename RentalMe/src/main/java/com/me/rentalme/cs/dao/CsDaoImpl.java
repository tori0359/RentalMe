package com.me.rentalme.cs.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.me.rentalme.cs.entity.CsVo;


@Repository
public class CsDaoImpl implements CsDao {

	@Inject
	SqlSession sqlSession; 
	
	@Override
	public List<CsVo> selectAll() throws SQLException {
		
		return sqlSession.selectList("csCenter.selectAll");
	}

	@Override
	public List<CsVo> selectAll(Map<String, Integer> map) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertOne(CsVo bean) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public int updateOne(CsVo bean) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOne(int idx) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CsVo csDetail(String faqNo) throws SQLException {
		
		return sqlSession.selectOne("csCenter.csDetail", faqNo);
		
	}

}
