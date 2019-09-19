package com.me.rentalme.mp.user.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.me.rentalme.common.Paging;
import com.me.rentalme.cs.entity.CsVo;
import com.me.rentalme.model.entity.CallVo;
import com.me.rentalme.model.entity.UserVo;

@Repository
public class MpUserDaoImpl implements MpUserDao{

	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	SqlSession sqlSession;
	
	//주문내역 리스트
	@Override
	public List<CallVo> selectOrd(String mbNo) throws SQLException {
		return sqlSession.selectList("mpUser.selectOrd",mbNo);
	}
	
	//장바구니 리스트
	@Override
	public List<CallVo> selectCart(String mbNo) throws SQLException {
		return sqlSession.selectList("mpUser.selectCart",mbNo);
	}
	
	//장바구니 선택삭제
	@Override
	public void deleteCart(String gdsCd, String mbNo, String cartSeq) throws SQLException {
		Map<String, String> map=new HashMap<String, String>();
		map.put("gdsCd", gdsCd);
		map.put("mbNo", mbNo);
		map.put("cartSeq", cartSeq);
		
		//System.out.println("gdsCd:"+gdsCd+" mbNo:"+mbNo+" cartSeq:"+cartSeq);
		
		sqlSession.delete("mpUser.deleteCart",map);
	}
	
	//찜한상품 리스트
	@Override
	public List<CallVo> selectWish(String mbNo) throws SQLException {
		//log.debug("마이페이지(찜한상품) Dao");
		
		return sqlSession.selectList("mpUser.selectWish",mbNo);
	}

	//찜한상품 선택삭제
	@Override
	public void deleteWish(String usedGdsNo, String mbNo) throws SQLException {
		Map<String, String> map=new HashMap<String, String>();
		map.put("usedGdsNo", usedGdsNo);
		map.put("mbNo", mbNo);
		
		sqlSession.update("mpUser.deleteWish",map);
	}

	//후기등록
	@Override
	public int InsertReview(String gdsCd, String userId, String content,String grade, String odrNo,  String mbNo) throws SQLException {
		Map<String, String> map=new HashMap<String, String>();
		map.put("gdsCd", gdsCd);
		map.put("gdsCd", gdsCd);
		map.put("userId", userId);
		map.put("content", content);
		map.put("grade", grade);
		map.put("odrNo", odrNo);
		
		map.put("mbNo", mbNo);
		
		log.debug("gdscd="+gdsCd+", userId="+userId+", content="+content+", grade="+grade+ " 후기 입력 DaoImpl...");
		
		return sqlSession.insert("mpUser.insertReview",map);
	}

	//예치금 조회
	@Override
	public List<CallVo> selectDeposit(String mbNo) throws SQLException {
		
		return sqlSession.selectList("mpUser.selectDeposit",mbNo);
	}
	
	//예치금 충전
	@Override
	public int insertCharge(String userId, String depositGbCd, String chargeDeposit, String mbNo) throws SQLException {
		Map<String, String> map=new HashMap<String, String>();
		map.put("userId", userId);
		map.put("depositGbCd", depositGbCd);
		map.put("chargeDeposit", chargeDeposit);
		map.put("mbNo", mbNo);
		
		log.debug("userId="+userId+", depositGbCd="+depositGbCd+", chargeDeposit="+chargeDeposit+" 예치금 충전 입력 DaoImpl...");
		
		return sqlSession.insert("mpUser.inserDeposit",map);
	}

	//예치금 환불 요청 중복 확인
	@Override
	public int selectRefund(String mbNo) throws SQLException {
		return sqlSession.selectOne("mpUser.selectRefund",mbNo);
	}

	
	
