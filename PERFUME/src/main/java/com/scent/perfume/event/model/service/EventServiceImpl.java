package com.scent.perfume.event.model.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scent.perfume.common.util.PageInfo;
import com.scent.perfume.event.model.mapper.EventMapper;
import com.scent.perfume.event.model.vo.Board;
import com.scent.perfume.event.model.vo.Terms;
import com.scent.perfume.planning.model.vo.Member;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Slf4j
@Service
public class EventServiceImpl implements EventService {
	// 매퍼
	@Autowired
	private EventMapper mapper;
	
	
	// 비밀번호 암호화
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	// 회원가입 전화번호인증 문자전송
	@Transactional
	public void certifiedPhoneNumber(String phoneNumber, String numStr) {
		String api_key = "NCSWVWI29SPJDRIE";
		String api_secret = "0VP1LIITRL1C4ODRRN0VGG3ZXFW2Z6WN";
		Message coolsms = new Message(api_key, api_secret);
		
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNumber);    
		params.put("from", "010-6743-3373");   
		params.put("type", "SMS");
		params.put("text", "향수 쇼핑몰 [내음] 회원가입 인증 번호는 [" + numStr + "]입니다.");
		params.put("app_version", "test app 1.2"); // application name and version
		
		try {
		    JSONObject obj = (JSONObject) coolsms.send(params);
		    System.out.println(obj.toString());
		} catch (CoolsmsException e) {
		    System.out.println(e.getMessage());
		    System.out.println(e.getCode());
		}

   }

// 회원가입
	@Override
	@Transactional // 트랜잭션 처리(커밋 롤백)를 해주는 메소드
	public int save(Member member, Terms terms, String tCheck) {
		
		int result = 0;
		int mNo = 0;
		
		if(member.getNo() > 0) {
			// update
			
		} else {
			// insert
			// 패스워드 암호화
			member.setPwd(passwordEncoder.encode(member.getPwd()));
			
			// Member에 값 넣기
			mapper.insertMember(member);
			
			// db에서 id와 일치하는 mNo값 가져오기
			mNo = mapper.selectMnoById(member.getId());
			
			terms.setMNo(mNo);
			terms.setTCheck(tCheck);
			
			// 가져온 mNo로 Terms에 값 넣기
			result = mapper.insertTerms(terms);
		}
		
		return result;
	}

// 회원가입 아이디 중복 검사
	@Override
	@Transactional
	public Boolean isDuplicateId(String id) {
		return mapper.selectMemberById(id) != null;
	}
	
// 회원가입 이메일 중복 검사
	@Override
	@Transactional
	public Boolean isDuplicateEmail(String email) {
		return mapper.selectMemberByEmail(email) != null;
	}

// 회원가입 폰 중복 검사
	@Override
	@Transactional
	public Boolean isDuplicatePhone(String phone) {
		return mapper.selectMemberByPhone(phone) != null;
	}


/////////////////////////////////////////////////이벤트게시판//////////////////////////////////////////////////
	

// 게시판 목록 조회
	@Override
	@Transactional
	public int getEventCount() {
		return mapper.selectEventBoardCount();
	}
	@Override
	@Transactional
	public List<Board> getEventList(PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return mapper.selectAll(rowBounds);
	}

// 게시물 검색 기능
	@Override
	@Transactional
	public int getEventCountByKeyword(String type, String keyword) {
		return mapper.selectEventCountByKeyword(type, keyword);
	}
	@Override
	@Transactional
	public List<Board> getEventListByKeyword(PageInfo pageInfo, String type, String keyword) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return mapper.selectAllByKeyword(rowBounds, type, keyword);
	}

// 상세 게시글 보기
	@Override
	@Transactional
	public Board findBoardByNo(int no) {
		return mapper.selectEventViewByNo(no);
	}
	@Override
	@Transactional
	public Date selectEventStartByTitle(String bTitle) {
		return mapper.selectEventStartByTitle(bTitle);
	}
	@Override
	@Transactional
	public Date selectEventEndByTitle(String bTitle) {
		return mapper.selectEventEndByTitle(bTitle);
	}

	@Override
	@Transactional
	public int findPreNoByBNo(int no) {	
		return mapper.selectPreNoByBNo(no);
	}

	@Override
	@Transactional
	public int findNextNoByBNo(int no) {
		return mapper.selectNextNoByBNo(no);
	}
	
	@Override
	@Transactional
	public String findPreTitleByPreNo(int preNo) {
		return mapper.selectPreTitleByPreNo(preNo);
	}

	@Override
	@Transactional
	public String findNextTitleByNextNo(int nextNo) {
		return mapper.selectNextTitleByPreNo(nextNo);
	}

// 게시글 작성 수정
	@Override
	@Transactional
	public int saveEventWrite(Board board) {
		int result = 0;
		
		if(board.getBNo()>0) {
			result = mapper.updateEventBoard(board);
		} else {
			result = mapper.insertEventBoard(board);
		}
		
		return result;
	}

// 게시글 삭제
	@Override
	@Transactional
	public int deleteEventBoard(int no) {
		return mapper.updateEventBoardStatus(no, "N");
	}


/////////////////////////////////////////////////이벤트//////////////////////////////////////////////////


