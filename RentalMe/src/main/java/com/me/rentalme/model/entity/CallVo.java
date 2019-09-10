package com.me.rentalme.model.entity;


public class CallVo {
	private String usedGdsNo;		//중고 상품 번호
	private String mbNo;			//회원번호
	private String callStsCd;		//찜상태 코드
	private String chgId;			//변경 아이디
	private String chgDt;			//변경 날짜
	private String regId;			//등록 아이디
	private String regDt;			//등록 날짜
	private String modelNm;			//모델명
	private String usedGdsPrice;	//중고 상품 가격
	private String odrDt;			//주문 일자
	private String gdsPrice;		//렌탈 상품 가격
	private int odrQty;				//주문수량
	private int odrAmt;				//주문 금액
	private String agreeTerm;		//계약 기간
	private String odrStsGbCd;		//주문 상태 구분 코드
	private String gdsNm;			//상품명
	private String gdsCd;			//상품 코드
	private String userId;			//사용자 아이디
	private String content;			//후기 등록 내용
	private String grade;			//후기 별점
	private String sumPrice;		//장바구니 총 금액?
	private String depositSeq;		//예치금 일련 번호
	private String depositDt;		//예치금 일자
	private String chargeDeposit;	//충전 예치금
	private String useDeposit;		//사용 예치금
	private String refundDeposit;	//환불 예치금
	private String depositGbCd;		//예치금 구분 코드 (1-충전, 2-사용, 3-환불)
	private String remnDeposit;		//잔여 예치금
	private String bidPrice;		//응찰 가격
	private String bidTime;			//응찰 시간
	private String RImg1; 			//렌탈 이미지
	private String UImg1; 			//중고사진 이미지
	private String cnt; 			//회원이 해당상품에 쓴 후기 갯수
	private String cartSeq;			//장바구니 일련번호
	

	

	public String getCartSeq() {
		return cartSeq;
	}

