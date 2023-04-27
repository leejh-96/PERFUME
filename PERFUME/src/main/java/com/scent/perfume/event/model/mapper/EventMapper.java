package com.scent.perfume.event.model.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.scent.perfume.cart.model.vo.Benefit;
import com.scent.perfume.event.model.vo.Board;
import com.scent.perfume.event.model.vo.MemberBenefitInfo;
import com.scent.perfume.event.model.vo.Terms;
import com.scent.perfume.planning.model.vo.Member;

//매퍼인터페이스 방식으로 mapper.xml와 연결하는 방법
//@Mapper 추가해야 세션 얻어오는 과정 없이 바로 매퍼와 연결이 가능함
@Mapper
public interface EventMapper {
// 매퍼인터페이스 방식으로 mapper.xml와 연결하는 방법
// 별도의 구현체가 필요 없고 마이바이티스가 알아서 구현 해준다.
// 인터페이스 구현 객체를 따로 생성(EventDaoImpl)를 EventMapper로 변경 후 작업

// 회원가입 기능
	// 실행시킬 쿼리문의 ID와 동일한 이름의 추상메소드 생성 매개값으로 넣은 member를 갖고서 메소드명과 동일한 쿼리문을 수행시킴	
	// Member 추가
	int insertMember(Member member);
	// Terms 추가
	int selectMnoById(String id);
	int insertTerms(Terms terms);
	
// 회원가입 아이디 중복 검사
	Member selectMemberById(@Param("id") String id);
	
// 회원가입 이메일 중복 검사
	Member selectMemberByEmail(@Param("email") String email);

// 회원가입 폰 중복 검사
	Member selectMemberByPhone(@Param("phone") String phone);
	
// 회원가입 이메일 인증
	// id를 통해 M_MAILSTATUS 컬럼을 난수로 변경
	int getKey(@Param("id") String id, @Param("key") String key);
	// id를 통해 M_MAILSTATUS 컬럼을 N으로 변경
	int updateMMailStatus(@Param("id") String id, @Param("key") String key);
	
// 회원가입 쿠폰 발급
	int insertBenefit(Benefit benefit);
	int insertMemberBenefitInfo(@Param("bnNo") int bnNo, @Param("mNo") int mNo, MemberBenefitInfo memBenefitInfo);

	
/////////////////////////////////////////게시판///////////////////////////////////	
	
	
// 게시판 목록 조회
	int selectEventBoardCount();
	List<Board> selectAll(RowBounds rowBounds);
	
// 게시물 검색
	int selectEventCountByKeyword(@Param("type") String type, @Param("keyword") String keyword);
	List<Board> selectAllByKeyword(@Param("rowBounds") RowBounds rowBounds, @Param("type") String type, @Param("keyword") String keyword);

// 게시물 검색
	Board selectEventViewByNo(@Param("no") int no);

// 게시물 보기	
	Date selectEventStartByTitle(String bTitle);
	Date selectEventEndByTitle(String bTitle);
	int selectPreNoByBNo(int no);
	int selectNextNoByBNo(int no);
	String selectPreTitleByPreNo(int preNo);
	String selectNextTitleByPreNo(int nextNo);
	
// 게시글 등록
	int insertEventBoard(Board board);
	int updateEventBoard(Board board);
	
// 게시글 삭제
	int updateEventBoardStatus(@Param("no") int no, @Param("bStatus") String bStatus);

	
/////////////////////////////////////////게시판///////////////////////////////////	


// 이벤트 참여
	// 선택약관 동의 여부 확인
	String findOptionAgreeByMNo(int mNo);
	// 선택약관 동의('Y')로 변경 TERMS 테이블의 T_CHECK 컬럼
	int updateOptionAgr(int mNo);
	// 이미 참여한 회원인지 확인
	int getParticipateEventMNo(@Param("mNo") int mNo, @Param("bnNo") int bnNo);
	//	BTitle로 혜택 번호(BENEFIT 테이블의 BN_NO) 알아오기
	int getBnNoByBTitle(String bTitle);
	// 이벤트 참여 회원 DB에 저장
	int insertMnoMemberEvent(@Param("mNo") int mNo, @Param("bnNo") int bnNo);
	
// 당첨자 추첨
	// 랜덤으로 당첨자 추첨 (참여번호 가져오기)
	int getEmNoByBnNo(int bnNo);
	// 당첨자 회원번호 가져오기
	int getEpMNoByEmNo(int emNo);
	// 당첨자 정보 EVENT_PRIZE 테이블인서트
	int insertEventPrize(@Param("emNo") int emNo, @Param("epMNo") int epMNo);
	// 이벤트 당첨자 쿠폰 발급 BENEFIT에 INSERT
	int insertBenefitForWinner(String benefitTitle);
	// benefitTitle로 bnNo 얻어오기
	int getBnNoByBenefitTitle(String benefitTitle);
	// MEMBER_BENEFIT_INFO에 INSERT
	int insertMemberBenefitInfoForWinner(@Param("bnNo") int bnNo, @Param("epMNo") int epMNo);
	// BTitle에서 향수 이름 알아오기 (PRODUCT 테이블에서 상품 번호 불러오기위해)
	String selectNamePrizeByBTitle(String bTitle);
	// 상품 이름으로 상품번호 알아오기
	int seletPNoByNamePrize(String namePrize);
	// PRODUCT_BENEFIT에 혜택번호, 상품번호 INSERT
	int insertProductBenefit(@Param("bnNo") int bnNo, @Param("pNo") int pNo);
	// 당첨자 전화번호
	String selectPhoneNoForWinner(int epMNo);
	// 당첨 뽑기 중복 금지
	String getBnTitleByBTitleForWinner(String bnTitle);




	
}
