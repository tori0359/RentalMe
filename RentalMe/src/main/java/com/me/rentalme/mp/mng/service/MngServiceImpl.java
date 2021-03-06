package com.me.rentalme.mp.mng.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.me.rentalme.common.Paging;
import com.me.rentalme.model.entity.CallVo;
import com.me.rentalme.model.entity.DeclVo;
import com.me.rentalme.model.entity.MngOrdDetailVo;
import com.me.rentalme.model.entity.MngOrdVo;
import com.me.rentalme.model.entity.UsedVo;
import com.me.rentalme.model.entity.UserVo;
import com.me.rentalme.mp.mng.dao.MngDao;

@Service
public class MngServiceImpl implements MngService {

	@Inject
	MngDao mngDao;
	
	
	@Override
	public List<MngOrdVo> selectOrd() throws SQLException {
		return mngDao.selectOrd();								//전체 주문 보기
	}

	@Override
	public List<MngOrdDetailVo> selectOrdOne(String ordNo) throws SQLException {
		return mngDao.selectOrdOne(ordNo);						//주문 상세 보기
	}

	@Override
	public UserVo selectOrdOneInfo(String ordNo) throws SQLException {
		return mngDao.selectOrdOneInfo(ordNo);					//주문자 정보보기
	}

	@Override
	public int updateStsPC(String ordNo) throws SQLException {
		return mngDao.updateStsPC(ordNo);						//상품상태 구매확정으로 바꾸기
	}

	@Override
	public List<CallVo> selectDep() throws SQLException {
		return mngDao.selectDep();								//예치금 리스트
	}

	@Override
	public List<CallVo> selectDepOne(String mbNo) throws SQLException {
		return mngDao.selectDepOne(mbNo);						//회원 예치금 상세
	}
	
	

	@Override
	public List<UsedVo> selectUsed(Paging usedPage) throws SQLException {
		return mngDao.selectUsed(usedPage);								//전체 중고 리스트
	}

	@Override
	public List<MngOrdVo> selectReturn() throws SQLException {
		return mngDao.selectReturn();							//전체 반품 리스트
	}

	@Override
	public int updateStsRtn(String ordNo) throws SQLException {
		return mngDao.updateStsRtn(ordNo);						//상품상태 반품확정으로 바꾸기
	}

	@Override
	public List<UsedVo> selectUsedSearch(String usedGdsNo) throws SQLException {
		return mngDao.selectUsedSearch(usedGdsNo);				//중고 하나 선택
	}

	@Override
	public List<DeclVo> selectDecl(Paging usedPage) throws SQLException {
		return mngDao.selectDecl(usedPage);								//전체 신고 리스트
	}

	@Override
	public int changeDeclSts(String declNo) throws SQLException {
		return mngDao.changeDeclSts(declNo);					//신고상태 처리완료로 바꾸기
	}
	
	@Override
	public int getUsedListCnt() {
		return mngDao.selectusedListCnt();
	}


}