// 이벤트 참여	
	// 선택약관 동의 여부 확인
	@Override
	@Transactional
	public String findOptionAgreeByMNo(int mNo) {
		return mapper.findOptionAgreeByMNo(mNo);
	}
	// 선택약관 동의('Y')로 변경 TERMS 테이블의 T_CHECK 컬럼
	@Override
	@Transactional
	public int updateOptionAgr(int mNo) {
		return mapper.updateOptionAgr(mNo);
	}
	// 이미 참여한 회원인지 확인
	@Override
	@Transactional
	public int getParticipateEventMNo(int mNo, int bnNo) {
		return mapper.getParticipateEventMNo(mNo, bnNo);
	}
	// BTitle로 혜택 번호(BENEFIT 테이블의 BN_NO) 알아오기
	@Override
	@Transactional
	public int getBnNoByBTitle(String bTitle) {
		return mapper.getBnNoByBTitle(bTitle);
	}
	// 이벤트 참여 회원 DB에 저장
	@Override
	@Transactional
	public int participateEvent(int mNo, int bnNo) {
		return mapper.insertMnoMemberEvent(mNo, bnNo);
	}

// 당첨자 추첨
	// 랜덤값으로 당첨자 추첨
	@Override
	@Transactional
	public int pickEventWinner(int bnNo) {
		return mapper.getEmNoByBnNo(bnNo);
	}
	// 당첨자 회원 번호 가져오기
	@Override
	@Transactional
	public int getEpMNo(int emNo) {
		return mapper.getEpMNoByEmNo(emNo);
	}
	// 당첨자 정보 EVENT PRIZE 테이블에 인서트
	@Override
	@Transactional
	public int insertEventPrize(int emNo, int epMNo) {
		return mapper.insertEventPrize( emNo, epMNo);
	}
	// 당첨자에게 쿠폰 발급 BENEFIT, MEMBER_BENEFIT_INFO, PRODUCT_BENEFIT INSERT
	@Override
	@Transactional
	public int insertBenefit(int epMNo, String BTitle) {
		String benefitTitle = null;
		int resultBenefit = 0;
		int resultMemberBenefitInfo = 0;
		int resultProductBenefit = 0;
		
		benefitTitle = BTitle + " 당첨자 쿠폰";
//		log.info("베네핏 타이틀 로그 benefitTitle : {}", benefitTitle);
		
		// BENEFIT에 INSERT
		resultBenefit = mapper.insertBenefitForWinner(benefitTitle);
//		log.info("베네핏 인서트 잘 됐는지 확인 resultBenefit 0이면 안됨 1이면 됨 : {}",resultBenefit);
		
		// benefitTitle로 BN_NO 찾아오기
		int bnNo = mapper.getBnNoByBenefitTitle(benefitTitle);
//		log.info("비엔 엔오 새로 만든 이벤트명과 동일한지 확인 4월 ~ 당첨자 쿠폰 : {}", bnNo);
		// MEMBER_BENEFIT_INFO에 INSERT
		resultMemberBenefitInfo = mapper.insertMemberBenefitInfoForWinner(bnNo, epMNo);
//		log.info("멤버 베네핏인포에 당첨자 정보 잘 들어갔는지 확인 : {}", resultMemberBenefitInfo);
		// BTitle에서 향수 이름 알아오기 (PRODUCT 테이블에서 상품 번호 불러오기위해)
		String namePrize = mapper.selectNamePrizeByBTitle(BTitle);
//		log.info("상품이름 향수 이름! 잘 가져오나 확인 : {}", namePrize);
		// namePrize로 PRODUCT 테이블에서 상품 코드 가져오기
		int pNo = mapper.seletPNoByNamePrize(namePrize);
		log.info("피엔오상품번호잘 가져왔나 확인 : {}", pNo);
		// PRODUCT_BENEFIT에 혜택번호, 상품번호 INSERT
		resultProductBenefit = mapper.insertProductBenefit(bnNo, pNo);
//		log.info("프로덕트 베네핏 인서트 잘 됐는지 확인 resultProductBenefit 0이면 안됨 1이면 됨 : {}", resultProductBenefit);
		
		//셋다 > 0 이면 return 1, 하나라도 !>0 이면 return 0
		if( resultBenefit > 0 && resultMemberBenefitInfo > 0 && resultProductBenefit > 0) {
			return 1;
		} else {
			return 0;
		}
		
	}
	
	// epMNo로 당첨자 전화번호 알아오기
	@Override
	@Transactional
	public String findPhoneNoForWinner(int epMNo) {
		return mapper.selectPhoneNoForWinner(epMNo);
	}

	// 향수 증정 이벤트 당첨자 문자 전송
	@Transactional
	public boolean sendSMSToWinner(String winnerPhone, String BTitle) {
		String api_key = "NCSWVWI29SPJDRIE";
		String api_secret = "0VP1LIITRL1C4ODRRN0VGG3ZXFW2Z6WN";
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", winnerPhone);    
		params.put("from", "010-6743-3373");   
		params.put("type", "SMS");
		params.put("text", "축하드립니다. 향수 쇼핑몰 내음의 [" + BTitle + "]에 당첨되셨습니다.");
		params.put("app_version", "test app 1.2"); // application name and version
		
		// 메시지 전송 성공 여부 반환
	    try {
	        coolsms.send(params);
	        return true;
	    } catch (CoolsmsException e) {
	        e.printStackTrace();
	        return false;
	    }	
	}
	// 당첨 뽑기 중복 금지
	@Override
	@Transactional
	public String getBnTitleByBTitleForWinner(String bnTitle) {
		return mapper.getBnTitleByBTitleForWinner(bnTitle);
	}

	/*
	 * @Override public ReplyBoard findBoardByNo(int no) { // TODO Auto-generated
	 * method stub return null; }
	 * 
	 * @Override public int saveEventWrite(ReplyBoard board) { // TODO
	 * Auto-generated method stub return 0; }
	 */

	






}
