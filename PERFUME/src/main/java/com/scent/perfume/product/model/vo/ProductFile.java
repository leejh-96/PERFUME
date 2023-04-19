package com.scent.perfume.product.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductFile {
	int pfno;
	int pno;
	String pforiginalfilename;
	String pfrenamefilename;
	int pfsize;
	String pftype;
	Date pfdate;
	Date pfupdate;
	String pfstatus;
	int pfsort;
}
