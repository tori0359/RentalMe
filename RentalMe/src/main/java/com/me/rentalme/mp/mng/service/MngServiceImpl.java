package com.me.rentalme.mp.mng.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
import com.thoughtworks.qdox.parser.ParseException;

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
	
	/**
	* 사용자 리스트 service
	* 
	* @param  None
	* @return List - 사용자정보 
	* @author 황인준
	* 등록일자 : 2019.09.11
	*/	
	@Override
	public List<UserVo> getUserInfo() {
		List<UserVo> userInfo = mngDao.selectUserList();
		
		for(UserVo userVo : userInfo) {
			//성별(1:남 2:여)
			if(userVo.getGenderGbCd().equals("1")) {
				userVo.setGenderGbCd("남");
			}else if(userVo.getGenderGbCd().equals("2")) {
				userVo.setGenderGbCd("여");
			}else {
				userVo.setGenderGbCd("x");
			}
			
			//사용자상태코드(1:정상, 2:정지[비밀번호오류횟수 5회 초과], 3:삭제(탈퇴))
			if(userVo.getUserStsCd().equals("1")) {
				userVo.setUserStsCd("정상");
			}else if(userVo.getUserStsCd().equals("2")){
				userVo.setUserStsCd("정지");
			}else if(userVo.getUserStsCd().equals("3")){
				userVo.setUserStsCd("삭제");
			}else {
				userVo.setUserStsCd("x");
			}
			
		}

		return userInfo;
	}
	
	/**
	* 사용자 탈퇴하기 service
	* 
	* @param  String mbNo - 회원번호
	* @return void 
	* @author 황인준
	* 등록일자 : 2019.09.15
	*/	
	@Override
	public String delUserInfo(String mbNo) {
		
		int result = mngDao.updUserinfo(mbNo);
		String msg = "";
		
		if(result > 0) {
			msg = "success";
		}else {
			msg = "fail";
		}
		
		return msg;
	}

	/**
	* 사용자 상세정보 service
	* 
	* @param  String mbNo - 회원번호
	* @return UserVo - 사용자정보 
	* @author 황인준
	* 등록일자 : 2019.09.15
	*/
	@Override
	public UserVo getUserDetail(String mbNo) {
		
		return mngDao.selectUserDetail(mbNo);
	}

	/**
	* 사용자 총인원 조회 service
	* 
	* @param  
	* @return int - 총인원 수 
	* @author 황인준
	* 등록일자 : 2019.09.16
	*/
	@Override
	public int getMngUserListCnt() {
		return mngDao.selectMngUserListCnt();
	}


}
