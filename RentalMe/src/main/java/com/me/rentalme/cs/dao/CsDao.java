package com.me.rentalme.cs.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.me.rentalme.common.Paging;
import com.me.rentalme.cs.entity.CsVo;
import com.me.rentalme.cs.paging.Search;

public interface CsDao {

	//faq 리스트
	List<CsVo> faqSelectAll(Search search) throws SQLException;
	List<CsVo> faqselectAll(Map<String, Integer> map) throws SQLException;
	
	//공지 리스트
	List<CsVo> noticeSelectAll(Paging paging) throws SQLException;
	List<CsVo> noticeselectAll(Map<String, Integer> map) throws SQLException;
	
	//문의 리스트
	List<CsVo> inqSelectAll(Paging paging) throws SQLException;
	
	//게시글 총 갯수
	int faqListCnt(Search search) throws SQLException;
	int noticListCnt() throws SQLException;
	int inquiryListCnt() throws SQLException;
	int faqListCnt22(String csClassGbCd);
	
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
	
	List<CsVo> csFaqHeadList(Paging paging,String tapName) throws SQLException;
}
