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
	
	/* °æ·Î */
	@Override
	public List<RentalAppliVo> rentalPath(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.pathRetrive", rentalAppliVo);
	}
	
	/* ¼Ò¸Þ´º */
	@Override
	public List<RentalAppliVo> rentalMenuList(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.menuListRetrive", rentalAppliVo);
	}

	/* ¿É¼Ç */
	@Override
	public List<RentalAppliVo> rentalOptionList(RentalAppliVo rentalAppliVo, String option) {
		if(option.equals("1")) {
			// ·»Å» ¿É¼Ç ºê·£µå : 1
			return sqlSession.selectList("rentalAppli.optionBrandListRetrive", rentalAppliVo);
		} else {
			// ·»Å» ¿É¼Ç °¡°Ý : 2
			return sqlSession.selectList("rentalAppli.optionPriceListRetrive", rentalAppliVo);
		}
	}

	/* BEST Ä³·¯¼¿ */
	@Override
	public List<RentalAppliVo> rentalBestList(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.bestListRetrive", rentalAppliVo);
	}

	/* »óÇ° */
	@Override
	public List<RentalAppliVo> rentalGdsList(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.gdsListRetrive", rentalAppliVo);
	}

}
