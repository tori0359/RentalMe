package com.me.rentalme.rental.Appli.model;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.me.rentalme.model.entity.RentalAppliVo;



@Repository
public class RentalAppliDaoImpl implements RentalAppliDao {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<RentalAppliVo> rentalPath(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.selectPathRetrive", rentalAppliVo);
	}
	
	@Override
	public List<RentalAppliVo> rentalMenuList(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.selectMenuListRetrive", rentalAppliVo);
	}

	@Override
	public List<RentalAppliVo> rentalOptionList(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.selectOptionListRetrive", rentalAppliVo);
	}


}
