package com.scent.perfume.board.model.service;

import java.util.List;

import com.scent.perfume.board.model.vo.Notice;
import com.scent.perfume.common.util.PageInfo;

public interface BoardService {

	int getBoardCount();

	List<Notice> getBoardList(PageInfo pageInfo, String string);

	Notice findBoardByNo(int no);

	int save(Notice notice);

	int delete(int no);

	int updateReadCount(Notice notice);

}