	public void setCartSeq(String cartSeq) {
		this.cartSeq = cartSeq;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public String getRImg1() {
		return RImg1;
	}

	public void setRImg1(String rImg1) {
		RImg1 = rImg1;
	}

	public String getUImg1() {
		return UImg1;
	}

	public void setUImg1(String uImg1) {
		UImg1 = uImg1;
	}

	public String getBidPrice() {
		return bidPrice;
	}

	public void setBidPrice(String bidPrice) {
		this.bidPrice = bidPrice;
	}

	public String getBidTime() {
		return bidTime;
	}

	public void setBidTime(String bidTime) {
		this.bidTime = bidTime;
	}

	public String getRemnDeposit() {
		return remnDeposit;
	}

	public void setRemnDeposit(String remnDeposit) {
		this.remnDeposit = remnDeposit;
	}

	public String getDepositSeq() {
		return depositSeq;
	}

	public void setDepositSeq(String depositSeq) {
		this.depositSeq = depositSeq;
	}

	public String getDepositDt() {
		return depositDt;
	}

	public void setDepositDt(String depositDt) {
		this.depositDt = depositDt;
	}

	public String getChargeDeposit() {
		return chargeDeposit;
	}

	public void setChargeDeposit(String chargeDeposit) {
		this.chargeDeposit = chargeDeposit;
	}

	public String getUseDeposit() {
		return useDeposit;
	}

	public void setUseDeposit(String useDeposit) {
		this.useDeposit = useDeposit;
	}

	public String getRefundDeposit() {
		return refundDeposit;
	}

	public void setRefundDeposit(String refundDeposit) {
		this.refundDeposit = refundDeposit;
	}

	public String getDepositGbCd() {
		return depositGbCd;
	}

	public void setDepositGbCd(String depositGbCd) {
		this.depositGbCd = depositGbCd;
	}

	public String getSumPrice() {
		return sumPrice;
	}

	public void setSumPrice(String sumPrice) {
		this.sumPrice = sumPrice;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}


	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getGdsCd() {
		return gdsCd;
	}

	public void setGdsCd(String gdsCd) {
		this.gdsCd = gdsCd;
	}

	public String getGdsNm() {
		return gdsNm;
	}

	public void setGdsNm(String gdsNm) {
		this.gdsNm = gdsNm;
	}

	public String getOdrStsGbCd() {
		return odrStsGbCd;
	}

	public void setOdrStsGbCd(String odrStsGbCd) {
		this.odrStsGbCd = odrStsGbCd;
	}

	public String getOdrDt() {
		return odrDt;
	}

	public void setOdrDt(String odrDt) {
		this.odrDt = odrDt;
	}

	public String getGdsPrice() {
		return gdsPrice;
	}

	public void setGdsPrice(String gdsPrice) {
		this.gdsPrice = gdsPrice;
	}

	public int getOdrQty() {
		return odrQty;
	}

	public void setOdrQty(int odrQty) {
		this.odrQty = odrQty;
	}

	public int getOdrAmt() {
		return odrAmt;
	}

	public void setOdrAmt(int odrAmt) {
		this.odrAmt = odrAmt;
	}

	public String getAgreeTerm() {
		return agreeTerm;
	}

	public void setAgreeTerm(String agreeTerm) {
		this.agreeTerm = agreeTerm;
	}

	public String getModelNm() {
		return modelNm;
	}

	public void setModelNm(String modelNm) {
		this.modelNm = modelNm;
	}

	public String getUsedGdsPrice() {
		return usedGdsPrice;
	}

	public void setUsedGdsPrice(String usedGdsPrice) {
		this.usedGdsPrice = usedGdsPrice;
	}

	public CallVo() {
		
	}

	public String getUsedGdsNo() {
		return usedGdsNo;
	}

	public void setUsedGdsNo(String usedGdsNo) {
		this.usedGdsNo = usedGdsNo;
	}

	public String getMbNo() {
		return mbNo;
	}

	public void setMbNo(String mbNo) {
		this.mbNo = mbNo;
	}

	public String getCallStsCd() {
		return callStsCd;
	}

	public void setCallStsCd(String callStsCd) {
		this.callStsCd = callStsCd;
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
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((callStsCd == null) ? 0 : callStsCd.hashCode());
		result = prime * result + ((chgId == null) ? 0 : chgId.hashCode());
		result = prime * result + ((mbNo == null) ? 0 : mbNo.hashCode());
		result = prime * result + ((regId == null) ? 0 : regId.hashCode());
		result = prime * result + ((usedGdsNo == null) ? 0 : usedGdsNo.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CallVo other = (CallVo) obj;
		if (callStsCd == null) {
			if (other.callStsCd != null)
				return false;
		} else if (!callStsCd.equals(other.callStsCd))
			return false;
		if (chgId == null) {
			if (other.chgId != null)
				return false;
		} else if (!chgId.equals(other.chgId))
			return false;
		if (mbNo == null) {
			if (other.mbNo != null)
				return false;
		} else if (!mbNo.equals(other.mbNo))
			return false;
		if (regId == null) {
			if (other.regId != null)
				return false;
		} else if (!regId.equals(other.regId))
			return false;
		if (usedGdsNo == null) {
			if (other.usedGdsNo != null)
				return false;
		} else if (!usedGdsNo.equals(other.usedGdsNo))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CallVo [usedGdsNo=" + usedGdsNo + ", mbNo=" + mbNo + ", callStsCd=" + callStsCd + ", chgId=" + chgId
				+ ", chgDt=" + chgDt + ", regId=" + regId + ", regDt=" + regDt + ", modelNm=" + modelNm
				+ ", usedGdsPrice=" + usedGdsPrice + ", odrDt=" + odrDt + ", gdsPrice=" + gdsPrice + ", odrQty="
				+ odrQty + ", odrAmt=" + odrAmt + ", agreeTerm=" + agreeTerm + ", odrStsGbCd=" + odrStsGbCd + "]";
	}
	
}
