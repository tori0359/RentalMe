package com.me.rentalme.rental.Appli.model;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.me.rentalme.common.Paging;
import com.me.rentalme.model.entity.RentalAppliVo;



@Repository
public class RentalAppliDaoImpl implements RentalAppliDao {

	@Inject
	SqlSession sqlSession;
	
	/* 경로 */
	public List<RentalAppliVo> rentalPath(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.pathRetrive", rentalAppliVo);
	}
	
	/* 소메뉴 */
	public List<RentalAppliVo> rentalMenuList(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.menuListRetrive", rentalAppliVo);
	}

	/* 옵션 */
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
	public List<RentalAppliVo> rentalBestList(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.bestListRetrive", rentalAppliVo);
	}

	/* 상품 2,3,4*/
	public List<RentalAppliVo> rentalGdsList(RentalAppliVo rentalAppliVo ) {
		return sqlSession.selectList("rentalAppli.gdsListRetrive", rentalAppliVo);
	}

	/* 상품 1,5,6 */
	public List<RentalAppliVo> rentalGdsList2(RentalAppliVo rentalAppliVo ) {
		return sqlSession.selectList("rentalAppli.gdsListRetrive2", rentalAppliVo);
	}

	/* 점수 */
	public List<RentalAppliVo> rentalGrade(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.gradeRetrive", rentalAppliVo);
	}
	
	/* 상세정보 */
	public List<RentalAppliVo> rentalGdsListDetail(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.gdsListDetailRetrive", rentalAppliVo);
	}

	/* 상담등록 */
	public int rentalGdsQuest(RentalAppliVo rentalAppliVo) {
		// 상담시퀀스 생성
		sqlSession.insert("rentalAppli.questSeqProduce", rentalAppliVo);
		return sqlSession.insert("rentalAppli.gdsQuestRegister", rentalAppliVo);
	}

	/* 후기 */
	public List<RentalAppliVo> rentalReview(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.reviewRetrive", rentalAppliVo);
	}

	/* 후기갯수 */
	@Override
	public List<RentalAppliVo> rentalReviewCnt(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.reviewRetriveCnt", rentalAppliVo);
	}

	/* 장바구니등록 */
	public int rentalGdsCart(RentalAppliVo rentalAppliVo) {
		return sqlSession.insert("rentalAppli.gdsCartRegister", rentalAppliVo);
	}

	/* 상품결제(주문) */
	public int rentalGdsOdr(RentalAppliVo rentalAppliVo) {
		return sqlSession.insert("rentalAppli.gdsOdrRegister", rentalAppliVo);
	}

	/* 상품결제(주문상세) */
	public int rentalGdsDetailOdr(RentalAppliVo rentalAppliVo) {
		return sqlSession.insert("rentalAppli.gdsOdrDetailRegister", rentalAppliVo);
	}

	/* 상품 총갯수 2,3,4*/
	public List<RentalAppliVo> rentalGdsTotCntList(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.gdsListTotCntRetrive", rentalAppliVo);
	}
	
	/* 상품 총갯수 2,3,4*/
	public List<RentalAppliVo> rentalGdsTotCntList2(RentalAppliVo rentalAppliVo) {
		return sqlSession.selectList("rentalAppli.gdsListTotCntRetrive2", rentalAppliVo);
	}

	/* 장바구니 결제(주문) */
	public int cartOdr(RentalAppliVo rentalAppliVo) {
		return sqlSession.insert("rentalAppli.gdsOdrRegister", rentalAppliVo);
	}

	/* 장바구니 결제(주문상세) */
	public int cartDetailOdr(RentalAppliVo rentalAppliVo) {
		return sqlSession.insert("rentalAppli.gdsOdrDetailRegister", rentalAppliVo);
	}

	/* 주문내역 (구매/반품/입금확인/확정/반려) 주문상태코드에 따른 처리 */
	public int decisionOdr(RentalAppliVo rentalAppliVo) {
		return sqlSession.insert("rentalAppli.gdsOdrRegister", rentalAppliVo);
	}




}
