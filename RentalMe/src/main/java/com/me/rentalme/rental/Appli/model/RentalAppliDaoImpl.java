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
	public List<RentalAppliVo> rentalOptionList(String gdsSclassCd) {
		System.out.println("hty333");
		System.out.println(gdsSclassCd);
		return sqlSession.selectList("rentalAppli.selectOptionListRetrive", gdsSclassCd);
	}

}
