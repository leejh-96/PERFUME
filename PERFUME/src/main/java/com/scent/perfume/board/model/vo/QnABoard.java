package com.scent.perfume.board.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QnABoard {
	private int No;
	
	private int RowNum;	
	
	private int WriterNo;
	
	private String WriterId;// 작성자 아이디
	
	private String Title;
	
	private String Content;
	
	private int ReadCount;
	
	private String Status;
	
	private String Type;
	
	private List<Reply> Replies;
	
	private Date CreateDate;
	
	private Date ModifyDate;
}