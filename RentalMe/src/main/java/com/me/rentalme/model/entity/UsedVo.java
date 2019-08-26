package com.me.rentalme.model.entity;

import java.sql.Date;

public class UsedVo {
	private String usedGdsNo;            // 중고상품번호
	private String mbNo;                 // 회원번호
	private String usedGdsDt;            // 중고상품등록일자
	private String gdsLclassCd;          // 상품대분류코드
	private String gdsMclassCd;          // 상품중분류코드
	private String gdsSclassCd;          // 상품소분류코드
	private String gdsGbCd;              // 상품구분코드
	private String brandNm;              // 브랜드명
	private String modelNm;              // 모델명
	private int usedGdsPrice;         	 // 중고상품가격
	private String sub;                  // 제목
	private String content;              // 내용
	private String usedGdsResStsCd;    	 // 중고상품결과상태코드
	private String delYn;                // 삭제여부
	private String img1;                 // 이미지1
	private String img2;              	 // 이미지2
	private String img3;                 // 이미지3
	private String img4;                 // 이미지4
	private String chgId;                // 변경아이디
	private Date chgDt;                	 // 변경일자
	private String regId;                // 등록아이디
	private Date regDt;                  // 등록일자
	private String mcnm;				 //모델명
	private String align;					 // list 순서
	
	public UsedVo() {
		// TODO Auto-generated constructor stub
	}

