package com.me.rentalme.model;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.me.rentalme.model.entity.RentalMeVo;

@Repository
public class RentalMeDaoImpl implements RentalMeDao {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<RentalMeVo> selectAll() throws SQLException {
		return sqlSession.selectList("rentalme.selectAll");
	}

}
