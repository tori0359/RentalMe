package com.me.rentalme.act.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.me.rentalme.model.entity.ActResultVo;
import com.me.rentalme.model.entity.ActVo;
import com.me.rentalme.model.entity.RentalAppliVo;

@Repository
public class ActDaoImpl implements ActDao{

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ActVo> selectMngActList() throws SQLException {
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
	
	//경매 진행중 리스트
	@Override
	public List<RentalAppliVo> selectActRun() throws SQLException {
		return sqlSession.selectList("act.selectActRun");
	}

	//경매 종료된 리스트
	@Override
	public List<RentalAppliVo> selectActEnd() throws SQLException {
		return sqlSession.selectList("act.selectActEnd");
	}
	
	//경매 상세 페이지
	@Override
	public RentalAppliVo selectActDetail(String gdsCdDetail) throws SQLException {
		
		return sqlSession.selectOne("act.selectActDetail",gdsCdDetail);
	}

	//경매 상세 페이지2
	@Override
	public ActVo selectActDetail2(String gdsCdDetail) {
		return sqlSession.selectOne("act.selectActDetail2",gdsCdDetail);
	}
	
	@Override
	public List<ActVo> selectGoodsList(String goodsNum) throws SQLException {
		System.out.println("상품코드번호ㄱㄱ");
		
		System.out.println(goodsNum);
		return sqlSession.selectList("actRental.goodsList",goodsNum);
	}

	@Override
	public int insertActResult(ActResultVo bean) throws SQLException {
		return sqlSession.insert("act.insertActResult",bean);
	}

	@Override
	public int updateBidWin(String gdsCd) throws SQLException {
		return sqlSession.update("act.updateBidWin", gdsCd);
	}

	@Override
	public List<ActResultVo> SelectMngActSpec() throws SQLException {
		return sqlSession.selectList("act.SelectMngActSpec");
	}

	@Override
	public int updateMngBidCancel(String gdsCd) throws SQLException {
		return sqlSession.update("act.updateMngBidCancel", gdsCd);
	}

	@Override
	public int updateActEnd(String gdsCd) throws SQLException {
		return sqlSession.update("act.updateActEnd", gdsCd);
	}

	@Override
	public int selectMyMb(String mbno) throws SQLException {
		return sqlSession.selectOne("act.selectMyMb", mbno);
	}

}
