package com.me.rentalme.model.entity;

import java.sql.Date;

public class UserVo {
	private String 	userId;			// 아이디
	private String	mbNo;			// 회원번호
	private String	userNM;			// 이름
	private String	birthDay;		// 생년월일
	private String	genderGbCd;		// 성별구분코드(1:남자, 2:여자)
	private String	hp;				// 휴대전화
	private String	hpYn;			// 휴대전화 수신여부
	private String 	email;			// 이메일
	private String	emailYn;		// 이메일 수신여부
	private String	emailKey;		// 이메일 사용자 키 (인증 전 : 난수 생성된 키값이 입력, 인증 후 Y 입력)
	private String  addr;			// 주소
	private String  addrDetail;		// 상세주소
	private String  zipCode;		// 우편번호
	private String	userPw;			// 비밀번호
	private String  pwFailCnt;		// 비밀번호 오류횟수
	private Date	pwAdjDt;		// 비밀번호	적용일자
	private String	levelGbCd;		// 레벨구분코드(1:일반, 2:관리자)
	private String  joinDt;			// 가입일자
	private String  userStsCd;		// 사용자상태코드(1:정상, 2:휴면, 3:삭제)
	private String  chgId;			// 변경아이디
	private Date  	chgDt;			// 변경일자	
	private String  regId;			// 등록아이디
	private Date	regDt;			// 등록일자
	private String  sessionKey;		// 세션키 (쿠기값 저장)
	private Date	sessionDt;		// 세션일자
	private boolean isUseLogin;		// 자동로그인 여부
	
	
	public UserVo() {

	}

