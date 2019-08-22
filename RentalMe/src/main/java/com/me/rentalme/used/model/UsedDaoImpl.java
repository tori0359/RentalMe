package com.me.rentalme.used.model;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.me.rentalme.model.entity.UsedVo;

public class UsedDaoImpl implements UsedDao {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<UsedVo> selectAll() throws SQLException {
		return sqlSession.selectList("used.selectAll");
	}
	
}
