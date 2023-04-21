package com.scent.perfume.product.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductBoard {
	int pbno;
	int pbcNo;
	int PNo;
	int writerNo;
	String pbContent;
	Date pbdate;
	Date pbupdate;
	String pbstatus;
	int pbGrade;
	String pbPwd;
	String pbTitle;
	String mid;
	int replycount;
	
}
