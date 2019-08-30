package com.me.rentalme.cs.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.me.rentalme.cs.entity.CsVo;


@Repository
public class CsDaoImpl implements CsDao {

	@Inject
	SqlSession sqlSession; 
	
	@Override
	public List<CsVo> faqSelectAll() throws SQLException {
		
		return sqlSession.selectList("csCenter.faqSelectAll");
	}

	
	//공지, faq 게시글 등록
	@Override
	public int insertOne(CsVo csVo) throws SQLException {
	
		System.out.println("mapping..");
		System.out.println("getcsGbCd:"+csVo.getCsGbCd());
		if(csVo.getCsGbCd().equals("10")){
			System.out.println(csVo.getCsGbCd());
			return sqlSession.insert("csCenter.csInsertNocOne",csVo);
		}else if(csVo.getCsGbCd().equals("20")){
			System.out.println(csVo.getCsGbCd());
			System.out.println(csVo.getCsClassGbCd());
			return sqlSession.insert("csCenter.csInsertFaqOne",csVo);
		}else if(csVo.getCsGbCd().equals("30")){
			System.out.println(csVo.getCsGbCd());
			System.out.println(csVo.getCsClassGbCd());
			return sqlSession.insert("csCenter.csInsertInqOne", csVo);
		}else {
			
			System.out.println(csVo.getCsGbCd()+2);
		}
		return 0;
	}
	
	//1대1문의 게시글 등록
	

	@Override
	public CsVo csFaqDetail(CsVo csVo) throws SQLException {
		System.out.println("dao.csFaqDetail..."+csVo.getFaqNo());
		System.out.println("dao.csFaqDetail..."+csVo.getCsGbCd());
		System.out.println("dao.csFaqDetail..."+csVo.getCsClassGbCd());
		return sqlSession.selectOne("csCenter.csFaqDetail", csVo);
	}

	@Override
	public int updateOne(CsVo csVo) throws SQLException {
		System.out.println("불러온다"+csVo.getCsGbCd()+"dd");
		System.out.println("??");
		if(csVo.getCsGbCd().equals("10")){
			System.out.println("notice수정으로");
			return sqlSession.update("csCenter.csNoticeUpdate", csVo);
		}
		else if(csVo.getCsGbCd().equals("20")){
			System.out.println("faq수정으로");
			return sqlSession.update("csCenter.csFaqUpdate", csVo);
		}
		return 0;
	}


	@Override
	public List<CsVo> faqselectAll(Map<String, Integer> map) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public List<CsVo> noticeSelectAll() throws SQLException {
		return sqlSession.selectList("csCenter.noticeSelectAll");
	}


	@Override
	public List<CsVo> inqSelectAll() throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("csCenter.inqSelectAll");
	}

	@Override
	public List<CsVo> noticeselectAll(Map<String, Integer> map) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public CsVo csNoticeDetail(CsVo csVo) throws SQLException {
		return sqlSession.selectOne("csCenter.csNoticeDetail", csVo);
	}



	//notice시퀀스
	@Override
	public int seqNocInsert() throws SQLException {
		return sqlSession.insert("csCenter.seqNocInsert");
	}
	
	// faq시퀀스
	@Override
	public int seqFaqInsert() throws SQLException {
		return sqlSession.insert("csCenter.seqFaqInsert");
	}
	
	//Inq시퀀스
	@Override
	public int seqInqInsert() throws SQLException {
		System.out.println("inq시퀀스 동작");
		return sqlSession.insert("csCenter.seqInqInsert");
	}



	@Override
	public int noticDel(String num) throws SQLException {
		
		return sqlSession.delete("csCenter.csNoticeDelete", num);
	}



	@Override
	public int faqDel(String num) throws SQLException {
		
		return sqlSession.delete("csCenter.csFaqDelete", num);
	}


	@Override
	public int inqAnswer(String num) throws SQLException {
		
		String pquestNo=num;
		return sqlSession.update("csCenter.inqAnswer", pquestNo);
	}








}