package com.scent.perfume.product.model.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductBoard {
	int pbNo;
	int pbcNo;
	int PNo;
	int writerNo;
	String pbContent;
	
	String pEng;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date pbdate;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date pbupdate;
	
	String pbstatus;
	int pbGrade;
	String pbPwd;
	String pbTitle;
	String mid;
	int replycount;
	
	
	
}
