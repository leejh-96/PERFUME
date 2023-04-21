package com.scent.perfume.event.model.service;

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
	public Boolean isDuplicateId(String id) {
		return mapper.selectMemberById(id) != null;
	}


/////////////////////////////////////////////////이벤트게시판//////////////////////////////////////////////////
	

// 게시판 목록 조회
	@Override
	public int getEventCount() {
		return mapper.selectEventBoardCount();
	}
	@Override
	public List<Board> getEventList(PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return mapper.selectAll(rowBounds);
	}

// 게시물 검색 기능
	@Override
	public int getEventCountByKeyword(String type, String keyword) {
		return mapper.selectEventCountByKeyword(type, keyword);
	}
	@Override
	public List<Board> getEventListByKeyword(PageInfo pageInfo, String type, String keyword) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return mapper.selectAllByKeyword(rowBounds, type, keyword);
	}

// 상세 게시글 보기
	@Override
	public Board findBoardByNo(int no) {
		return mapper.selectEventViewByNo(no);
	}

}
