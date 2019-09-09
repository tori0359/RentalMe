package com.me.rentalme.mp.mng.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.me.rentalme.common.Paging;
import com.me.rentalme.model.entity.CallVo;
import com.me.rentalme.model.entity.DeclVo;
import com.me.rentalme.model.entity.MngOrdDetailVo;
import com.me.rentalme.model.entity.MngOrdVo;
import com.me.rentalme.model.entity.UsedVo;
import com.me.rentalme.model.entity.UserVo;

@Repository
public class MngDaoImpl implements MngDao{

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<MngOrdVo> selectOrd() throws SQLException {
		
		return sqlSession.selectList("mpMng.selectOrd");				//전체 주문리스트
	}

	@Override
	public List<MngOrdDetailVo> selectOrdOne(String ordNo) throws SQLException {
		return sqlSession.selectList("mpMng.selectOrdOne", ordNo);		//주문 상세보기
	}

	@Override
	public UserVo selectOrdOneInfo(String ordNo) throws SQLException {
		return sqlSession.selectOne("mpMng.selectOrdOneInfo", ordNo);	//주문자 정보보기
	}

	@Override
	public int updateStsPC(String ordNo) throws SQLException {
		return sqlSession.update("mpMng.updateStsPC", ordNo);			//상품상태 구매확정으로 바꾸기
	}

	@Override
	public List<CallVo> selectDep() throws SQLException {
		return sqlSession.selectList("mpMng.selectDep");		
	}

	@Override
	public List<CallVo> selectDepOne(String mbNo) throws SQLException {
		return sqlSession.selectList("mpMng.selectDepOne", mbNo);		//회원 예치금 상세
	}

	@Override
	public List<UsedVo> selectUsed(Paging usedPage) throws SQLException {
		return sqlSession.selectList("mpMng.selectUsed", usedPage);				//전체 중고 리스트
	}

	@Override
	public List<MngOrdVo> selectReturn() throws SQLException {
		return sqlSession.selectList("mpMng.selectReturn");				//전체 반품 리스트
	}

	@Override
	public int updateStsRtn(String ordNo) throws SQLException {
		return sqlSession.update("mpMng.updateStsRtn", ordNo);			//상품상태 반품확정으로 바꾸기
	}

	@Override
	public List<UsedVo> selectUsedSearch(String usedGdsNo) throws SQLException {
		return sqlSession.selectList("mpMng.selectUsedSearch", usedGdsNo);//중고 하나 선택
	}

	@Override
	public List<DeclVo> selectDecl(Paging usedPage) throws SQLException {
		return sqlSession.selectList("mpMng.selectDecl", usedPage);				//전체 신고 리스트
	}

	@Override
	public int changeDeclSts(String declNo) throws SQLException {
		return sqlSession.update("mpMng.changeDeclSts", declNo);		//신고상태 처리완료로 바꾸기
	}
	
	@Override
	public int selectusedListCnt() {
		return sqlSession.selectOne("mpMng.selectusedListCnt");			//중고리스트 총갯수
	}
	
}
