package com.me.rentalme.model.entity;

import java.sql.Date;
//중고답글
public class UsedReCmtVo {
	private String usedGdsNo;		// 중고상품번호
	private String usedGdsComtNo;	// 중고상품댓글번호
	private String usedGdsReplyNo;	// 중고상품답글번호
	private String usedGdsReplyDt;	// 중고상품댓글일자
	private String mbNo;			// 회원번호
	private String content;			// 내용
	private String usedReGbCd;		// 중고리플구분코드
	private String delYn;			// 삭제여부
	private String chgId;			// 변경아이디
	private Date chgDt;				// 변경일자
	private String regId;			// 등록아이디
	private Date regDt;				// 등록일자
	
	public UsedReCmtVo() {
		// TODO Auto-generated constructor stub
	}

	public UsedReCmtVo(String usedGdsNo, String usedGdsComtNo, String usedGdsReplyNo, String usedGdsReplyDt,
			String mbNo, String content, String usedReGbCd, String delYn, String chgId, Date chgDt, String regId,
			Date regDt) {
		super();
		this.usedGdsNo = usedGdsNo;
		this.usedGdsComtNo = usedGdsComtNo;
		this.usedGdsReplyNo = usedGdsReplyNo;
		this.usedGdsReplyDt = usedGdsReplyDt;
		this.mbNo = mbNo;
		this.content = content;
		this.usedReGbCd = usedReGbCd;
		this.delYn = delYn;
		this.chgId = chgId;
		this.chgDt = chgDt;
		this.regId = regId;
		this.regDt = regDt;
	}

	public String getUsedGdsNo() {
		return usedGdsNo;
	}

	public void setUsedGdsNo(String usedGdsNo) {
		this.usedGdsNo = usedGdsNo;
	}

	public String getUsedGdsComtNo() {
		return usedGdsComtNo;
	}

	public void setUsedGdsComtNo(String usedGdsComtNo) {
		this.usedGdsComtNo = usedGdsComtNo;
	}

	public String getUsedGdsReplyNo() {
		return usedGdsReplyNo;
	}

	public void setUsedGdsReplyNo(String usedGdsReplyNo) {
		this.usedGdsReplyNo = usedGdsReplyNo;
	}

	public String getUsedGdsReplyDt() {
		return usedGdsReplyDt;
	}

	public void setUsedGdsReplyDt(String usedGdsReplyDt) {
		this.usedGdsReplyDt = usedGdsReplyDt;
	}

	public String getMbNo() {
		return mbNo;
	}

	public void setMbNo(String mbNo) {
		this.mbNo = mbNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUsedReGbCd() {
		return usedReGbCd;
	}

	public void setUsedReGbCd(String usedReGbCd) {
		this.usedReGbCd = usedReGbCd;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public String getChgId() {
		return chgId;
	}

	public void setChgId(String chgId) {
		this.chgId = chgId;
	}

	public Date getChgDt() {
		return chgDt;
	}

	public void setChgDt(Date chgDt) {
		this.chgDt = chgDt;
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
	
}