	public UsedVo(String usedGdsNo, String mbNo, String usedGdsDt, String gdsLclassCd, String gdsMclassCd,
			String gdsSclassCd, String gdsGbCd, String brandNm, String modelNm, int usedGdsPrice, String sub,
			String content, String usedGdsResStsCd, String delYn, String img1, String img2, String img3, String img4,
			String chgId, Date chgDt, String regId, Date regDt) {
		super();
		this.usedGdsNo = usedGdsNo;
		this.mbNo = mbNo;
		this.usedGdsDt = usedGdsDt;
		this.gdsLclassCd = gdsLclassCd;
		this.gdsMclassCd = gdsMclassCd;
		this.gdsSclassCd = gdsSclassCd;
		this.gdsGbCd = gdsGbCd;
		this.brandNm = brandNm;
		this.modelNm = modelNm;
		this.usedGdsPrice = usedGdsPrice;
		this.sub = sub;
		this.content = content;
		this.usedGdsResStsCd = usedGdsResStsCd;
		this.delYn = delYn;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.img4 = img4;
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

	public String getMbNo() {
		return mbNo;
	}

	public void setMbNo(String mbNo) {
		this.mbNo = mbNo;
	}

	public String getUsedGdsDt() {
		return usedGdsDt;
	}

	public void setUsedGdsDt(String usedGdsDt) {
		this.usedGdsDt = usedGdsDt;
	}

	public String getGdsLclassCd() {
		return gdsLclassCd;
	}

	public void setGdsLclassCd(String gdsLclassCd) {
		this.gdsLclassCd = gdsLclassCd;
	}

	public String getGdsMclassCd() {
		return gdsMclassCd;
	}

	public void setGdsMclassCd(String gdsMclassCd) {
		this.gdsMclassCd = gdsMclassCd;
	}

	public String getGdsSclassCd() {
		return gdsSclassCd;
	}

	public void setGdsSclassCd(String gdsSclassCd) {
		this.gdsSclassCd = gdsSclassCd;
	}

	public String getGdsGbCd() {
		return gdsGbCd;
	}

	public void setGdsGbCd(String gdsGbCd) {
		this.gdsGbCd = gdsGbCd;
	}

	public String getBrandNm() {
		return brandNm;
	}

	public void setBrandNm(String brandNm) {
		this.brandNm = brandNm;
	}

	public String getModelNm() {
		return modelNm;
	}

	public void setModelNm(String modelNm) {
		this.modelNm = modelNm;
	}

	public int getUsedGdsPrice() {
		return usedGdsPrice;
	}

	public void setUsedGdsPrice(int usedGdsPrice) {
		this.usedGdsPrice = usedGdsPrice;
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

	public String getUsedGdsResStsCd() {
		return usedGdsResStsCd;
	}

	public void setUsedGdsResStsCd(String usedGdsResStsCd) {
		this.usedGdsResStsCd = usedGdsResStsCd;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public String getImg4() {
		return img4;
	}

	public void setImg4(String img4) {
		this.img4 = img4;
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
	

	public String getMcnm() {
		return mcnm;
	}

	public void setMcnm(String mcnm) {
		this.mcnm = mcnm;
	}
	



	public String getAlign() {
		return align;
	}

	public void setAlign(String align) {
		this.align = align;
	}

	@Override
	public String toString() {
		return "UsedVo [usedGdsNo=" + usedGdsNo + ", mbNo=" + mbNo + ", usedGdsDt=" + usedGdsDt + ", gdsLclassCd="
				+ gdsLclassCd + ", gdsMclassCd=" + gdsMclassCd + ", gdsSclassCd=" + gdsSclassCd + ", gdsGbCd=" + gdsGbCd
				+ ", brandNm=" + brandNm + ", modelNm=" + modelNm + ", usedGdsPrice=" + usedGdsPrice + ", sub=" + sub
				+ ", content=" + content + ", usedGdsResStsCd=" + usedGdsResStsCd + ", delYn=" + delYn + ", img1="
				+ img1 + ", img2=" + img2 + ", img3=" + img3 + ", img4=" + img4 + ", chgId=" + chgId + ", chgDt="
				+ chgDt + ", regId=" + regId + ", regDt=" + regDt + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((brandNm == null) ? 0 : brandNm.hashCode());
		result = prime * result + ((chgId == null) ? 0 : chgId.hashCode());
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((delYn == null) ? 0 : delYn.hashCode());
		result = prime * result + ((gdsGbCd == null) ? 0 : gdsGbCd.hashCode());
		result = prime * result + ((gdsLclassCd == null) ? 0 : gdsLclassCd.hashCode());
		result = prime * result + ((gdsMclassCd == null) ? 0 : gdsMclassCd.hashCode());
		result = prime * result + ((gdsSclassCd == null) ? 0 : gdsSclassCd.hashCode());
		result = prime * result + ((img1 == null) ? 0 : img1.hashCode());
		result = prime * result + ((img2 == null) ? 0 : img2.hashCode());
		result = prime * result + ((img3 == null) ? 0 : img3.hashCode());
		result = prime * result + ((img4 == null) ? 0 : img4.hashCode());
		result = prime * result + ((mbNo == null) ? 0 : mbNo.hashCode());
		result = prime * result + ((modelNm == null) ? 0 : modelNm.hashCode());
		result = prime * result + ((regId == null) ? 0 : regId.hashCode());
		result = prime * result + ((sub == null) ? 0 : sub.hashCode());
		result = prime * result + ((usedGdsDt == null) ? 0 : usedGdsDt.hashCode());
		result = prime * result + ((usedGdsNo == null) ? 0 : usedGdsNo.hashCode());
		result = prime * result + usedGdsPrice;
		result = prime * result + ((usedGdsResStsCd == null) ? 0 : usedGdsResStsCd.hashCode());
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
		UsedVo other = (UsedVo) obj;
		if (brandNm == null) {
			if (other.brandNm != null)
				return false;
		} else if (!brandNm.equals(other.brandNm))
			return false;
		if (chgId == null) {
			if (other.chgId != null)
				return false;
		} else if (!chgId.equals(other.chgId))
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (delYn == null) {
			if (other.delYn != null)
				return false;
		} else if (!delYn.equals(other.delYn))
			return false;
		if (gdsGbCd == null) {
			if (other.gdsGbCd != null)
				return false;
		} else if (!gdsGbCd.equals(other.gdsGbCd))
			return false;
		if (gdsLclassCd == null) {
			if (other.gdsLclassCd != null)
				return false;
		} else if (!gdsLclassCd.equals(other.gdsLclassCd))
			return false;
		if (gdsMclassCd == null) {
			if (other.gdsMclassCd != null)
				return false;
		} else if (!gdsMclassCd.equals(other.gdsMclassCd))
			return false;
		if (gdsSclassCd == null) {
			if (other.gdsSclassCd != null)
				return false;
		} else if (!gdsSclassCd.equals(other.gdsSclassCd))
			return false;
		if (img1 == null) {
			if (other.img1 != null)
				return false;
		} else if (!img1.equals(other.img1))
			return false;
		if (img2 == null) {
			if (other.img2 != null)
				return false;
		} else if (!img2.equals(other.img2))
			return false;
		if (img3 == null) {
			if (other.img3 != null)
				return false;
		} else if (!img3.equals(other.img3))
			return false;
		if (img4 == null) {
			if (other.img4 != null)
				return false;
		} else if (!img4.equals(other.img4))
			return false;
		if (mbNo == null) {
			if (other.mbNo != null)
				return false;
		} else if (!mbNo.equals(other.mbNo))
			return false;
		if (modelNm == null) {
			if (other.modelNm != null)
				return false;
		} else if (!modelNm.equals(other.modelNm))
			return false;
		if (regId == null) {
			if (other.regId != null)
				return false;
		} else if (!regId.equals(other.regId))
			return false;
		if (sub == null) {
			if (other.sub != null)
				return false;
		} else if (!sub.equals(other.sub))
			return false;
		if (usedGdsDt == null) {
			if (other.usedGdsDt != null)
				return false;
		} else if (!usedGdsDt.equals(other.usedGdsDt))
			return false;
		if (usedGdsNo == null) {
			if (other.usedGdsNo != null)
				return false;
		} else if (!usedGdsNo.equals(other.usedGdsNo))
			return false;
		if (usedGdsPrice != other.usedGdsPrice)
			return false;
		if (usedGdsResStsCd == null) {
			if (other.usedGdsResStsCd != null)
				return false;
		} else if (!usedGdsResStsCd.equals(other.usedGdsResStsCd))
			return false;
		return true;
	}
	
	
}