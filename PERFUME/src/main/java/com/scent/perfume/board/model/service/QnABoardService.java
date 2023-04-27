package com.scent.perfume.board.model.service;

import java.util.List;

import com.scent.perfume.board.model.vo.Reply;
import com.scent.perfume.board.model.vo.QnABoard;
import com.scent.perfume.common.util.PageInfo;

public interface QnABoardService {

	int getBoardCount();

	List<Reply> getBoardList(PageInfo pageInfo);

	QnABoard findBoardByNo(int no);
	
	Reply findReplyByNo(int no);
	
	int save(QnABoard board);

	int delete(int no);

	int deleteReply(int no);
	
	int updateReadCount(QnABoard board);

	int save(Reply reply);

}
