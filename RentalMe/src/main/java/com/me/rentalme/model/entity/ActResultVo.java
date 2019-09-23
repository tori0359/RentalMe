package com.me.rentalme.model.entity;

import java.sql.Date;

public class ActResultVo {
	private String gdsCd;					//상품코드
	private String actSeq;					//경매일련번호
	private String mbNo;					//회원번호
	private int bidPrice;					//응찰가격
	private String bidTime;					//응찰시간
	private String actBidStsCd;				//경매낙찰상태코드
	private String userId;					//유저아이디
	private String gdsStPrice;				//경매 초기값
	
	private String gdsNm;					// 상품명
	private String userNm;					// 사용자명
	private String odrNo;					// 주문번호
	private String payGbCd;					// 주문구분코드
	private String odrStsGbCd;				// 주문상태구분코드
	
	
	public String getGdsCd() {
		return gdsCd;
	}
	public void setGdsCd(String gdsCd) {
		this.gdsCd = gdsCd;
	}
	
	public String getActSeq() {
		return actSeq;
	}
	public void setActSeq(String actSeq) {
		this.actSeq = actSeq;
	}
	public String getMbNo() {
		return mbNo;
	}
	public void setMbNo(String mbNo) {
		this.mbNo = mbNo;
	}
	public int getBidPrice() {
		return bidPrice;
	}
	public void setBidPrice(int bidPrice) {
		this.bidPrice = bidPrice;
	}
	public String getBidTime() {
		return bidTime;
	}
	public void setBidTime(String bidTime) {
		this.bidTime = bidTime;
	}
	public String getActBidStsCd() {
		return actBidStsCd;
	}
	public void setActBidStsCd(String actBidStsCd) {
		this.actBidStsCd = actBidStsCd;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "ActResultVo [gdsCd=" + gdsCd + ", mbNo=" + mbNo + ", bidPrice=" + bidPrice + ", bidTime=" + bidTime
				+ ", actBidStsCd=" + actBidStsCd + ", userId=" + userId + "]";
	}
	public String getGdsNm() {
		return gdsNm;
	}
	public void setGdsNm(String gdsNm) {
		this.gdsNm = gdsNm;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getOdrNo() {
		return odrNo;
	}
	public void setOdrNo(String odrNo) {
		this.odrNo = odrNo;
	}
	public String getPayGbCd() {
		return payGbCd;
	}
	public void setPayGbCd(String payGbCd) {
		this.payGbCd = payGbCd;
	}
	public String getOdrStsGbCd() {
		return odrStsGbCd;
	}
	public void setOdrStsGbCd(String odrStsGbCd) {
		this.odrStsGbCd = odrStsGbCd;
	}
	public String getGdsStPrice() {
		return gdsStPrice;
	}
	public void setGdsStPrice(String gdsStPrice) {
		this.gdsStPrice = gdsStPrice;
	}
	
	
}
