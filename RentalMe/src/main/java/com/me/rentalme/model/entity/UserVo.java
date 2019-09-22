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
	private String  hpKey;			// 휴대폰 사용자 키
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
	private boolean useLogin;		// 자동로그인 여부
	private String  loginStsCd;		// 로그인 상태 값 (1 : 로그인, 2 : 로그오프)
	private String  browserStsCd;	// 브라우저 상태 값 (1:IE, 2:Opera, 3:FireFox, 4: Chrome, 5:Safari)
	
	
	public UserVo() {

	}


	public UserVo(String userId, String mbNo, String userNM, String birthDay, String genderGbCd, String hp, String hpYn,
			String hpKey, String email, String emailYn, String emailKey, String addr, String addrDetail, String zipCode,
			String userPw, String pwFailCnt, Date pwAdjDt, String levelGbCd, String joinDt, String userStsCd,
			String chgId, Date chgDt, String regId, Date regDt, String sessionKey, Date sessionDt, boolean useLogin,
			String loginStsCd, String browserStsCd) {
		super();
		this.userId = userId;
		this.mbNo = mbNo;
		this.userNM = userNM;
		this.birthDay = birthDay;
		this.genderGbCd = genderGbCd;
		this.hp = hp;
		this.hpYn = hpYn;
		this.hpKey = hpKey;
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
		this.useLogin = useLogin;
		this.loginStsCd = loginStsCd;
		this.browserStsCd = browserStsCd;
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


	public String getHpKey() {
		return hpKey;
	}


	public void setHpKey(String hpKey) {
		this.hpKey = hpKey;
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


	public boolean isUseLogin() {
		return useLogin;
	}


	public void setUseLogin(boolean useLogin) {
		this.useLogin = useLogin;
	}


	public String getLoginStsCd() {
		return loginStsCd;
	}


	public void setLoginStsCd(String loginStsCd) {
		this.loginStsCd = loginStsCd;
	}


	public String getBrowserStsCd() {
		return browserStsCd;
	}


	public void setBrowserStsCd(String browserStsCd) {
		this.browserStsCd = browserStsCd;
	}


	@Override
	public String toString() {
		return "UserVo [userId=" + userId + ", mbNo=" + mbNo + ", userNM=" + userNM + ", birthDay=" + birthDay
				+ ", genderGbCd=" + genderGbCd + ", hp=" + hp + ", hpYn=" + hpYn + ", hpKey=" + hpKey + ", email="
				+ email + ", emailYn=" + emailYn + ", emailKey=" + emailKey + ", addr=" + addr + ", addrDetail="
				+ addrDetail + ", zipCode=" + zipCode + ", userPw=" + userPw + ", pwFailCnt=" + pwFailCnt + ", pwAdjDt="
				+ pwAdjDt + ", levelGbCd=" + levelGbCd + ", joinDt=" + joinDt + ", userStsCd=" + userStsCd + ", chgId="
				+ chgId + ", chgDt=" + chgDt + ", regId=" + regId + ", regDt=" + regDt + ", sessionKey=" + sessionKey
				+ ", sessionDt=" + sessionDt + ", useLogin=" + useLogin + ", loginStsCd=" + loginStsCd
				+ ", browserStsCd=" + browserStsCd + "]";
	}


	

}
