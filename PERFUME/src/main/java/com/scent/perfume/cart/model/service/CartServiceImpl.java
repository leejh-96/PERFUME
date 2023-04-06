package com.scent.perfume.cart.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scent.perfume.cart.model.mapper.CartMapper;
import com.scent.perfume.cart.model.vo.Benefit;
import com.scent.perfume.cart.model.vo.Cart;
import com.scent.perfume.cart.model.vo.CartProduct;
import com.scent.perfume.cart.model.vo.Member;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartMapper cartMapper;

	@Override
	public Member selectCartMemberInfo(int mNo) {
		
		Member member = null;
		
		member = cartMapper.selectCartMemberInfo(mNo);
		
		return member;
	}

	@Override
	public List<Cart> selectCartInfo(int mNo) {
		
		List<Cart> clist = null;
		
		clist = cartMapper.selectCart(mNo);
		
		/* clist.get(0).getBList() */
		
		for(int i = 0; i<clist.size(); i++) {
			clist.get(i).setCartProduct(cartMapper.selectCartProductInfo(clist.get(i).getCartNo(),clist.get(i).getProductNo()));
			clist.get(i).setBenefitList(cartMapper.selectProductBenefit(clist.get(i).getProductNo()));;
		}
		return clist;
	}

	@Override
	@Transactional
	public int amountUpdate(int cartNo, int cartProductCount) {
		
		return cartMapper.amountUpdate(cartNo,cartProductCount);
	}

	/*
	 * @Override public CartProduct selectCartProductInfo(int cartNo, int productNo)
	 * {
	 * 
	 * return cartMapper.selectCartProductInfo(cartNo,productNo); }
	 */

}
