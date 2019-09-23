package com.me.rentalme.cs.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.me.rentalme.common.Paging;
import com.me.rentalme.cs.dao.CsDao;
import com.me.rentalme.cs.entity.CsVo;
import com.me.rentalme.cs.paging.Search;
import com.me.rentalme.model.entity.UserVo;


@Service
public class CsServiceImpl implements CsService {

	@Inject
	CsDao csDao;
	
	HashMap<String, Object> map;
	
	//faq게시글 리스트(관리자)
	@Override
	public List<CsVo> csFaqList() throws SQLException {
		
		return csDao.faqSelectAll();
	}
	
	//faq게시글 리스트(일반)
	@Override
	public List<CsVo> csFaqList(Search search) throws SQLException {
		
		return csDao.faqSelectAll(search);
	}
	
	//공지게시글 리스트(관리자)
	@Override
	public List<CsVo> csNoticeList() throws SQLException {
		return csDao.noticeSelectAll();
	}
	
	//공지게시글 리스트(일반)
	@Override
	public List<CsVo> csNoticeList(Paging csPaging) throws SQLException {
		return csDao.noticeSelectAll(csPaging);
	}

	//문의
	@Override
	public List<CsVo> csInqList() throws SQLException {
		
		return csDao.inqSelectAll();
	}
	
	//faq게시글 상세
	@Override
	public CsVo csFaqDetail(CsVo csVo) throws SQLException {
		System.out.println("serviceImpl faq deta"+csVo.getFaqNo());
		return csDao.csFaqDetail(csVo);
	}
	//공지게시글 상세
	@Override
	public CsVo csNoticeDetail(CsVo csVo) throws SQLException {
		System.out.println("notice 상세 mapping");

		System.out.println("notice 상세 mapping end");
		return csDao.csNoticeDetail(csVo);
	}
	
	//문의 게시글 등록
	@Override
	public int addfaq(CsVo csVo) throws SQLException {
		return csDao.insertOne(csVo);
		
	}
	
	
	//게시물 수정
	@Override
	public int csUpdateOne(CsVo csVo) throws SQLException {
		
		System.out.println("service"+csVo.getCsGbCd());
		return csDao.updateOne(csVo);
	}
	
	
	//공지게시물 삭제
	@Override
	public String noticDel(String num) throws SQLException {
		
		int result = csDao.noticDel(num);
		String msg = "";
		
		if(result > 0) {
			msg = "success";
		}else {
			msg = "fail";
		}
		
		return msg;
	}
	
	//faq게시물 삭제
	@Override
	public String faqDel(String num) throws SQLException {
		int result = csDao.faqDel(num);
		String msg = "";
		
		if(result > 0) {
			msg = "success";
		}else {
			msg = "fail";
		}
		return msg;
	}


	@Override
	public int seqNocUp() throws SQLException {
		//공지사항 게시글 시퀀스
		return csDao.seqNocInsert();
	}
	@Override
	public int seqFaqUp() throws SQLException {
		//faq게시글 시퀀스
		return csDao.seqFaqInsert();
	}
	@Override
	public int seqInqUp() throws SQLException {
		//Inquiry 게시글 시퀀스
		System.out.println("service inq 시퀀스...");
		return csDao.seqInqInsert();
	}

	


	//답변여부
	@Override
	public int inqAnswer(String num) throws SQLException {
		// TODO Auto-generated method stub
		return csDao.inqAnswer(num);
	}

	//게시글 총 갯수
	@Override
	public int faqListCnt1(Search search) throws SQLException {
		System.out.println("페이징 service");
		return csDao.faqListCnt(search);
	}

	@Override
	public int noticListCnt() throws SQLException {
		return csDao.noticListCnt();
	}

	@Override
	public int inquiryListCnt() throws SQLException {
		return csDao.inquiryListCnt();
	}

	@Override
	public int faqListCnt22(String csClassGbCd) throws SQLException {
		return csDao.faqListCnt22(csClassGbCd);
	}

	@Override
	public List<CsVo> csFaqHeadList(Paging paging,String tapName) throws SQLException {
		
		return csDao.csFaqHeadList(paging,tapName);
	}

	@Override
	public UserVo userLevel(String userLevel) {
		
		return csDao.userLevel(userLevel);
	}

	@Override
	public int insertReply(CsVo csVo) {
		// TODO Auto-generated method stub
		return csDao.insertReply(csVo);
	}

	@Override
	public CsVo selectReply(String pquestNo) {
		// TODO Auto-generated method stub
		return csDao.selectReply(pquestNo);
	}

	

}
