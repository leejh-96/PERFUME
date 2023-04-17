package com.scent.perfume.event.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scent.perfume.event.model.service.EventServiceImpl;
import com.scent.perfume.common.util.*;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EventController {
	@Autowired
	private ResourceLoader resourceLoader;
		// ResourceLoader 스프링에서 리소스 읽어오는 빈, 조금 더 편하게 읽어오게 만들어줌
	
	@Autowired
	EventServiceImpl eventServiceImpl;
	
	// 회원가입 페이지 연결
	@RequestMapping("/aboutSite")
	public String aboutSite() {
		System.out.println("사이트 소개창 연결 테스트");
		return "event/aboutSite";
	}
	
	
	// 회원가입 페이지 연결
	@RequestMapping("/join")
	public String join() {
		System.out.println("회원가입 창 연결 테스트");
		return "event/join";
	}
	
	// 문자 메세지 전송 컨트롤러
	@RequestMapping("/sendSMS") //jsp 페이지 넘긴 mapping 값
	@ResponseBody    
    public String sendSMS(String phoneNumber) {
 
		//랜덤숫자 생성
        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }
        
        // 휴대폰 api 쪽으로 가기
        eventServiceImpl.certifiedPhoneNumber(phoneNumber, numStr);
        
        //찐으로 쓸 때  return numStr; 서비스 api도 변경하기
        return "0000";
    }
	
	
	
	
	
//////////////////////////////////////////////////////위 회원가입 아래 이벤트 게시판/////////////////////////////////////////////////////////////////////////	
	
	
	
	

	// 이벤트 게시판 연결
	@RequestMapping("/eventList")
	public String eventList() {
		System.out.println("이벤트 게시판 창 연결 테스트");
		return "event/eventList";
	}	

	// 이벤트 게시글 연결
	@RequestMapping("/eventView")
	public String eventView() {
		System.out.println("이벤트 상세 게시글 연결 테스트");
		return "event/eventView";
	}
	
	// 게시글 작성 연결
	@RequestMapping("/eventWrite")
	public String eventWrite() {
		System.out.println("이벤트 작성 창 연결 테스트");
		return "event/eventWrite";
	}	
	
	// 썸머노트 다중 이미지 업로드
	@RequestMapping(value="/uploadSummernoteImageFile", method= RequestMethod.POST, produces="application/json; charset=utf8")
	@ResponseBody
	public Object uploadSummernoteImageFile(@RequestParam("file") MultipartFile upfile,
			HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		
		// 1. 파일을 업로드 했는지 확인 후 파일을 저장(물리적 위치에)
		if(upfile != null && !upfile.isEmpty()) {	// !upfile.isEmpty() => false이면. 비었다의 반대니까 false
			String location = null;
			String renamedFileName = null;
			
			try {
				location = resourceLoader.getResource("resources/upload/event").getFile().getPath();
						// resourceLoader를 통해 지정한 폴더에서 파일을 가져와서, 파일의 경로를 가져옴
				
				System.out.println("로케이션" + location);
				
				renamedFileName = MultipartFileUtil.save(upfile, location);
				
				System.out.println("리네임 파일 네임 " + renamedFileName);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
//			// vo Board board 오브젝트에 값 set 해주기
//			if(renamedFileName != null) {
//				board.setOriginalFileName(upfile.getOriginalFilename());
//				board.setRenamedFileName(renamedFileName);
//			}
			
			if(renamedFileName != null) {
				map.put("url", request.getContextPath() + "/resources/upload/event/" + renamedFileName);
				map.put("responseCode", "success");
				System.out.println("마지막 로케이션" + location);
				System.out.println("맵 url : " + map.get("url"));
				System.out.println("성공했나용");
			} else {
				map.put("responseCode", "error");
				System.out.println("실패했나용");
				}
			}
		
			return map;	
	}

	
	
	
//////////////////////////////////////////////////////위 이벤트 게시판 아래 이벤트 내용 /////////////////////////////////////////////////////////////////////////
	
	
	
}
