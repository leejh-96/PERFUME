package com.scent.perfume.cart.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartList {

	private CartMember memberNo;
	private Cart cartNo;
	
}
