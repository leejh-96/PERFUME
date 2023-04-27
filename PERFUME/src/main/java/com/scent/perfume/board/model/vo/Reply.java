package com.scent.perfume.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
	private int No;
	
	private int BoardNo;
	
	private int WriterNo;
	
	private String WriterId;
	
	private String Status;
	
	private String Content;	
	
	private Date CreateDate;
	
	private Date ModifyDate;
}
