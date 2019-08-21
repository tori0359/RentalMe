package com.me.rentalme.model.entity;

import java.sql.Date;

public class UserVo {
	private String 	userid;			// 아이디
	private int		memNo;			// 회원번호
	private String	userPw;			// 비밀번호
	private String	userName;		// 이름
	private String	birth;			// 생년월일
	private String	sex;			// 성별
	private String 	email;			// 이메일
	private String	emailCheck;		// 이메일 수신여부
	private String	phone;			// 휴대전화
	private String	phoneCheck;		// 휴대전화 수신여부
	private String  addr1;			// 주소1
	private String  addr2;			// 주소2
	private String  zipCode;		// 우편번호
	private String  pwErrCnt;		// 비밀번호 오류횟수
	private Date	pwEffDate;		// 비밀번호	적용일자
	private Date    joinRegDate;	// 가입일자
	private String  useStatus;		// 사용여부
	private String  memStatus;		// 회원상태
	
	public UserVo() {

	}

	public UserVo(String userid, int memNo, String userPw, String userName, String birth, String sex, String email,
			String emailCheck, String phone, String phoneCheck, String addr1, String addr2, String zipCode,
			String pwErrCnt, Date pwEffDate, Date joinRegDate, String useStatus, String memStatus) {
		super();
		this.userid = userid;
		this.memNo = memNo;
		this.userPw = userPw;
		this.userName = userName;
		this.birth = birth;
		this.sex = sex;
		this.email = email;
		this.emailCheck = emailCheck;
		this.phone = phone;
		this.phoneCheck = phoneCheck;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.zipCode = zipCode;
		this.pwErrCnt = pwErrCnt;
		this.pwEffDate = pwEffDate;
		this.joinRegDate = joinRegDate;
		this.useStatus = useStatus;
		this.memStatus = memStatus;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((addr1 == null) ? 0 : addr1.hashCode());
		result = prime * result + ((addr2 == null) ? 0 : addr2.hashCode());
		result = prime * result + ((birth == null) ? 0 : birth.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((emailCheck == null) ? 0 : emailCheck.hashCode());
		result = prime * result + memNo;
		result = prime * result + ((memStatus == null) ? 0 : memStatus.hashCode());
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result + ((phoneCheck == null) ? 0 : phoneCheck.hashCode());
		result = prime * result + ((pwErrCnt == null) ? 0 : pwErrCnt.hashCode());
		result = prime * result + ((sex == null) ? 0 : sex.hashCode());
		result = prime * result + ((useStatus == null) ? 0 : useStatus.hashCode());
		result = prime * result + ((userName == null) ? 0 : userName.hashCode());
		result = prime * result + ((userPw == null) ? 0 : userPw.hashCode());
		result = prime * result + ((userid == null) ? 0 : userid.hashCode());
		result = prime * result + ((zipCode == null) ? 0 : zipCode.hashCode());
		return result;
	}
	
	//getter, setter
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmailCheck() {
		return emailCheck;
	}

	public void setEmailCheck(String emailCheck) {
		this.emailCheck = emailCheck;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhoneCheck() {
		return phoneCheck;
	}

	public void setPhoneCheck(String phoneCheck) {
		this.phoneCheck = phoneCheck;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getPwErrCnt() {
		return pwErrCnt;
	}

	public void setPwErrCnt(String pwErrCnt) {
		this.pwErrCnt = pwErrCnt;
	}

	public Date getPwEffDate() {
		return pwEffDate;
	}

	public void setPwEffDate(Date pwEffDate) {
		this.pwEffDate = pwEffDate;
	}

	public Date getJoinRegDate() {
		return joinRegDate;
	}

	public void setJoinRegDate(Date joinRegDate) {
		this.joinRegDate = joinRegDate;
	}

	public String getUseStatus() {
		return useStatus;
	}

	public void setUseStatus(String useStatus) {
		this.useStatus = useStatus;
	}

	public String getMemStatus() {
		return memStatus;
	}

	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
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
		if (addr1 == null) {
			if (other.addr1 != null)
				return false;
		} else if (!addr1.equals(other.addr1))
			return false;
		if (addr2 == null) {
			if (other.addr2 != null)
				return false;
		} else if (!addr2.equals(other.addr2))
			return false;
		if (birth == null) {
			if (other.birth != null)
				return false;
		} else if (!birth.equals(other.birth))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (emailCheck == null) {
			if (other.emailCheck != null)
				return false;
		} else if (!emailCheck.equals(other.emailCheck))
			return false;
		if (memNo != other.memNo)
			return false;
		if (memStatus == null) {
			if (other.memStatus != null)
				return false;
		} else if (!memStatus.equals(other.memStatus))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (phoneCheck == null) {
			if (other.phoneCheck != null)
				return false;
		} else if (!phoneCheck.equals(other.phoneCheck))
			return false;
		if (pwErrCnt == null) {
			if (other.pwErrCnt != null)
				return false;
		} else if (!pwErrCnt.equals(other.pwErrCnt))
			return false;
		if (sex == null) {
			if (other.sex != null)
				return false;
		} else if (!sex.equals(other.sex))
			return false;
		if (useStatus == null) {
			if (other.useStatus != null)
				return false;
		} else if (!useStatus.equals(other.useStatus))
			return false;
		if (userName == null) {
			if (other.userName != null)
				return false;
		} else if (!userName.equals(other.userName))
			return false;
		if (userPw == null) {
			if (other.userPw != null)
				return false;
		} else if (!userPw.equals(other.userPw))
			return false;
		if (userid == null) {
			if (other.userid != null)
				return false;
		} else if (!userid.equals(other.userid))
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
		return "UserVo [userid=" + userid + ", memNo=" + memNo + ", userPw=" + userPw + ", userName=" + userName
				+ ", birth=" + birth + ", sex=" + sex + ", email=" + email + ", emailCheck=" + emailCheck + ", phone="
				+ phone + ", phoneCheck=" + phoneCheck + ", addr1=" + addr1 + ", addr2=" + addr2 + ", zipCode="
				+ zipCode + ", pwErrCnt=" + pwErrCnt + ", pwEffDate=" + pwEffDate + ", joinRegDate=" + joinRegDate
				+ ", useStatus=" + useStatus + ", memStatus=" + memStatus + ", hashCode()=" + hashCode()
				+ ", getClass()=" + getClass() + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
	
	
	
	
	
	
}
