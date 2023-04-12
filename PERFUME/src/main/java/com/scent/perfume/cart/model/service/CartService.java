package com.scent.perfume.cart.model.service;

import java.util.List;

import com.scent.perfume.cart.model.vo.Cart;
import com.scent.perfume.cart.model.vo.CartProduct;
import com.scent.perfume.cart.model.vo.CartMember;
import com.scent.perfume.cart.model.vo.Order;
import com.scent.perfume.cart.model.vo.OrderList;

public interface CartService {

	List<Cart> selectCartInfo(int memberNo);

	CartMember selectCartMemberInfo(int memberNo);

	/* int amountUpdate(int cartNo, int cartProductCount); */

	int couponUpdate(int memberNo, int benefitNo);

	int couponReset(int memberNo, int benefitNo);

	int cartDelete(int memberNo, int cartNo);

	int orderInsert(Order order);

	int orderListInsert(OrderList orderList);

	/* String selectOrderPrimaryKey(String orderNo); */

	int memberPointUpdate(int point, int memberNo); 

	Order orderList(String orderNo);

	int memberPlusPoint(int plusPoint, int memberNo);

	/* CartProduct selectCartProductInfo(int cartNo, int productNo); */

}