	public UserVo(String userId, String mbNo, String userNM, String birthDay, String genderGbCd, String hp, String hpYn,
			String email, String emailYn, String emailKey, String addr, String addrDetail, String zipCode,
			String userPw, String pwFailCnt, Date pwAdjDt, String levelGbCd, String joinDt, String userStsCd,
			String chgId, Date chgDt, String regId, Date regDt, String sessionKey, Date sessionDt, boolean isUseLogin) {
		super();
		this.userId = userId;
		this.mbNo = mbNo;
		this.userNM = userNM;
		this.birthDay = birthDay;
		this.genderGbCd = genderGbCd;
		this.hp = hp;
		this.hpYn = hpYn;
		this.email = email;
		this.emailYn = emailYn;
		this.emailKey = emailKey;
		this.addr = addr;
		this.addrDetail = addrDetail;
		this.zipCode = zipCode;
		this.userPw = userPw;
		this.pwFailCnt = pwFailCnt;
		this.pwAdjDt = pwAdjDt;
		this.levelGbCd = levelGbCd;
		this.joinDt = joinDt;
		this.userStsCd = userStsCd;
		this.chgId = chgId;
		this.chgDt = chgDt;
		this.regId = regId;
		this.regDt = regDt;
		this.sessionKey = sessionKey;
		this.sessionDt = sessionDt;
		this.isUseLogin = isUseLogin;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMbNo() {
		return mbNo;
	}

	public void setMbNo(String mbNo) {
		this.mbNo = mbNo;
	}

	public String getUserNM() {
		return userNM;
	}

	public void setUserNM(String userNM) {
		this.userNM = userNM;
	}

	public String getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

	public String getGenderGbCd() {
		return genderGbCd;
	}

	public void setGenderGbCd(String genderGbCd) {
		this.genderGbCd = genderGbCd;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getHpYn() {
		return hpYn;
	}

	public void setHpYn(String hpYn) {
		this.hpYn = hpYn;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmailYn() {
		return emailYn;
	}

	public void setEmailYn(String emailYn) {
		this.emailYn = emailYn;
	}

	public String getEmailKey() {
		return emailKey;
	}

	public void setEmailKey(String emailKey) {
		this.emailKey = emailKey;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getPwFailCnt() {
		return pwFailCnt;
	}

	public void setPwFailCnt(String pwFailCnt) {
		this.pwFailCnt = pwFailCnt;
	}

	public Date getPwAdjDt() {
		return pwAdjDt;
	}

	public void setPwAdjDt(Date pwAdjDt) {
		this.pwAdjDt = pwAdjDt;
	}

	public String getLevelGbCd() {
		return levelGbCd;
	}

	public void setLevelGbCd(String levelGbCd) {
		this.levelGbCd = levelGbCd;
	}

	public String getJoinDt() {
		return joinDt;
	}

	public void setJoinDt(String joinDt) {
		this.joinDt = joinDt;
	}

	public String getUserStsCd() {
		return userStsCd;
	}

	public void setUserStsCd(String userStsCd) {
		this.userStsCd = userStsCd;
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

	public String getSessionKey() {
		return sessionKey;
	}

	public void setSessionKey(String sessionKey) {
		this.sessionKey = sessionKey;
	}

	public Date getSessionDt() {
		return sessionDt;
	}

	public void setSessionDt(Date sessionDt) {
		this.sessionDt = sessionDt;
	}

	public boolean getIsUseLogin() {
		return isUseLogin;
	}

	public void setIsUseLogin(boolean isUseLogin) {
		this.isUseLogin = isUseLogin;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((addr == null) ? 0 : addr.hashCode());
		result = prime * result + ((addrDetail == null) ? 0 : addrDetail.hashCode());
		result = prime * result + ((birthDay == null) ? 0 : birthDay.hashCode());
		result = prime * result + ((chgId == null) ? 0 : chgId.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((emailKey == null) ? 0 : emailKey.hashCode());
		result = prime * result + ((emailYn == null) ? 0 : emailYn.hashCode());
		result = prime * result + ((genderGbCd == null) ? 0 : genderGbCd.hashCode());
		result = prime * result + ((hp == null) ? 0 : hp.hashCode());
		result = prime * result + ((hpYn == null) ? 0 : hpYn.hashCode());
		result = prime * result + ((joinDt == null) ? 0 : joinDt.hashCode());
		result = prime * result + ((levelGbCd == null) ? 0 : levelGbCd.hashCode());
		result = prime * result + ((mbNo == null) ? 0 : mbNo.hashCode());
		result = prime * result + ((pwAdjDt == null) ? 0 : pwAdjDt.hashCode());
		result = prime * result + ((pwFailCnt == null) ? 0 : pwFailCnt.hashCode());
		result = prime * result + ((regId == null) ? 0 : regId.hashCode());
		result = prime * result + ((sessionKey == null) ? 0 : sessionKey.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		result = prime * result + ((userNM == null) ? 0 : userNM.hashCode());
		result = prime * result + ((userPw == null) ? 0 : userPw.hashCode());
		result = prime * result + ((userStsCd == null) ? 0 : userStsCd.hashCode());
		result = prime * result + ((zipCode == null) ? 0 : zipCode.hashCode());
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
		UserVo other = (UserVo) obj;
		if (addr == null) {
			if (other.addr != null)
				return false;
		} else if (!addr.equals(other.addr))
			return false;
		if (addrDetail == null) {
			if (other.addrDetail != null)
				return false;
		} else if (!addrDetail.equals(other.addrDetail))
			return false;
		if (birthDay == null) {
			if (other.birthDay != null)
				return false;
		} else if (!birthDay.equals(other.birthDay))
			return false;
		if (chgId == null) {
			if (other.chgId != null)
				return false;
		} else if (!chgId.equals(other.chgId))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (emailKey == null) {
			if (other.emailKey != null)
				return false;
		} else if (!emailKey.equals(other.emailKey))
			return false;
		if (emailYn == null) {
			if (other.emailYn != null)
				return false;
		} else if (!emailYn.equals(other.emailYn))
			return false;
		if (genderGbCd == null) {
			if (other.genderGbCd != null)
				return false;
		} else if (!genderGbCd.equals(other.genderGbCd))
			return false;
		if (hp == null) {
			if (other.hp != null)
				return false;
		} else if (!hp.equals(other.hp))
			return false;
		if (hpYn == null) {
			if (other.hpYn != null)
				return false;
		} else if (!hpYn.equals(other.hpYn))
			return false;
		if (joinDt == null) {
			if (other.joinDt != null)
				return false;
		} else if (!joinDt.equals(other.joinDt))
			return false;
		if (levelGbCd == null) {
			if (other.levelGbCd != null)
				return false;
		} else if (!levelGbCd.equals(other.levelGbCd))
			return false;
		if (mbNo == null) {
			if (other.mbNo != null)
				return false;
		} else if (!mbNo.equals(other.mbNo))
			return false;
		if (pwAdjDt == null) {
			if (other.pwAdjDt != null)
				return false;
		} else if (!pwAdjDt.equals(other.pwAdjDt))
			return false;
		if (pwFailCnt == null) {
			if (other.pwFailCnt != null)
				return false;
		} else if (!pwFailCnt.equals(other.pwFailCnt))
			return false;
		if (regId == null) {
			if (other.regId != null)
				return false;
		} else if (!regId.equals(other.regId))
			return false;
		if (sessionKey == null) {
			if (other.sessionKey != null)
				return false;
		} else if (!sessionKey.equals(other.sessionKey))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		if (userNM == null) {
			if (other.userNM != null)
				return false;
		} else if (!userNM.equals(other.userNM))
			return false;
		if (userPw == null) {
			if (other.userPw != null)
				return false;
		} else if (!userPw.equals(other.userPw))
			return false;
		if (userStsCd == null) {
			if (other.userStsCd != null)
				return false;
		} else if (!userStsCd.equals(other.userStsCd))
			return false;
		if (zipCode == null) {
			if (other.zipCode != null)
				return false;
		} else if (!zipCode.equals(other.zipCode))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UserVo [userId=" + userId + ", mbNo=" + mbNo + ", userNM=" + userNM + ", birthDay=" + birthDay
				+ ", genderGbCd=" + genderGbCd + ", hp=" + hp + ", hpYn=" + hpYn + ", email=" + email + ", emailYn="
				+ emailYn + ", emailKey=" + emailKey + ", addr=" + addr + ", addrDetail=" + addrDetail + ", zipCode="
				+ zipCode + ", userPw=" + userPw + ", pwFailCnt=" + pwFailCnt + ", pwAdjDt=" + pwAdjDt + ", levelGbCd="
				+ levelGbCd + ", joinDt=" + joinDt + ", userStsCd=" + userStsCd + ", chgId=" + chgId + ", chgDt="
				+ chgDt + ", regId=" + regId + ", regDt=" + regDt + ", sessionKey=" + sessionKey + ", sessionDt="
				+ sessionDt + ", isUseLogin=" + isUseLogin + ", getUserId()=" + getUserId() + ", getMbNo()=" + getMbNo()
				+ ", getUserNM()=" + getUserNM() + ", getBirthDay()=" + getBirthDay() + ", getGenderGbCd()="
				+ getGenderGbCd() + ", getHp()=" + getHp() + ", getHpYn()=" + getHpYn() + ", getEmail()=" + getEmail()
				+ ", getEmailYn()=" + getEmailYn() + ", getEmailKey()=" + getEmailKey() + ", getAddr()=" + getAddr()
				+ ", getAddrDetail()=" + getAddrDetail() + ", getZipCode()=" + getZipCode() + ", getUserPw()="
				+ getUserPw() + ", getPwFailCnt()=" + getPwFailCnt() + ", getPwAdjDt()=" + getPwAdjDt()
				+ ", getLevelGbCd()=" + getLevelGbCd() + ", getJoinDt()=" + getJoinDt() + ", getUserStsCd()="
				+ getUserStsCd() + ", getChgId()=" + getChgId() + ", getChgDt()=" + getChgDt() + ", getRegId()="
				+ getRegId() + ", getRegDt()=" + getRegDt() + ", getSessionKey()=" + getSessionKey()
				+ ", getSessionDt()=" + getSessionDt() + ", getIsUseLogin()=" + getIsUseLogin() + ", hashCode()="
				+ hashCode() + ", getClass()=" + getClass() + ", toString()=" + super.toString() + "]";
	}
}
