package com.scent.perfume.cart.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	
	private int rowNo;
	private int cartNo;
	private int productNo;
	private int memberNo;
	private int cartProductCount;
	private int cartOptionSize;
	private String cartStatus;
	private Date cartDate;
	private Date cartUpdateDate;
	private CartProduct cartProduct;
	private List<CartMember> memberList;
	private Benefit benefitList;

}
