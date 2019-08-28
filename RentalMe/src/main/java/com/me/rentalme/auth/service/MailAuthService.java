package com.me.rentalme.auth.service;

public interface MailAuthService {
	//난수 생성
	public String init(); 	
	
	//난수 만드는 메서드를 이용해서 키 생성
	public String getKey(boolean lowerCheck, int size); 
	
	// 회원가입 이메일 (인증키 발송) - (2019-08-27 : 회원가입 양식에서 인증하는 방식으로 변경으로 인한 삭제)
	//public void mailSendWithUserKey(String email, String userId, HttpServletRequest req);

	//인증확인 메서드(Y값으로 업데이트) - (2019-08-27 : 회원가입 양식에서 인증하는 방식으로 변경으로 인한 삭제)
	//public int updateEamilConfirm(String userId, String emailKey);

	// 이메일 인증
	public String mailSendWithUserEmail(String email);

}