	//예치금 환불 요청
	@Override
	public int refundCharge(String refund, String mbNo) throws SQLException {
		Map<String, String> map=new HashMap<String, String>();
		map.put("refund", refund);
		map.put("mbNo", mbNo);
		
		System.out.println("refund: "+refund);
		
		
		return sqlSession.insert("mpUser.refundDeposit",map);
	}
	
	
	@Override
	public void updateDeposit(String chargeDeposit, String mbNo) throws SQLException {
		Map<String, String> map=new HashMap<String, String>();
		map.put("chargeDeposit", chargeDeposit);
		map.put("mbNo", mbNo);
		
		sqlSession.selectList("mpUser.updateDeposit",map);
		
	}

	public List<CsVo> myQuestList(CsVo csVo,HttpSession session,int startListNum,int listSize) throws SQLException {
		Map<String, Object> map=new HashMap<String, Object>();
		//Map<String,Integer> map2=new HashMap<String,Integer>();
		String mbNo=(String)session.getAttribute("loginMbNo");
		System.out.println(mbNo+"dd");
		
		System.out.println("startListNum"+startListNum);
		System.out.println("listSize"+listSize);
		
		
		
		//map2.put("startListNum", startListNumber);
		//map2.put("listSize", listSized);
		
		map.put("mbNo",mbNo);
		map.put("startListNum", startListNum); 
		map.put("listSize", listSize);
		

		csVo.setMbNo(mbNo);
		System.out.println(csVo.getMbNo());
		System.out.println("sql로..");
		
		//sqlSession.selectList("csCenter.myQuestList", map);
		return sqlSession.selectList("csCenter.myQuestList",map);
		
	}

	@Override
	public CsVo myQuestDetail(CsVo csVo) throws SQLException {
		System.out.println("questDetail로..");
		
		return sqlSession.selectOne("csCenter.myQuestDetail", csVo);
	}

	@Override
	public int myQuestDel(CsVo csVo) throws SQLException {
		System.out.println("inq delete dao..");
		System.out.println("회원번호:"+csVo.getMbNo());
		System.out.println("게시물번호:"+csVo.getPquestNo());
		
		return sqlSession.delete("csCenter.myQuestDel", csVo);
	}


	@Override
	public CallVo selectUserInfo(String mbNo) throws SQLException {
		return sqlSession.selectOne("mpUser.selectInfoUser",mbNo);
	}

	@Override
	public UserVo selectMyInfo(String mbNo)  {
		log.debug("mbno:"+mbNo);
		return sqlSession.selectOne("mpUser.selectMyInfo",mbNo);
	}

	@Override
	public UserVo updateMyInfo(String mbNo,String userNm, String addr, String addrDetail) {
		log.debug("mbno:"+mbNo);
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("mbNo",mbNo);
		map.put("userNm",userNm);
		map.put("addr",addr);
		map.put("addrDetail",addrDetail);
		
		System.out.println("userNm="+userNm+", addr="+addr+", addrDetail="+addrDetail+" 내 정보 업데이트 DaoImpl...");
		return sqlSession.selectOne("mpUser.updateMyinfo",map);
	}

	@Override
	public UserVo getName(String mbNo) {
		
		return sqlSession.selectOne("mpUser.checkName",mbNo);
	}

	@Override
	public List<CallVo> selectAuct(String mbNo) throws SQLException {
		return sqlSession.selectList("mpUser.selectAuct",mbNo);
	}

	@Override
	public UserVo selectPw(String userId) {
		return sqlSession.selectOne("mpUser.selectPw",userId);
	}
	
	@Override
	public int updPw(String userId, String hashPw) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("userPw", hashPw);
		
		int result = sqlSession.update("mpUser.updPw", map);
		
		System.out.println("DB 결과 : "+result);
		
		return result;
	}

	@Override
	public int myInquiryListCnt(HttpSession session) throws SQLException {
		System.out.println("inq페이징 dao");
		String mbNo=(String)session.getAttribute("loginMbNo");
		session.getAttribute(mbNo);
		int cnt=0;
		cnt=sqlSession.selectOne("csCenter.myInquiryListCnt",mbNo);
		System.out.println("inq갯수:"+cnt);
		return cnt;
	}

}
