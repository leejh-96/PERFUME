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
import com.scent.perfume.event.model.vo.ReplyBoard;
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


/////////////////////////////////////////////////이벤트게시판//////////////////////////////////////////////////
	

// 게시판 목록 조회
	@Override
	@Transactional
	public int getEventCount() {
		return mapper.selectEventBoardCount();
	}
	@Override
	@Transactional
	public List<ReplyBoard> getEventList(PageInfo pageInfo) {
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
	public List<ReplyBoard> getEventListByKeyword(PageInfo pageInfo, String type, String keyword) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return mapper.selectAllByKeyword(rowBounds, type, keyword);
	}

// 상세 게시글 보기
	@Override
	@Transactional
	public ReplyBoard findBoardByNo(int no) {
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
	public String findPreTitleByNo(int no) {
		return mapper.selectPreTitleByNo(no);
	}
	@Override
	@Transactional
	public String findNextTitleByNo(int no) {
		return mapper.selectNextTitleByNo(no);
	}
	@Override
	@Transactional
	public int findPreNoByPreTitle(String preTitle) {
		return mapper.selectPreNoByPreTitle(preTitle);
	}
	@Override
	@Transactional
	public int findNextNoByNextTitle(String nextTitle) {
		return mapper.selectNextNoByNextTitle(nextTitle);
	}

// 게시글 작성 수정
	@Override
	@Transactional
	public int saveEventWrite(ReplyBoard board) {
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
	public int getParticipateEventMNo(int mNo) {
		return mapper.getParticipateEventMNo(mNo);
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




}
