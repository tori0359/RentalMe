package com.me.rentalme.model.entity;

import java.sql.Date;

public class UsedVo {
	private String USED_GDS_NO;             // 중고상품번호
	private String MB_NO;                   // 회원번호
	private String USED_GDS_DT;             // 중고상품등록일자
	private String GDS_LCLASS_CD;           // 상품대분류코드
	private String GDS_MCLASS_CD;           // 상품중분류코드
	private String GDS_SCLASS_CD;           // 상품소분류코드
	private String GDS_GB_CD;               // 상품구분코드
	private String BRAND_NM;               	// 브랜드명
	private String MODEL_NM;                // 모델명
	private int USED_GDS_PRICE;          	// 중고상품가격
	private String SUB;                     // 제목
	private String CONTENT;                 // 내용
	private String USED_GDS_RES_STS_CD;     // 중고상품결과상태코드
	private String DEL_YN;                  // 삭제여부
	private String IMG1;                    // 이미지1
	private String IMG2;                    // 이미지2
	private String IMG3;                    // 이미지3
	private String IMG4;                    // 이미지4
	private String CHG_ID;                  // 변경아이디
	private Date CHG_DT;                  	// 변경일자
	private String REG_ID;                  // 등록아이디
	private Date REG_DT;                  	// 등록일자
	
	public UsedVo() {
		// TODO Auto-generated constructor stub
	}

	public UsedVo(String uSED_GDS_NO, String mB_NO, String uSED_GDS_DT, String gDS_LCLASS_CD, String gDS_MCLASS_CD,
			String gDS_SCLASS_CD, String gDS_GB_CD, String bRAND_NM, String mODEL_NM, int uSED_GDS_PRICE, String sUB,
			String cONTENT, String uSED_GDS_RES_STS_CD, String dEL_YN, String iMG1, String iMG2, String iMG3,
			String iMG4, String cHG_ID, Date cHG_DT, String rEG_ID, Date rEG_DT) {
		super();
		USED_GDS_NO = uSED_GDS_NO;
		MB_NO = mB_NO;
		USED_GDS_DT = uSED_GDS_DT;
		GDS_LCLASS_CD = gDS_LCLASS_CD;
		GDS_MCLASS_CD = gDS_MCLASS_CD;
		GDS_SCLASS_CD = gDS_SCLASS_CD;
		GDS_GB_CD = gDS_GB_CD;
		BRAND_NM = bRAND_NM;
		MODEL_NM = mODEL_NM;
		USED_GDS_PRICE = uSED_GDS_PRICE;
		SUB = sUB;
		CONTENT = cONTENT;
		USED_GDS_RES_STS_CD = uSED_GDS_RES_STS_CD;
		DEL_YN = dEL_YN;
		IMG1 = iMG1;
		IMG2 = iMG2;
		IMG3 = iMG3;
		IMG4 = iMG4;
		CHG_ID = cHG_ID;
		CHG_DT = cHG_DT;
		REG_ID = rEG_ID;
		REG_DT = rEG_DT;
	}

	public String getUSED_GDS_NO() {
		return USED_GDS_NO;
	}

	public void setUSED_GDS_NO(String uSED_GDS_NO) {
		USED_GDS_NO = uSED_GDS_NO;
	}

	public String getMB_NO() {
		return MB_NO;
	}

	public void setMB_NO(String mB_NO) {
		MB_NO = mB_NO;
	}

	public String getUSED_GDS_DT() {
		return USED_GDS_DT;
	}

	public void setUSED_GDS_DT(String uSED_GDS_DT) {
		USED_GDS_DT = uSED_GDS_DT;
	}

	public String getGDS_LCLASS_CD() {
		return GDS_LCLASS_CD;
	}

	public void setGDS_LCLASS_CD(String gDS_LCLASS_CD) {
		GDS_LCLASS_CD = gDS_LCLASS_CD;
	}

	public String getGDS_MCLASS_CD() {
		return GDS_MCLASS_CD;
	}

	public void setGDS_MCLASS_CD(String gDS_MCLASS_CD) {
		GDS_MCLASS_CD = gDS_MCLASS_CD;
	}

	public String getGDS_SCLASS_CD() {
		return GDS_SCLASS_CD;
	}

	public void setGDS_SCLASS_CD(String gDS_SCLASS_CD) {
		GDS_SCLASS_CD = gDS_SCLASS_CD;
	}

	public String getGDS_GB_CD() {
		return GDS_GB_CD;
	}

	public void setGDS_GB_CD(String gDS_GB_CD) {
		GDS_GB_CD = gDS_GB_CD;
	}

