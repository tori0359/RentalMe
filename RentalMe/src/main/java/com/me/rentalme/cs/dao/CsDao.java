package com.me.rentalme.cs.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.me.rentalme.common.Paging;
import com.me.rentalme.cs.entity.CsVo;

public interface CsDao {

	//faq 리스트
	List<CsVo> faqSelectAll(Paging paging) throws SQLException;
	List<CsVo> faqselectAll(Map<String, Integer> map) throws SQLException;
	
	//공지 리스트
	List<CsVo> noticeSelectAll() throws SQLException;
	List<CsVo> noticeselectAll(Map<String, Integer> map) throws SQLException;
	List<CsVo> inqSelectAll() throws SQLException;
	int faqListCnt() throws SQLException;
	
	
	//faq 상세
	CsVo csFaqDetail(CsVo csVo) throws SQLException;	
	
	//공지 상세
	CsVo csNoticeDetail(CsVo csVo) throws SQLException;
	
	//게시판 시퀀스
	int seqNocInsert() throws SQLException;
	int seqFaqInsert() throws SQLException;
	int seqInqInsert() throws SQLException;
	
	int insertOne(CsVo csVo) throws SQLException;
	
	
	int updateOne(CsVo csVo) throws SQLException;
	int noticDel(String num) throws SQLException;
	int faqDel(String num) throws SQLException;
	int inqAnswer(String num) throws SQLException;
}
