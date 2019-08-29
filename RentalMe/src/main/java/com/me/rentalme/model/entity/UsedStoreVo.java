package com.me.rentalme.model.entity;

public class UsedStoreVo {
	private String storeNo;
	private String storeReviewNo;
	private String storeReviewDt;
	private String mbNo;
	private String content;
	private String grade;
	private String usedReGbCd;
	private String delYn;
	private String chgId;
	private String chgDt;
	private String regId;
	private String regDt;
	
	public UsedStoreVo() {
		// TODO Auto-generated constructor stub
	}

	public UsedStoreVo(String storeNo, String storeReviewNo, String storeReviewDt, String mbNo, String content,
			String grade, String usedReGbCd, String delYn, String chgId, String chgDt, String regId, String regDt) {
		super();
		this.storeNo = storeNo;
		this.storeReviewNo = storeReviewNo;
		this.storeReviewDt = storeReviewDt;
		this.mbNo = mbNo;
		this.content = content;
		this.grade = grade;
		this.usedReGbCd = usedReGbCd;
		this.delYn = delYn;
		this.chgId = chgId;
		this.chgDt = chgDt;
		this.regId = regId;
		this.regDt = regDt;
	}

	public String getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(String storeNo) {
		this.storeNo = storeNo;
	}

	public String getStoreReviewNo() {
		return storeReviewNo;
	}

	public void setStoreReviewNo(String storeReviewNo) {
		this.storeReviewNo = storeReviewNo;
	}

	public String getStoreReviewDt() {
		return storeReviewDt;
	}

	public void setStoreReviewDt(String storeReviewDt) {
		this.storeReviewDt = storeReviewDt;
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

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
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
		return "UsedStoreVo [storeNo=" + storeNo + ", storeReviewNo=" + storeReviewNo + ", storeReviewDt="
				+ storeReviewDt + ", mbNo=" + mbNo + ", content=" + content + ", grade=" + grade + ", usedReGbCd="
				+ usedReGbCd + ", delYn=" + delYn + ", chgId=" + chgId + ", chgDt=" + chgDt + ", regId=" + regId
				+ ", regDt=" + regDt + "]";
	}
	
}
