package com.scent.perfume.product.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class PBenefit {
	int bnno;
	String bnname;
	String bntitle;
	String bncontent;
	Date bncreatedate;
	Date bnenddate;
	int bnratio;
	String bnstatus;
	int bnhit;
	
	
}
