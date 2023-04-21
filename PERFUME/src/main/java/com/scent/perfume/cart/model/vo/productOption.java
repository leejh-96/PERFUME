package com.scent.perfume.cart.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class productOption {

	private int poNo;
	private int productNo;
	private int poName;
	private int poPrice;
	private int poAmount;
	
	private Benefit benefit;
	private CartProduct product;
	private List<Benefit> benefitList;
	private AdminProductFile file;

}
