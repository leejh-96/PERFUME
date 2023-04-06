package com.scent.perfume.cart.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartProduct {

	private int pmNo;
	private int cartNo;
	private int productNo;
	private String productBrand;
	private String productTitle;
	private String productName;
	private String productEngName;
	private String productDetail;
	private int productOptionSize;
	private int productPrice;
	private int productAmount;
	private String productOfName;
	private String productRfName;
	private String productStatus;
	private String productGender;
	private Date productDate;
	private Date productUpdate;
	
	private List<ProductFile> pfList;
	private List<productOption> poList;
	private List<Benefit> benefitList;

}
