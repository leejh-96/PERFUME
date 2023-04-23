package com.scent.perfume.event.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.scent.perfume.event.model.service.EventService;
import com.scent.perfume.event.model.service.EventServiceImpl;
import com.scent.perfume.event.model.service.UserMailSendService;
import com.scent.perfume.event.model.vo.Board;
import com.scent.perfume.event.model.vo.MemberBenefitInfo;
import com.scent.perfume.event.model.vo.Terms;
import com.scent.perfume.planning.model.vo.Member;
import com.scent.perfume.cart.model.vo.Benefit;
import com.scent.perfume.common.util.*;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EventController {
	@Autowired
	private ResourceLoader resourceLoader;
		// ResourceLoader 스프링에서 리소스 읽어오는 빈, 조금 더 편하게 읽어오게 만들어줌
	@Autowired
	private EventService service;
	@Autowired
	EventServiceImpl eventServiceImpl;
	@Autowired
	private UserMailSendService mailsender;
	
// 사이트 소개 페이지 연결
	@RequestMapping("/aboutSite")
	public String aboutSite() {
		System.out.println("사이트 소개창 연결 테스트");
		return "event/aboutSite";
	}
	
	
// 회원가입 페이지 연결
	@GetMapping("join")
	public String join() {
		System.out.println("회원가입 창 연결 테스트");
		return "event/join";
	}
	
// 아이디 중복 검사
	@PostMapping("/event/idCheck")
	public ResponseEntity<Map<String, Boolean>> idCheck(@RequestParam("id") String id){	
		Map<String, Boolean> map = new HashMap<>();
		
		map.put("duplicate", service.isDuplicateId(id));
		
		return ResponseEntity.ok()
							 .header(HttpHeaders.CONTENT_TYPE, MediaType
							 .APPLICATION_JSON_VALUE).body(map);		
	}
	
// 전화번호 인증 문자 메세지 전송 컨트롤러
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
	
// 회원가입
	@PostMapping("join")
	public ModelAndView login(ModelAndView modelAndView, @ModelAttribute Member member, @ModelAttribute Terms terms,
					@RequestParam("birthYear") String birthYear, @RequestParam("birthMonth") String birthMonth, @RequestParam String birthDate, 
					@RequestParam("addr1") String addr1, @RequestParam(required = false) String addr2, 
					@RequestParam(required = false) String addr3, @RequestParam(defaultValue = "N") String tCheck,
					HttpServletRequest request) {
		log.info(member.toString());
		log.info("join() - 호출 : {} {} {} {} {} {} {}", new Object[] {birthYear, birthMonth, birthDate, addr1, addr2, addr3, tCheck});

		// 생년월일 합치기
		Date birth = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		try {
			birth =(Date) sdf.parse(birthYear + birthMonth + birthDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
        member.setBirth(birth);
        
        // 주소 합치기
        String addr = addr1 + " " + addr2 + " " + addr3;
        member.setAddr(addr);
        
		log.info(member.toString());
		
		int result = 0;
		
		result = service.save(member, terms, tCheck);	// tCheck 선택약관동의
		
		// 인증 메일 보내는 메소드
		mailsender.mailSendWithUserKey(member.getMail(),member.getId(), request);
		
		if(result > 0) {
			modelAndView.addObject("msg", "회원가입 인증 이메일이 발송되었습니다. 등록한 이메일을 확인해주시고 인증 절차를 거쳐주시기 바랍니다.");
			modelAndView.addObject("location", "/");
		} else {
			modelAndView.addObject("msg", "회원가입이 정상적으로 완료되지 않았습니다. 다시 시도해주십시오.");
			modelAndView.addObject("location", "/join");			
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
// 이메일 인증 컨트롤러 전송된 이메일 링크 타면 나오는 페이지 연결
	@GetMapping("/join/key_update")
	public String key_alterConfirm(@RequestParam("m_id") String id, @RequestParam("m_mailstatus") String key, Benefit benefit, MemberBenefitInfo memBenefitInfo) {
								// UserMailSendService 서비스의 mailSendWithUserKey 메소드 a태그 내 url에서 name 속성 지정한 값을 RequestParam의 속성명으로 주기 
		mailsender.alter_userKey_service(id, key, benefit, memBenefitInfo);
		
		return "event/userJoinSuccess";
	}
	
	
//////////////////////////////////////////////////////위 회원가입 아래 이벤트 게시판/////////////////////////////////////////////////////////////////////////	
	
	
	// 이벤트 게시판 연결
	@GetMapping("eventList")
	public ModelAndView eventList(ModelAndView modelAndView, @RequestParam(defaultValue="1") int page) {
		System.out.println("이벤트 게시판 창 연결 테스트");
		
		int listCount = service.getEventCount();
		
//		log.info("page : {}", page);
//		log.info("listCount : {}", listCount);
		
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 10);
		List<Board> list = service.getEventList(pageInfo);
		
//		log.info("list : {}", list);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("event/eventList");
		
		return modelAndView;
	}
	
	// 게시판 검색 기능
	@GetMapping("eventSearch")
	public ModelAndView eventSearch(ModelAndView modelAndView,
					@RequestParam(value="searchType", defaultValue="3") String type,
					@RequestParam(value="searchKeyword", required=false) String keyword, @RequestParam(defaultValue="1") int page) {
		System.out.println("이벤트 검색 잘 연결됐나요");
		
//		log.info("탕아아아아아ㅏ아ㅏ아아이이이이입ㅂㅂㅂㅂ : {}", type);
//		log.info("키잉이이이이워드으으으으ㅡ으으으으ㅡㅇㅇ : {}", keyword);
		
		int listCount = service.getEventCountByKeyword(type, keyword);
		
//		log.info("페에에ㅔ에에에이지지지이이이이ㅣ이ㅣ이ㅣㅇ잉 : {}", page);
//		log.info("리스트카운트트트트트트ㅡ트트ㅡ트ㅡ트트트 : {}", listCount);
		
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 10);
		List<Board> list = service.getEventListByKeyword(pageInfo, type, keyword);
		
//		log.info("list : {}", list);
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("event/eventSearch");
		
		return modelAndView;
	}
	

	// 이벤트 상세 게시글 연결
	@GetMapping("event/eventView")
	public ModelAndView eventView(ModelAndView modelAndView, @RequestParam("no") int no) {
		System.out.println("이벤트 상세 게시글 연결 테스트");
		Board board = null;
		
		log.info("no : {}", no);
		log.info("보드 파인드 보드 엔오 서비스 타기 전 : {}", board);
		
		
		board = service.findBoardByNo(no);
		log.info("보드 파인드 보드 엔오 서비스 탄 후 : {}", board);
		
		String bTitle = board.getBTitle();
		
		board.setBnCreateDate(service.selectEventStartByTitle(bTitle));
		board.setBnEndDate(service.selectEventEndByTitle(bTitle));
		log.info("보드 셋 서비스 탄 후 : {}", board);
		
//		String preTitle = service.findPreTitleByNo(no);
//		String nextTitle = service.findNextTitleByNo(no);
//		
//		board.setPreTitle(preTitle);
//		board.setNextTitle(nextTitle);
//		log.info("이전글 다음글 찾는서비스 탄 후 : {}", board);
//		board.setPreNo(service.findPreNoByPreTitle(preTitle));
//		board.setNextNo(service.findNextNoByNextTitle(nextTitle));
		
		String preTitle = service.findPreTitleByNo(no);
		String nextTitle = service.findNextTitleByNo(no);

		board.setPreTitle(preTitle != null ? preTitle : null);
		board.setNextTitle(nextTitle != null ? nextTitle : null);
		log.info("이전글 다음글 찾는서비스 탄 후 : {}", board);

		if (preTitle != null) {
		    board.setPreNo(service.findPreNoByPreTitle(preTitle));
		}
		if (nextTitle != null) {
		    board.setNextNo(service.findNextNoByNextTitle(nextTitle));
		}

		
		log.info("이전글 다음글 번호 찾는서비스 탄 후 : {}", board);
		
		modelAndView.addObject("board", board);
		modelAndView.setViewName("event/eventView");
		
		return modelAndView;
	}
	
	// 게시글 작성 창 연결
	@GetMapping("/eventWrite")
	public ModelAndView eventWrite(ModelAndView modelAndView, @SessionAttribute("loginMember") Member loginMember) {
		
		if( loginMember.getDivision() != 1) {
			modelAndView.addObject("msg", "관리자만 접근할 수 있는 페이지입니다.");
			modelAndView.addObject("location", "/eventList");	
			
			modelAndView.setViewName("common/msg");
		} else {
			modelAndView.setViewName("/event/eventWrite");
			System.out.println("이벤트 작성 창 연결 테스트");
		}
		
		return modelAndView;
	}

	// 게시글 등록
	@PostMapping("/eventWrite")
	public ModelAndView eventWrite(	
			ModelAndView modelAndView,
			@ModelAttribute Board board,
			@SessionAttribute("loginMember") Member loginMember) {
		System.out.println("이벤트 게시글 등록");
		
		if( loginMember.getDivision() != 1) {
			modelAndView.addObject("msg", "관리자만 접근할 수 있는 페이지입니다.");
			modelAndView.addObject("location", "/eventList");
		} else {
			int result = 0;
			
			board.setMNo(loginMember.getNo());

			result = service.saveEventWrite(board);
			
			log.info("board : {}", board);
			
			if(result > 0) {
				modelAndView.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
				modelAndView.addObject("location", "/event/eventView?no=" + board.getBNo());
				System.out.println("넌 뭐야 : " + board.getBNo());
			} else {
				modelAndView.addObject("msg", "게시글이 정상적으로 등록되지 않았습니다.");
				modelAndView.addObject("location", "/eventList");
				System.out.println("넌 뭔데 : " + board.getBNo());
				
			}		
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
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

	//업데이트용 다중이미지 업로드
	@RequestMapping(value="/event/uploadSummernoteImageFile", method= RequestMethod.POST, produces="application/json; charset=utf8")
	@ResponseBody
	public Object uploadSummernoteImageFileUpdate(@RequestParam("file") MultipartFile upfile,
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
	
	// 게시글 수정
	@GetMapping("/event/eventUpdate")
	public ModelAndView eventUpdate(ModelAndView modelAndView,
									@RequestParam("no") int no,
									@SessionAttribute("loginMember") Member loginMember) {
		Board board = null;
		
		log.info(loginMember.toString());
		log.info("no : {}", no);
		
		board = service.findBoardByNo(no);
		
		if(board != null && loginMember.getDivision() == 1) {
			modelAndView.addObject("board", board);
			modelAndView.setViewName("/event/eventUpdate");
		} else {
			modelAndView.addObject("msg", "관리자만 접근할 수 있는 페이지입니다.");
			modelAndView.addObject("location", "/eventList");
			
			modelAndView.setViewName("common/msg");
		}
		
		return modelAndView;
	}
	@PostMapping("/event/eventUpdate")
	public ModelAndView eventUpdate(ModelAndView modelAndView,
									@RequestParam("no") int no,
									@RequestParam("bTitle") String bTitle,
									@RequestParam("bContent") String bContent,
									@SessionAttribute("loginMember") Member loginMember) {
		int result = 0;
		Board board = null;
		
		log.info("{}, {}, {}", new Object[] {no, bTitle, bContent});
		
		board = service.findBoardByNo(no);
		
		if(board != null && board.getMNo() == loginMember.getNo()) {
		
		
			board.setBTitle(bTitle);
			board.setBContent(bContent);
			
			result = service.saveEventWrite(board);
			
			if(result > 0) {
				modelAndView.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
				modelAndView.addObject("location", "/event/eventView?no=" + board.getBNo());	
				
			} else {
				modelAndView.addObject("msg", "게시글 수정을 실패하였습니다.");
				modelAndView.addObject("location", "/event/eventUpdate?no=" + no);	// no라고 해도 되고 board.getNo()라도 해도 됨 둘 다 같은 게시글 번호임
			}
		
		} else {
			modelAndView.addObject("msg", "관리자만 접근할 수 있는 페이지입니다.");
			modelAndView.addObject("location", "/eventList");	
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}

	// 게시글 삭제
	@GetMapping("/eventDelete")
	public ModelAndView delete(ModelAndView modelAndView, @RequestParam int no,
			   @SessionAttribute("loginMember") Member loginMember) {
		
		// 본인 게시글 여부 확인
		int result = 0;
		Board board = null;
		
		board = service.findBoardByNo(no);
		
		if(board != null && board.getMNo() == loginMember.getNo()) {
			// 작성자 본인이 맞으면 삭제작업
			result = service.deleteEventBoard(no);
			
			if(result > 0) {
				modelAndView.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
				modelAndView.addObject("location", "/eventList");
			} else {
				modelAndView.addObject("msg", "게시글 삭제를 실패하였습니다.");
				modelAndView.addObject("location", "/event/eventView?no=" + no);
			}
			
		} else {
			// 본인이 맞지 않으면 삭제작업 없이 목록으로
			modelAndView.addObject("msg", "관리자만 접근할 수 있는 페이지입니다.");
			modelAndView.addObject("location", "/eventList");
		}
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
		
	}
	
	
//////////////////////////////////////////////////////위 이벤트 게시판 아래 이벤트 내용 /////////////////////////////////////////////////////////////////////////
	
	
	// 쿠폰 작성 연결
	@GetMapping("event/addCoupon")
	public String addCoupon() {
		return "event/testEvent";
	}
}
