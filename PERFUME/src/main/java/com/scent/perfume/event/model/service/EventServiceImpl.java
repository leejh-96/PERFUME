package com.scent.perfume.event.model.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Slf4j
@Service
public class EventServiceImpl implements EventService {
	
	// 회원가입 전화번호인증 문자전송
	public void certifiedPhoneNumber(String phoneNumber, String numStr) {
		String api_key = "테스트시홈피에서키받아서하기";
		String api_secret = "테스트할때홈피에서키받아서하기";
		Message coolsms = new Message(api_key, api_secret);
		
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNumber);    
		params.put("from", "010-6743-3373");   
		params.put("type", "SMS");
		params.put("text", "문자전송 테스트 " + numStr + "테스트확인");
		params.put("app_version", "test app 1.2"); // application name and version
		
		try {
		    JSONObject obj = (JSONObject) coolsms.send(params);
		    System.out.println(obj.toString());
		} catch (CoolsmsException e) {
		    System.out.println(e.getMessage());
		    System.out.println(e.getCode());
		}

   }


}
