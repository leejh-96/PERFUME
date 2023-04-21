package com.scent.perfume.event.model.mapper;

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

// 게시글 등록
	int insertEventBoard(Board board);
	int updateEventBoard(Board board);
	
}
