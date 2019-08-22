package com.me.rentalme.auth.service;

import javax.servlet.http.HttpServletRequest;

public interface MailAuthService {
	//난수 생성
	public String init(); 	
	
	//난수 만드는 메서드를 이용해서 키 생성
	public String getKey(boolean lowerCheck, int size); 
	
	// 회원가입 이메일 (인증키 발송)
	public void mailSendWithUserKey(String email, String userId, HttpServletRequest req);

	//인증확인 메서드(Y값으로 업데이트)
	public int updateEamilConfirm(String userId, String emailKey);

}
