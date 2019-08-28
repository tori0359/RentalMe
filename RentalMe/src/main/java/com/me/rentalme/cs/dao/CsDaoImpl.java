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

	

	@Override
	public int insertOne(CsVo csVo) throws SQLException {
	
		System.out.println("mapping..");
		if(csVo.getCsGbCd().equals("10")){
			System.out.println(csVo.getCsGbCd());
			return sqlSession.insert("csCenter.csInsertNocOne",csVo);
		}else if(csVo.getCsGbCd().equals("20")){
			System.out.println(csVo.getCsGbCd());
			return sqlSession.insert("csCenter.csInsertFaqOne",csVo);
		}else {
		System.out.println(csVo.getCsGbCd()+2);
		return 0;
		}
	}


	@Override
	public CsVo csFaqDetail(Map<String, Object> map) throws SQLException {
		System.out.println(map.get("faqNo"));
		System.out.println(map.get("csClassGbCd"));
		return sqlSession.selectOne("csCenter.csFaqDetail", map);
		
	}

	@Override
	public int updateOne(CsVo bean) throws SQLException {
		
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
	public List<CsVo> noticeselectAll(Map<String, Integer> map) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public CsVo csNoticeDetail(Map<String, Object> map) throws SQLException {
		System.out.println(map.get("faqNo"));
		System.out.println(map.get("csClassGbCd"));
		return sqlSession.selectOne("csCenter.csNoticeDetail", map);
	}



	@Override
	public int seqNocInsert() throws SQLException {
		//notice½ÃÄö½º
		return sqlSession.insert("csCenter.seqNocInsert");
	}
	@Override
	public int seqFaqInsert() throws SQLException {
		// faq½ÃÄö½º
		return sqlSession.insert("csCenter.seqFaqInsert");
	}



	@Override
	public int noticDel(int num) throws SQLException {
		
		return sqlSession.delete("csCenter.csNoticeDelete", num);
	}



}