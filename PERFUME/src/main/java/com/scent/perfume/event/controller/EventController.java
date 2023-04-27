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

import com.scent.perfume.cart.model.vo.Benefit;
import com.scent.perfume.common.util.MultipartFileUtil;
import com.scent.perfume.common.util.PageInfo;
import com.scent.perfume.event.model.service.EventService;
import com.scent.perfume.event.model.service.EventServiceImpl;
import com.scent.perfume.event.model.service.UserMailSendService;
import com.scent.perfume.event.model.vo.Board;
import com.scent.perfume.event.model.vo.MemberBenefitInfo;
import com.scent.perfume.event.model.vo.Terms;
import com.scent.perfume.planning.model.vo.Member;

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
	
// 이메일 중복 검사
	@PostMapping("/event/emailCheck")
	public ResponseEntity<Map<String, Boolean>> emailCheck(@RequestParam("email") String email){	
		Map<String, Boolean> map = new HashMap<>();
		
		map.put("duplicate", service.isDuplicateEmail(email));
		
		return ResponseEntity.ok()
							 .header(HttpHeaders.CONTENT_TYPE, MediaType
							 .APPLICATION_JSON_VALUE).body(map);		
	}
// 폰 중복 검사 /event/phoneCheck
	@PostMapping("/event/phoneCheck")
	public ResponseEntity<Map<String, Boolean>> phoneCheck(@RequestParam("phone") String phone){	
		Map<String, Boolean> map = new HashMap<>();
		
		map.put("duplicate", service.isDuplicatePhone(phone));
		
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
        
        //찐으로 쓸 때  서비스 api도 변경하기
        return numStr;
        //return "0000";
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
		
		// 인증 메일 보내는 메소드 기능 시연 시 주석 풀어두기
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
		modelAndView.addObject("searchType", type);
		modelAndView.addObject("searchKeyword", keyword);
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
		
		// 이전글 다음글 번호 알아오기
		int preNo = service.findPreNoByBNo(no);
		int nextNo = service.findNextNoByBNo(no);
		
		board.setPreNo(preNo);
		board.setNextNo(nextNo);

		log.info("이전글 다음글 번호 찾는서비스 탄 후 : {}", board);
		
		if(preNo != 0) {
			board.setPreTitle(service.findPreTitleByPreNo(preNo));
		}
		
		if(nextNo != 0) {
			board.setNextTitle(service.findNextTitleByNextNo(nextNo));
		}

		log.info("이전글 다음글 찾는서비스 탄 후 : {}", board);
		
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
		
		log.info("파인드 보드 바이 엔오 하고 : {}", board);
		log.info("로그인 멤버 : {}", loginMember);
		
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
		
		if(board != null && loginMember.getDivision() == 1) {
		
		
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
		
		// 어드민 확인
		int result = 0;
		Board board = null;
		
		board = service.findBoardByNo(no);
				
		if(board != null && loginMember.getDivision() == 1) {
			// 어드민 계정이 확인되면 삭제 작업
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
	
	
	// 향수 증정 이벤트 참여
	@GetMapping("/participatePresentPerfume")
	public ModelAndView participatePresentPerfume(ModelAndView modelAndView, @SessionAttribute("loginMember") Member loginMember,
												@RequestParam("bNo") int BNo, @RequestParam("bTitle") String BTitle) {
		System.out.println("향수 증정 이벤트 폼 참여!");
		
		int mNo = loginMember.getNo();
		
//		log.info("비엔오오오오오옹ㅇ  : {}", BNo);
//		log.info("엠엔오오오옹 : {}", mNo);
//		log.info("비타이이이이이트으으으으을 : {}", BTitle);
		
		// mNo(회원번호)를 통해 TERMS 테이블에서 선택약관 동의 여부 알아오기
		String optionAgr = service.findOptionAgreeByMNo(mNo);
		char ch = 'Y';
//		log.info("동의 여부 확인 : {}",optionAgr);
		
		if(!optionAgr.contains(Character.toString(ch))) { // String 과 char 타입이 자바에서는 다르기 때문에 직접 optionAgr != 'Y'이런 식으로 비교하면 에러 발생.
		// 선택 약관에 동의하지 않았을 때 (optionAgr에 'Y'가 포함되어 있지 않을 때)	약관 동의 선택 여부 묻기

			modelAndView.addObject("msg", "선택 약관에 동의하지 않으시면 참여가 불가능합니다. 동의 후 이벤트에 참여하시겠습니까?");
			modelAndView.addObject("locationAgr", "/optionAgree?bNo=" + BNo + "&mNo=" + mNo + "&bTitle=" + BTitle);	// 확인 후 작동 잘 하면 수신 동의 참여 컨트롤러로 변경!
			modelAndView.addObject("locationNotAgr", "/event/eventView?no=" + BNo);	// 수신 동의하지 않을시 해당 페이지에 머무르기		
			modelAndView.setViewName("event/confirm");
		} else {
		// 선택 약관에 동의했을 때 이벤트 참여
			// BTitle로 혜택 번호(BENEFIT 테이블의 BN_NO) 알아오기
			int bnNo = 0;
			bnNo = service.getBnNoByBTitle(BTitle);
			
			// 이미 참여한 회원인지 확인
			int participate = 0;
			participate = service.getParticipateEventMNo(mNo, bnNo);

			if(participate > 0) {
				// 이미 참여한 회원
				modelAndView.addObject("msg", "이미 이벤트에 참여하셨습니다.");
				modelAndView.addObject("location", "/event/eventView?no=" + BNo);	
			} else {
				// EVENT_MEMBER에 회원 mNo INSERT
				
				log.info("엠엔오오오오오 : {}", mNo);
				log.info("비엔엠오오오오오 : {}", bnNo);
				// 이벤트 참여 회원 DB에 저장
				int successParticipate = 0;
				successParticipate = service.participateEvent(mNo, bnNo);
				
				if(successParticipate > 0) {
					modelAndView.addObject("msg", "이벤트 참여가 완료되었습니다. 당첨자에게는 문자를 전송해 드리니 당첨일 이후 확인부탁드립니다.");
					modelAndView.addObject("location", "/event/eventView?no=" + BNo);
				} else {
					modelAndView.addObject("msg", "이벤트 참여가 정상적으로 완료되지 않았습니다.");
					modelAndView.addObject("location", "/event/eventView?no=" + BNo);
				}
				
			}

			modelAndView.setViewName("common/msg");		
		}
		
		return modelAndView;
	}
	
	// 선택약관 Y로 변경
	@GetMapping("/optionAgree")
	public ModelAndView updateOptionAgree(ModelAndView modelAndView, @RequestParam("mNo") int mNo,
										  @RequestParam("bNo") int BNo, @RequestParam("bTitle") String BTitle) {
		System.out.println("선택약관 변경 컨트롤러 잘 탔는지 확인 시소");
		
		int result = 0;
		
//		log.info("비엔오오오오오옹ㅇ  : {}", BNo);
//		log.info("엠엔오오오옹 : {}", mNo);
//		log.info("비타이이이이이트으으으으을 : {}", BTitle);
		
		// 선택약관 Y로 변경
		result = service.updateOptionAgr(mNo);
		
		if(result > 0 ) {
			// 동의 변경 성공
			modelAndView.addObject("msg", "선택 약관 동의 여부를 '동의'로 바꾸었습니다.");
			modelAndView.addObject("location", "/participatePresentPerfume?bNo=" + BNo + "&bTitle=" + BTitle);
					// ㄴ 다시 쿠폰 이벤트 컨트롤러 탈 수 있도록 보내기 
		} else {
			// 동의 변경 실패
			modelAndView.addObject("msg", "선택 약관 동의 여부를 '동의'로 변경하는 데 실패하였습니다.");
			modelAndView.addObject("location", "/event/eventView?no=" + BNo);
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	// 당첨자 추첨 컨트롤러
	@GetMapping("/pickWinner")
	public ModelAndView pickWinner(ModelAndView modelAndView, @SessionAttribute("loginMember") Member loginMember,
								@RequestParam("bNo") int BNo, @RequestParam("bTitle") String BTitle) {
		System.out.println("당첨자 추첨 컨트롤러 잘 탔는지 시소");
		
		int bnNo = 0;
		int emNo = 0;
		int epMNo = 0;
		int setEventPrize = 0;
		int setBenefit = 0;
		
		if( loginMember.getDivision() != 1) {
			modelAndView.addObject("msg", "관리자만 접근할 수 있는 페이지입니다.");
			modelAndView.addObject("location", "/eventList");	
		} else {
			
			String pickEventWinner = null;
			String bnTitle = BTitle + " 당첨자 쿠폰";
			// 이미 당첨자 뽑은 이벤트인지 확인
			pickEventWinner = service.getBnTitleByBTitleForWinner(bnTitle);
			
			if(pickEventWinner != null) {
				// 이미 당첨자 뽑은 이벤트
				modelAndView.addObject("msg", "이미 당첨자를 뽑은 이벤트입니다.");
				modelAndView.addObject("location", "/event/eventView?no=" + BNo);	
			} else {
			
				// BTitle로 BENEFIT 테이블에서 혜택번호(BN_NO) 알아오기
				bnNo = service.getBnNoByBTitle(BTitle);
//				log.info("비이이이이엔엔오오오오오옹 bnNo : {}", bnNo);
				
				// bnNo(혜택번호)를 가져가 이벤트를 조건으로 지정한 후 해당 이벤트 당첨자(EM_NO 참여번호, EP_MNO 회원번호) 뽑기
				// EM_NO(참여 번호 뽑기) 랜덤 추출
				emNo = service.pickEventWinner(bnNo);
//				log.info("이엠엔오오오오오옹 emNo : {}", emNo);
				// emNo로 epMNo 가져오기
				epMNo = service.getEpMNo(emNo);
//				log.info("이피피피피피피피엠엔오 epMNo : {}", epMNo);
				// 당첨자 정보 DB 저장
				setEventPrize = service.insertEventPrize(emNo, epMNo);
//				log.info("셋이벤트 프라이즈 저장 잘됐으면 1 : {}", setEventPrize);
				
				if(setEventPrize > 0) { // 제대로 저장 완료
					// 당첨자에게 쿠폰 발급 benefit 에 인서트 작업 setBenefit 추출
					setBenefit = service.insertBenefit(epMNo, BTitle);
//					log.info("베네핏 잘들어갔으면 1 : {}", setBenefit);
					
					if(setBenefit > 0 ) { // 제대로 저장 완료
//						// epMNo로 당첨자 전화번호 알아오기
						String winnerPhone = service.findPhoneNoForWinner(epMNo);
						log.info("당첨자 폰번호 : {}", winnerPhone);
//						
//						// 폰번호 받아와 문자 전송 coolsms api로					
						if (eventServiceImpl.sendSMSToWinner(winnerPhone, BTitle)) {
							modelAndView.addObject("msg", "당첨자 추첨이 완료되었습니다. 관리자 페이지에서 발급된 쿠폰을 확인해주세요.");
							modelAndView.addObject("location", "/event/eventView?no=" + BNo);
					    } else {
					    	modelAndView.addObject("msg", "메세지 전송에 실패하였습니다.");
					    	modelAndView.addObject("location", "/event/eventView?no=" + BNo);
					    }
							
					} else { // 베네핏 저장 실패
						modelAndView.addObject("msg", "당첨자 추첨이 제대로 완료되지 않았습니다. BENEFIT INSERT ERROR");
						modelAndView.addObject("location", "/event/eventView?no=" + BNo);	
					}
					
				} else { // 이벤트 프라이스 테이블에 제대로 저장 미완료
					modelAndView.addObject("msg", "당첨자 추첨이 제대로 완료되지 않았습니다. EVENT_PRIZE INSERT ERROR");
					modelAndView.addObject("location", "/event/eventView?no=" + BNo);		
				}
			}
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	
	
}
