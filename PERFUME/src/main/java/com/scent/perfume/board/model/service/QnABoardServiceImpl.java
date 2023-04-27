package com.scent.perfume.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scent.perfume.board.model.mapper.QnABoardMapper;
import com.scent.perfume.board.model.vo.QnABoard;
import com.scent.perfume.board.model.vo.Reply;
import com.scent.perfume.common.util.PageInfo;

//Service 어노테이션을 붙임으로써 비지니스로직을 처리해줄 수 있는 Bean으로 등록된다.
//그 후, Controller에서 BoardService빈을 주입받을 수 있다. 
@Service
public class QnABoardServiceImpl implements QnABoardService {
//DB를 조회하는 객체를 직접만들지 않고, Bean으로 주입을 받는다.
	@Autowired
	private QnABoardMapper mapper;

	@Override
	public int getBoardCount() {

// 인터페이스의 구현체는 자동으로 주입받기때문에 인터페이스의 추상메서드를 호출해주면 쿼리문 수행결과를 return받을 수 있다.
		return mapper.selectBoardCount();
	}

	@Override
	public List<Reply> getBoardList(PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);

		return mapper.selectAll(rowBounds);
	}

	@Override
	public QnABoard findBoardByNo(int no) {
		
		return  mapper.selectBoardByNo(no);
		
		
		/*
		 * QnABoard board = mapper.selectBoardByNo(no);
		 * 
		 * Reply reply = null;
		 * 
		 * for (int i = 0; i < board.getReplies().size(); i++) {
		 * 
		 * reply = mapper.selectReplyByNo(board.getReplies().get(i).getNo());
		 * 
		 * board.getReplies().get(i).setWriterId(reply.getWriterId()); }
		 * 
		 * return board;
		 */
	}

	@Override
	public Reply findReplyByNo(int no) {

		return mapper.selectReplyByNo(no);
	}

	@Override
	@Transactional // 트랜잭션이 붙은 메서드는 메서드가 포함하고 있는 작업 중에 하나라도 실패할 경우 전체 작업을 취소한다.
	public int save(QnABoard board) {
		int result = 0;

		if (board.getNo() > 0) {
			// update작업을 한다.
			result = mapper.updateBoard(board);
		} else {
			// insert 작업을 한다.
			result = mapper.insertBoard(board);
		}
		return result;
	}

	@Override
	@Transactional // 커밋, 롤백처리를 위해 @Transactional어노테이션을 지정한다.
	public int delete(int no) {

		return mapper.updateStatus(no, "N");
	}
	
	@Override
	@Transactional // 커밋, 롤백처리를 위해 @Transactional어노테이션을 지정한다.
	public int deleteReply(int no) {

		return mapper.updateReplyStatus(no, "N");
	}

	@Override
	public int updateReadCount(QnABoard board) {

		return mapper.updateReadCount(board);
	}

	@Override
	@Transactional
	public int save(Reply reply) {
		int result = 0;

		if (reply.getNo() > 0) {
			// update작업을 한다.
			result = mapper.updateReply(reply);
		} else {
			// insert 작업을 한다.
			result = mapper.insertReply(reply);
		}
		return result;
	}

}