package com.scent.perfume.product.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {

	int pno;
	
	int PMno;
	
	String brand;
	
	String title;
	
	String name;
	
	String eng;
	
	String detail;
	
	String status;
	
	String gender;
	
	int price;
	
	
	List<Option> option;
	
	MidCate midcate;
	
	TopCate topcate;
	
	List<ProductBenefit> productbenefit;
	
	List<PBenefit> benefit;
	
	Date date;
	
	Date update;
	
	
	
	
	
}
