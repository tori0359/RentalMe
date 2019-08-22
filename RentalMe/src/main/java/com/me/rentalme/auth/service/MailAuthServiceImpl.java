package com.me.rentalme.auth.service;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.me.rentalme.join.model.JoinDao;


/**
* 메일인증 서비스
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.21
*/
@Service
public class MailAuthServiceImpl implements MailAuthService {
	
	@Inject
	private JavaMailSender mailSender;

	@Inject
	private JoinDao joinDao;
	
	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	/**
	* 이메일 난수 생성 메서드 
	* 
	* @param  none
	* @return String sb.toString() 
	* @author 황인준
	* @exception none
	*/
	@Override
	public String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		
		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}
		}while(sb.length() < size);
		
		if(lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
		
	}

	/**
	* 난수를 이용한 키 생성
	* 
	* @param  boolean lowerCheck
	* @param  int size
	* @return String init()
	* @author 황인준
	* @exception none
	*/
	@Override
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	/**
	* 회원가입 발송 이메일(인증키 발송)
	* 
	* @param  String email	- 가입한 메일주소
	* @param  String userId	- 가입아이디
	* @param  HttpServletRequest req - 경로를 받
	* @return 
	* @author 황인준
	* @exception none
	*/
	@Override
	public void mailSendWithUserKey(String email, String userId, HttpServletRequest req){

		String key = getKey(false, 20);
		joinDao.getKey(userId, key); 
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요. RentalMe 관리자입니다.</h2><br/><br/>";
		htmlStr+="<h3>"+userId+"님</h3><p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다. : ";
		htmlStr+="<a href='http://localhost:8080"+req.getContextPath()+"/join/key_alter?userId="+userId+"&emailKey="+key+"'>인증하기</a></p>";
		htmlStr+="(혹시 잘못 전달된 메일이라면 이 이메일을 무시하시기 바랍니다.)";
		
		try {
			mail.setSubject("[본인인증] RentalMe 중고거래 회원가입 인증메일 입니다.", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		}catch(MessagingException e) {
			e.printStackTrace();
		}
		 
	}

	@Override
	public int updateEamilConfirm(String userId, String emailKey) {
		int result = 0;
		
		result = joinDao.updEmailKey(userId, emailKey);
		return result;
	}


}
