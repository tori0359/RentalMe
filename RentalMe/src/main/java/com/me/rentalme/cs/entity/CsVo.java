package com.me.rentalme.cs.entity;

import java.sql.Date;

public class CsVo {

	private String faqNo;  //faq 게시판 번호
	private String noticNo; //notic 게시판 번호
	private String csGbCd; //게시판 분류 번호
	private String csClassGbCd;  //faq유형 번호
	private String sub;    //제목
	private String content;//내용
	private String chgId;  
	private Date cghDt;
	private String regId;  //작성아이디
	private Date regDt;	   //등록날짜
	
	private String pquestNo; //1대1 게시글 번호
	private String pquestDt; //1대1 상담일자
	private String mbNo;	 //1대1 회원번호
	private String questStsCd; //1대1 상담처리코드
	
	private int startListNum;   //게시판 시작번호
	private int listSize;		//목록갯수
	private int cnt;			//글 전체 카운트
	
	
	
	public int getStartListNum() {
		return startListNum;
	}
	public void setStartListNum(int startListNum) {
		this.startListNum = startListNum;
	}
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(String faqNo) {
		this.faqNo = faqNo;
	}
	public String getNoticNo() {
		return noticNo;
	}
	public void setNoticNo(String noticNo) {
		this.noticNo = noticNo;
	}
	public String getCsGbCd() {
		return csGbCd;
	}
	public void setCsGbCd(String csGbCd) {
		this.csGbCd = csGbCd;
	}
	public String getCsClassGbCd() {
		return csClassGbCd;
	}
	public void setCsClassGbCd(String csClassGbCd) {
		this.csClassGbCd = csClassGbCd;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getChgId() {
		return chgId;
	}
	public void setChgId(String chgId) {
		this.chgId = chgId;
	}
	public Date getCghDt() {
		return cghDt;
	}
	public void setCghDt(Date cghDt) {
		this.cghDt = cghDt;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public Date getRegDt() {
		return regDt;
	}
	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}
	public String getPquestNo() {
		return pquestNo;
	}
	public void setPquestNo(String pquestNo) {
		this.pquestNo = pquestNo;
	}
	public String getPquestDt() {
		return pquestDt;
	}
	public void setPquestDt(String pquestDt) {
		this.pquestDt = pquestDt;
	}
	public String getMbNo() {
		return mbNo;
	}
	public void setMbNo(String mbNo) {
		this.mbNo = mbNo;
	}
	public String getQuestStsCd() {
		return questStsCd;
	}
	public void setQuestStsCd(String questStsCd) {
		this.questStsCd = questStsCd;
	}
	@Override
	public String toString() {
		return "CsVo [faqNo=" + faqNo + ", noticNo=" + noticNo + ", csGbCd=" + csGbCd + ", csClassGbCd=" + csClassGbCd
				+ ", sub=" + sub + ", content=" + content + ", chgId=" + chgId + ", cghDt=" + cghDt + ", regId=" + regId
				+ ", regDt=" + regDt + ", pquestNo=" + pquestNo + ", pquestDt=" + pquestDt + ", mbNo=" + mbNo
				+ ", questStsCd=" + questStsCd + "]";
	}
	
	
	
	
}