	public String getBRAND_NM() {
		return BRAND_NM;
	}

	public void setBRAND_NM(String bRAND_NM) {
		BRAND_NM = bRAND_NM;
	}

	public String getMODEL_NM() {
		return MODEL_NM;
	}

	public void setMODEL_NM(String mODEL_NM) {
		MODEL_NM = mODEL_NM;
	}

	public int getUSED_GDS_PRICE() {
		return USED_GDS_PRICE;
	}

	public void setUSED_GDS_PRICE(int uSED_GDS_PRICE) {
		USED_GDS_PRICE = uSED_GDS_PRICE;
	}

	public String getSUB() {
		return SUB;
	}

	public void setSUB(String sUB) {
		SUB = sUB;
	}

	public String getCONTENT() {
		return CONTENT;
	}

	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}

	public String getUSED_GDS_RES_STS_CD() {
		return USED_GDS_RES_STS_CD;
	}

	public void setUSED_GDS_RES_STS_CD(String uSED_GDS_RES_STS_CD) {
		USED_GDS_RES_STS_CD = uSED_GDS_RES_STS_CD;
	}

	public String getDEL_YN() {
		return DEL_YN;
	}

	public void setDEL_YN(String dEL_YN) {
		DEL_YN = dEL_YN;
	}

	public String getIMG1() {
		return IMG1;
	}

	public void setIMG1(String iMG1) {
		IMG1 = iMG1;
	}

	public String getIMG2() {
		return IMG2;
	}

	public void setIMG2(String iMG2) {
		IMG2 = iMG2;
	}

	public String getIMG3() {
		return IMG3;
	}

	public void setIMG3(String iMG3) {
		IMG3 = iMG3;
	}

	public String getIMG4() {
		return IMG4;
	}

	public void setIMG4(String iMG4) {
		IMG4 = iMG4;
	}

	public String getCHG_ID() {
		return CHG_ID;
	}

	public void setCHG_ID(String cHG_ID) {
		CHG_ID = cHG_ID;
	}

	public Date getCHG_DT() {
		return CHG_DT;
	}

	public void setCHG_DT(Date cHG_DT) {
		CHG_DT = cHG_DT;
	}

	public String getREG_ID() {
		return REG_ID;
	}

	public void setREG_ID(String rEG_ID) {
		REG_ID = rEG_ID;
	}

	public Date getREG_DT() {
		return REG_DT;
	}

	public void setREG_DT(Date rEG_DT) {
		REG_DT = rEG_DT;
	}

	@Override
	public String toString() {
		return "UsedVo [USED_GDS_NO=" + USED_GDS_NO + ", MB_NO=" + MB_NO + ", USED_GDS_DT=" + USED_GDS_DT
				+ ", GDS_LCLASS_CD=" + GDS_LCLASS_CD + ", GDS_MCLASS_CD=" + GDS_MCLASS_CD + ", GDS_SCLASS_CD="
				+ GDS_SCLASS_CD + ", GDS_GB_CD=" + GDS_GB_CD + ", BRAND_NM=" + BRAND_NM + ", MODEL_NM=" + MODEL_NM
				+ ", USED_GDS_PRICE=" + USED_GDS_PRICE + ", SUB=" + SUB + ", CONTENT=" + CONTENT
				+ ", USED_GDS_RES_STS_CD=" + USED_GDS_RES_STS_CD + ", DEL_YN=" + DEL_YN + ", IMG1=" + IMG1 + ", IMG2="
				+ IMG2 + ", IMG3=" + IMG3 + ", IMG4=" + IMG4 + ", CHG_ID=" + CHG_ID + ", CHG_DT=" + CHG_DT + ", REG_ID="
				+ REG_ID + ", REG_DT=" + REG_DT + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((BRAND_NM == null) ? 0 : BRAND_NM.hashCode());
		result = prime * result + ((CHG_ID == null) ? 0 : CHG_ID.hashCode());
		result = prime * result + ((CONTENT == null) ? 0 : CONTENT.hashCode());
		result = prime * result + ((DEL_YN == null) ? 0 : DEL_YN.hashCode());
		result = prime * result + ((GDS_GB_CD == null) ? 0 : GDS_GB_CD.hashCode());
		result = prime * result + ((GDS_LCLASS_CD == null) ? 0 : GDS_LCLASS_CD.hashCode());
		result = prime * result + ((GDS_MCLASS_CD == null) ? 0 : GDS_MCLASS_CD.hashCode());
		result = prime * result + ((GDS_SCLASS_CD == null) ? 0 : GDS_SCLASS_CD.hashCode());
		result = prime * result + ((IMG1 == null) ? 0 : IMG1.hashCode());
		result = prime * result + ((IMG2 == null) ? 0 : IMG2.hashCode());
		result = prime * result + ((IMG3 == null) ? 0 : IMG3.hashCode());
		result = prime * result + ((IMG4 == null) ? 0 : IMG4.hashCode());
		result = prime * result + ((MB_NO == null) ? 0 : MB_NO.hashCode());
		result = prime * result + ((MODEL_NM == null) ? 0 : MODEL_NM.hashCode());
		result = prime * result + ((REG_ID == null) ? 0 : REG_ID.hashCode());
		result = prime * result + ((SUB == null) ? 0 : SUB.hashCode());
		result = prime * result + ((USED_GDS_DT == null) ? 0 : USED_GDS_DT.hashCode());
		result = prime * result + ((USED_GDS_NO == null) ? 0 : USED_GDS_NO.hashCode());
		result = prime * result + USED_GDS_PRICE;
		result = prime * result + ((USED_GDS_RES_STS_CD == null) ? 0 : USED_GDS_RES_STS_CD.hashCode());
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
		if (BRAND_NM == null) {
			if (other.BRAND_NM != null)
				return false;
		} else if (!BRAND_NM.equals(other.BRAND_NM))
			return false;
		if (CHG_ID == null) {
			if (other.CHG_ID != null)
				return false;
		} else if (!CHG_ID.equals(other.CHG_ID))
			return false;
		if (CONTENT == null) {
			if (other.CONTENT != null)
				return false;
		} else if (!CONTENT.equals(other.CONTENT))
			return false;
		if (DEL_YN == null) {
			if (other.DEL_YN != null)
				return false;
		} else if (!DEL_YN.equals(other.DEL_YN))
			return false;
		if (GDS_GB_CD == null) {
			if (other.GDS_GB_CD != null)
				return false;
		} else if (!GDS_GB_CD.equals(other.GDS_GB_CD))
			return false;
		if (GDS_LCLASS_CD == null) {
			if (other.GDS_LCLASS_CD != null)
				return false;
		} else if (!GDS_LCLASS_CD.equals(other.GDS_LCLASS_CD))
			return false;
		if (GDS_MCLASS_CD == null) {
			if (other.GDS_MCLASS_CD != null)
				return false;
		} else if (!GDS_MCLASS_CD.equals(other.GDS_MCLASS_CD))
			return false;
		if (GDS_SCLASS_CD == null) {
			if (other.GDS_SCLASS_CD != null)
				return false;
		} else if (!GDS_SCLASS_CD.equals(other.GDS_SCLASS_CD))
			return false;
		if (IMG1 == null) {
			if (other.IMG1 != null)
				return false;
		} else if (!IMG1.equals(other.IMG1))
			return false;
		if (IMG2 == null) {
			if (other.IMG2 != null)
				return false;
		} else if (!IMG2.equals(other.IMG2))
			return false;
		if (IMG3 == null) {
			if (other.IMG3 != null)
				return false;
		} else if (!IMG3.equals(other.IMG3))
			return false;
		if (IMG4 == null) {
			if (other.IMG4 != null)
				return false;
		} else if (!IMG4.equals(other.IMG4))
			return false;
		if (MB_NO == null) {
			if (other.MB_NO != null)
				return false;
		} else if (!MB_NO.equals(other.MB_NO))
			return false;
		if (MODEL_NM == null) {
			if (other.MODEL_NM != null)
				return false;
		} else if (!MODEL_NM.equals(other.MODEL_NM))
			return false;
		if (REG_ID == null) {
			if (other.REG_ID != null)
				return false;
		} else if (!REG_ID.equals(other.REG_ID))
			return false;
		if (SUB == null) {
			if (other.SUB != null)
				return false;
		} else if (!SUB.equals(other.SUB))
			return false;
		if (USED_GDS_DT == null) {
			if (other.USED_GDS_DT != null)
				return false;
		} else if (!USED_GDS_DT.equals(other.USED_GDS_DT))
			return false;
		if (USED_GDS_NO == null) {
			if (other.USED_GDS_NO != null)
				return false;
		} else if (!USED_GDS_NO.equals(other.USED_GDS_NO))
			return false;
		if (USED_GDS_PRICE != other.USED_GDS_PRICE)
			return false;
		if (USED_GDS_RES_STS_CD == null) {
			if (other.USED_GDS_RES_STS_CD != null)
				return false;
		} else if (!USED_GDS_RES_STS_CD.equals(other.USED_GDS_RES_STS_CD))
			return false;
		return true;
	}
	
	
}
