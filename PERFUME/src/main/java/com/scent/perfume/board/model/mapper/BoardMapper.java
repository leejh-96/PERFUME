package com.scent.perfume.board.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import com.scent.perfume.board.model.vo.Notice;

@Mapper
public interface BoardMapper {
//	내가 실행시키고자 하는 board-mapper.xml의 id와 동일한 이름의 추상메서드명을 지어주면 된다. 
//	추상메서드의 매개변수나 반환타입도 mapper.xml의 해당 태그의 속성들을 참고해서 생성시켜 준다.
	int selectBoardCount();
	
	/*
	 * 페이징처리를 위해 매개변수로 rowbounds를 넣어준다. 
	 * Board타입의 List를 만들어 반환시켜주기위해 List컬렉션으로 반환타입을 지정한다.
	 */
	List<Notice> selectAll(RowBounds bounds, String string);
	
	/*
	 * 매개변수로 정수형인 게시글번호(no)를 받아준다. 
	 * board-mapper.xml에서 id값이 findBoardByNo인 resultMap의 return타입과 일치시켜야 한다.
	 */
	Notice selectBoardByNo(@Param("BNo") int no);
	
// mapper.xml에서 update문이 수행되었으므로 반환결과는 int형이다.	
	int updateStatus(@Param("BNo") int no, @Param("BStatus") String status);
	
	int insertBoard(Notice board);
	
	int updateBoard(Notice board);

	int updateReadCount(@Param("board")Notice board);
}
