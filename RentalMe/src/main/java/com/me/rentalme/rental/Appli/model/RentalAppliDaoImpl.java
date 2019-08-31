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
	
	/* 경로 */
	@Override
	public List<RentalAppliVo> rentalPath(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.pathRetrive", rentalAppliVo);
	}
	
	/* 소메뉴 */
	@Override
	public List<RentalAppliVo> rentalMenuList(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.menuListRetrive", rentalAppliVo);
	}

	/* 옵션 */
	@Override
	public List<RentalAppliVo> rentalOptionList(RentalAppliVo rentalAppliVo, String option) {
		if(option.equals("1")) {
			// 렌탈 옵션 브랜드 : 1
			return sqlSession.selectList("rentalAppli.optionBrandListRetrive", rentalAppliVo);
		} else {
			// 렌탈 옵션 가격 : 2
			return sqlSession.selectList("rentalAppli.optionPriceListRetrive", rentalAppliVo);
		}
	}

	/* BEST 캐러셀 */
	@Override
	public List<RentalAppliVo> rentalBestList(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.bestListRetrive", rentalAppliVo);
	}

	/* 상품 2,3,4*/
	@Override
	public List<RentalAppliVo> rentalGdsList(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.gdsListRetrive", rentalAppliVo);
	}

	/* 상품 1,5,6 */
	public List<RentalAppliVo> rentalGdsList2(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.gdsListRetrive2", rentalAppliVo);
	}

}
