package com.scent.perfume.product.model.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductBoardReply {
	int pbrNo;
	int pbNo;
	int MNo;
	String mid;
	String pbrContent;
	String pbrstatus;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date pbrdate;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date pbrupdate;
	
	String pbtitle;
}
