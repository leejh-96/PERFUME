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
	int pbcno;
	int pno;
	String pbcontent;
	Date pbdate;
	Date pbupdate;
	String pbstatus;
	int pbgrade;
	String pbpwd;
	String pbtitle;
	
}
