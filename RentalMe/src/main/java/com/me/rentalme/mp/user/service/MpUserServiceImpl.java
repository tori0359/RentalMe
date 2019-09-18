package com.me.rentalme.mp.user.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.me.rentalme.common.Paging;
import com.me.rentalme.cs.entity.CsVo;
import com.me.rentalme.login.service.LoginService;
import com.me.rentalme.model.entity.CallVo;
import com.me.rentalme.model.entity.UserVo;
import com.me.rentalme.model.entity.UserVo;
import com.me.rentalme.mp.user.model.MpUserDao;

@Service
public class MpUserServiceImpl implements MpUserService{
	
	Logger log = LoggerFactory.getLogger(getClass());

	@Inject
	MpUserDao mpUserDao;
	
	@Inject
	LoginService loginService;
	
	//주문내역 리스트
	@Override
	public List<CallVo> ordList(String mbNo) throws SQLException {
		//log.debug("주문내역 서비스");
		
		return mpUserDao.selectOrd(mbNo);
	}
	
	//후기 등록
		@Override
		public int addReview(CallVo callVo, String mbNo) throws SQLException {
			log.debug("후기 등록 서비스...");
			
			
			return mpUserDao.InsertReview(callVo.getGdsCd(), callVo.getUserId(), callVo.getContent(), callVo.getGrade(),callVo.getOdrNo(),mbNo);
		}
	
	
	//장바구니 리스트
	@Override
	public List<CallVo> cartList(String mbNo) throws SQLException {
		return mpUserDao.selectCart(mbNo);
	}
	
	//장바구니 선택삭제
	@Override
	public void deleteCart(String gdsCd, String mbNo, String cartSeq) throws SQLException {
		mpUserDao.deleteCart(gdsCd,mbNo,cartSeq);
	}

	
	//찜한상품 리스트
	@Override
	public List<CallVo> wishList(String mbNo) throws SQLException {
		//log.debug("마이페이지(찜한상품) 서비스");
		
		return mpUserDao.selectWish(mbNo);
	}
	
	//찜한상품 삭제
	@Override
	public void deleteWish(String usedGdsNo,String mbNo) throws SQLException {
		
		mpUserDao.deleteWish(usedGdsNo,mbNo);
	}

	//예치금 리스트
	@Override
	public List<CallVo> depositList(String mbNo) throws SQLException {
		log.debug("예치금 리스트 서비스...");
		return mpUserDao.selectDeposit(mbNo);
	}
	
	//예치금 충전
	@Override
	public int insertCharge(CallVo callVo,String mbNo) throws SQLException {

		return mpUserDao.insertCharge(callVo.getUserId(), callVo.getDepositGbCd(), callVo.getChargeDeposit(),mbNo);
	}
	
	//예치금 환불 요청
	@Override
	public int refundCharge(String refund, String mbNo) throws SQLException {
		return mpUserDao.refundCharge(refund,mbNo);
		
	}
	
	//개인 1:1문의보기
	@Override
	public List<CsVo> myList(CsVo csVo,HttpSession session,int startListNum, int listSize) throws SQLException {
		System.out.println("dao로...");
		return  mpUserDao.myQuestList(csVo,session,startListNum,listSize);
	}
 
	//개인 1:1문의 상세
	@Override
	public CsVo myInqDetail(CsVo csVo) throws SQLException {
		System.out.println("1대1 상세 service");
		return mpUserDao.myQuestDetail(csVo);
	}

	//내 문의 삭제
	@Override
	public int myQuestDel(CsVo csVo) throws SQLException {
		
			return mpUserDao.myQuestDel(csVo);	
	}


	//현재 예치금 update
	@Override
	public void updateDeposit(String chargeDeposit, String mbNo) throws SQLException {
		
		mpUserDao.updateDeposit(chargeDeposit, mbNo);
		
	}

	@Override
	public CallVo userInfoList(String mbNo) throws SQLException {
		log.debug("현재예치금 서비스...");
		return mpUserDao.selectUserInfo(mbNo);
	}

	@Override
	public UserVo userInfo(String mbNo) throws SQLException {
		log.debug("내 정보 출력 서비스");
		return mpUserDao.selectMyInfo(mbNo);
	}

	@Override
	public UserVo myinfo(String mbNo,UserVo userVo) throws SQLException {
		log.debug("내 정보 수정 서비스...");
		return mpUserDao.updateMyInfo(mbNo, userVo.getUserNM(), userVo.getAddr(), userVo.getAddrDetail());
		
	}

	@Override
	public UserVo getName(String mbNo) throws SQLException {
		return mpUserDao.getName(mbNo);
	}

	@Override
	public List<CallVo> AuctList(String mbNo) throws SQLException {
		return mpUserDao.selectAuct(mbNo);
	}

	@Override
	public UserVo getInfo(String userId) throws SQLException {
		log.debug("로그인된 아이디의 비밀번호찾기...");
		return mpUserDao.selectPw(userId);
	}

	//
	@Override
	public String checkPw(String userId, String userPw) throws SQLException {
		log.debug("비밀번호 DB랑 확인");
		
		//DB저장된 정보
		UserVo userVo = loginService.getId(userId); 
		String targetPw = userVo.getUserPw();
		String msg = "";
		
		//입력한 비밀번호와 타겟비밀번호가 같은지 체크
		if(BCrypt.checkpw(userPw, targetPw)) {
			msg = "equals";
		}else {
			msg = "not equals";
		}
		
		return msg;
	}
	
	@Override
	public int changePw(String userId, String userPw) {
		
		//비밀번호 암호화
		String hashPw = BCrypt.hashpw(userPw, BCrypt.gensalt());
		
		int result = mpUserDao.updPw(userId, hashPw);
		
		System.out.println("service로 넘어온 값 : "+result);
		
		return result;
	}

	//내 문의 리스트 갯수
	@Override
	public int inquiryListCnt(HttpSession session) throws SQLException {
		
		return mpUserDao.myInquiryListCnt(session);
	}

}
