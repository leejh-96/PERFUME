package com.scent.perfume.board.model.service;

import java.util.List;

import com.scent.perfume.board.model.vo.Board;
import com.scent.perfume.common.util.PageInfo;

public interface BoardService {

	int getBoardCount();

	List<Board> getBoardList(PageInfo pageInfo);

	Board findBoardByNo(int no);

	int save(Board board);

	int delete(int no);

	int updateReadCount(Board board);

}
