package com.scent.perfume.cart.model.service;

import java.util.List;

import com.scent.perfume.cart.model.vo.Cart;
import com.scent.perfume.cart.model.vo.CartProduct;
import com.scent.perfume.cart.model.vo.Member;

public interface CartService {

	List<Cart> selectCartInfo(int mNo);

	Member selectCartMemberInfo(int mNo);

	int amountUpdate(int cartNo, int cartProductCount);

	/* CartProduct selectCartProductInfo(int cartNo, int productNo); */

}
