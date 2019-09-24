package com.me.rentalme.auth.service;


import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


/**
* 회원가입 핸드폰 인증
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.09.05
*/
@Service
public class HpAuthServiceImpl implements HpAuthService {
	
	@Inject
	MailAuthService mailAuthService;

	/**
	* 핸드폰 인증 번호를 보낸다.
	* 
	* @param  String hp - 입력한 핸드폰 번호
	* @return void 
	* @author 황인준
	* 
	*/
	@Override
	public String sendHp(String hp) {
		//인증코드 생성
		String key = mailAuthService.getKey(false, 6);
				
		//coolsms에서 받은 apikey 세팅
		String 	apiKey 		= "NCSKEDEQPFGCT67L";						//git에 올라갈시 api키 공개되면 안되므로 삭제(담당자에게 문의)
		String 	apiSecret 	= "GZH4QB14H8QD9QAGIJE6DB16L6HVQTDD";		//git에 올라갈시 secret키 공개되면 안되므로 삭제(담당자에게 문의)
		Message coolsms 	= new Message(apiKey, apiSecret);
		
		String result = "";
		String msg = "";
		
		Map<String, String> params = new HashMap<String, String>();
	    params.put("to", hp);									//수신번호 입력 (콤마[,]로 구분된 수신번호 입력가능)
	    params.put("from", "01025550359");						//등록한 발신번호만 해당됨(다른번호 집어넣으면 안됨!)
	    params.put("type", "SMS");								//단문메시지(장문[2000자] : LMS)
	    params.put("text", "렌탈미 회원가입 인증코드 : "+key);	//전송될 문자내용
//	    params.put("app_version", "test app 1.2"); 				// application name and version		
		
    	//수신폰으로 휴대폰 인증코드 발송
		try {
			JSONObject 	json = coolsms.send((HashMap<String, String>) params);
			
			
			params.put("successCnt", String.valueOf(json.get("success_count")));
			params.put("errCnt", String.valueOf(json.get("error_count")));
	    	
	    	//핸드폰 정상전송
	    	if(params.get("successCnt").equals("1") && params.get("errCnt").equals("0")) {
	    		result = key;
	    	}else {
	    		key = "err";
	    		result = key;
	    	}
			
		} catch (CoolsmsException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
}
