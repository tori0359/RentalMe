package com.me.rentalme.model.entity;

public class RefundVo {
	private String userNm;				//회원이름
	private String mbNo;				//회원번호
	private String depositRefundSeq;	//예치금환불일련번호
	private String depositRefundDt;		//예치금환불일자
	private int refundDeposit;			//환불예치금액
	private String depositRefundGbCd;	//예치금환불구분코드
	private String chgId;				//변경 아이디
	private String chgDt;				//변경 날짜
	private String regId;				//등록 아이디
	private String regDt;				//등록 날짜
	
	public RefundVo() {
	}

	public String getUserNm() {
		return userNm;
	}

	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}

	public String getMbNo() {
		return mbNo;
	}

	public void setMbNo(String mbNo) {
		this.mbNo = mbNo;
	}

	public String getDepositRefundSeq() {
		return depositRefundSeq;
	}

	public void setDepositRefundSeq(String depositRefundSeq) {
		this.depositRefundSeq = depositRefundSeq;
	}

	public String getDepositRefundDt() {
		return depositRefundDt;
	}

	public void setDepositRefundDt(String depositRefundDt) {
		this.depositRefundDt = depositRefundDt;
	}

	public int getRefundDeposit() {
		return refundDeposit;
	}

	public void setRefundDeposit(int refundDeposit) {
		this.refundDeposit = refundDeposit;
	}

	public String getDepositRefundGbCd() {
		return depositRefundGbCd;
	}

	public void setDepositRefundGbCd(String depositRefundGbCd) {
		this.depositRefundGbCd = depositRefundGbCd;
	}

	public String getChgId() {
		return chgId;
	}

	public void setChgId(String chgId) {
		this.chgId = chgId;
	}

	public String getChgDt() {
		return chgDt;
	}

	public void setChgDt(String chgDt) {
		this.chgDt = chgDt;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	@Override
	public String toString() {
		return "RefundVo [userNm=" + userNm + ", mbNo=" + mbNo + ", depositRefundSeq=" + depositRefundSeq
				+ ", depositRefundDt=" + depositRefundDt + ", refundDeposit=" + refundDeposit + ", depositRefundGbCd="
				+ depositRefundGbCd + ", chgId=" + chgId + ", chgDt=" + chgDt + ", regId=" + regId + ", regDt=" + regDt
				+ "]";
	}
	
}
