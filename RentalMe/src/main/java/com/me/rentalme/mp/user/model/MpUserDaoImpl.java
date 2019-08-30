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

import com.me.rentalme.cs.entity.CsVo;
import com.me.rentalme.model.entity.CallVo;

@Repository
public class MpUserDaoImpl implements MpUserDao{

	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	SqlSession sqlSession;
	
	
	@Override
	public List<CallVo> selectOrd() throws SQLException {
		return sqlSession.selectList("mpUser.selectOrd");
	}
	
	@Override
	public List<CallVo> selectCart() throws SQLException {
		return sqlSession.selectList("mpUser.selectCart");
	}
	
	@Override
	public List<CallVo> selectWish() throws SQLException {
		//log.debug("마이페이지(찜한상품) Dao");
		
		return sqlSession.selectList("mpUser.selectWish");
	}

	@Override
	public void deleteWish(CallVo callVo) throws SQLException {
		
		sqlSession.update("mpUser.delete");
	}


	@Override
	public int InsertReview(String gdsCd, String userId, String content,String grade) throws SQLException {
		Map<String, String> map=new HashMap<String, String>();
		map.put("gdsCd", gdsCd);
		map.put("userId", userId);
		map.put("content", content);
		map.put("grade", grade);
		
		log.debug("gdscd="+gdsCd+", userId="+userId+", content="+content+", grade="+grade+ " 후기 입력 DaoImpl...");
		
		return sqlSession.insert("mpUser.insertReview",map);
	}

	@Override
	public List<CallVo> selectDeposit() throws SQLException {
		
		return sqlSession.selectList("mpUser.selectDeposit");
	}

	@Override
	public int insertCharge(String userId, String depositGbCd, String chargeDeposit) throws SQLException {
		Map<String, String> map=new HashMap<String, String>();
		map.put("userId", userId);
		map.put("depositGbCd", depositGbCd);
		map.put("chargeDeposit", chargeDeposit);
		
		log.debug("userId="+userId+", depositGbCd="+depositGbCd+", chargeDeposit="+chargeDeposit+" 예치금 충전 입력 DaoImpl...");
		
		return sqlSession.insert("mpUser.inserDeposit",map);
	}

	@Override
	public List<CsVo> myQuestList(CsVo csVo,HttpSession session) throws SQLException {
		Map<String, String> map=new HashMap<String, String>();
		String mbNo=(String)session.getAttribute("loginMbNo");
		System.out.println(mbNo+"dd");
		map.put("mbNo",mbNo);
		csVo.setMbNo(mbNo);
		System.out.println(csVo.getMbNo());
		System.out.println("sql로..");
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


	

	

}
