package com.scent.perfume.event.model.service;

import java.util.Date;
import java.util.List;

import com.scent.perfume.common.util.PageInfo;
import com.scent.perfume.event.model.vo.Board;
import com.scent.perfume.event.model.vo.Terms;
import com.scent.perfume.planning.model.vo.Member;

public interface EventService {

// 회원가입
	int save(Member member, Terms terms, String tCheck);
// 회원가입 아이디 중복검사
	Boolean isDuplicateId(String id);
// 회원가입 이메일 중복검사
	Boolean isDuplicateEmail(String email);
// 회원가입 폰 중복검사
	Boolean isDuplicatePhone(String phone);
	
// 게시판 목록 조회
	int getEventCount();
	List<Board> getEventList(PageInfo pageInfo);
// 게시물 검색 기능
	int getEventCountByKeyword(String type, String keyword);
	List<Board> getEventListByKeyword(PageInfo pageInfo, String type, String keyword);
// 상세 게시글 보기
	Board findBoardByNo(int no);
	Date selectEventStartByTitle(String bTitle);
	Date selectEventEndByTitle(String bTitle);
	int findPreNoByBNo(int no);
	int findNextNoByBNo(int no);
	String findPreTitleByPreNo(int preNo);
	String findNextTitleByNextNo(int nextNo);
// 게시글 작성 수정
	int saveEventWrite(Board board);
// 게시글 삭제
	int deleteEventBoard(int no);
	
// 추첨 이벤트 참여
	// 선택약관 동의 여부 확인
	String findOptionAgreeByMNo(int mNo);
	// 선택약관 동의('Y')로 변경 TERMS 테이블의 T_CHECK 컬럼
	int updateOptionAgr(int mNo);
	// 이미 참여한 회원인지 확인
	int getParticipateEventMNo(int mNo, int bnNo);
	// BTitle로 혜택 번호(BENEFIT 테이블의 BN_NO) 알아오기
	int getBnNoByBTitle(String bTitle);
	// 이벤트 참여 회원 DB에 저장
	int participateEvent(int mNo, int bnNo);
// 이벤트 당첨자 추첨
	// 당첨자 선정 (참여번호 가져오기)
	int pickEventWinner(int bnNo);
	// 당첨자 회원 번호 가져오기
	int getEpMNo(int emNo);
	// EVENT_PRIZE INSERT
	int insertEventPrize(int emNo, int epMNo);
	// 당첨자에게 쿠폰 발급 BENEFIT, MEMBER_BENEFIT_INFO, PRODUCT_BENEFIT 테이블 INSERT
	int insertBenefit(int epMNo, String BTitle);
	// epMNo로 당첨자 전화번호 알아오기
	String findPhoneNoForWinner(int epMNo);
	// 당첨 뽑기 중복 금지
	String getBnTitleByBTitleForWinner(String bnTitle);




	
}
