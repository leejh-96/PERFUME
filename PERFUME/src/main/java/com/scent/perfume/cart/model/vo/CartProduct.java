package com.scent.perfume.cart.model.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartProduct {

	private int ptNo;
	private int pmNo;
	private String topCategoryName;
	private String midCategoryName;
	private String renameFileName;
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
	
	
	private List<MultipartFile> pfUpFile;
	private List<AdminProductFile> pfList;
	private List<productOption> poList;
	private List<Benefit> benefitList;

}
