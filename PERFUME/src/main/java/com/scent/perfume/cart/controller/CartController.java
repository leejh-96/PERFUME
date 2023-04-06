package com.scent.perfume.cart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scent.perfume.cart.model.service.CartService;
import com.scent.perfume.cart.model.vo.Cart;
import com.scent.perfume.cart.model.vo.CartProduct;
import com.scent.perfume.cart.model.vo.Member;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	@RequestMapping("/")
	public String test() {
		
		return "test";
	}
	
	@RequestMapping("/cart")
	public String cartAll(@RequestParam("mNo") int mNo,
											Model model) {
	
		Member memberInfo = null;
		List<Cart> clist = null;
		
		//로그인체크로직작성
		
		//회원의 장바구니 상품과 혜택정보를 불러온다.	
		clist = cartService.selectCartInfo(mNo);
		
		//검증로직작성
		
		//회원의 혜택정보를 불러온다.
		memberInfo = cartService.selectCartMemberInfo(mNo);
		
		//검증로직작성
		
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("clist", clist);
		
		return "cart/cart";
	}
	
	@GetMapping("/amountUpdate")
	public @ResponseBody int amountUpdate(@RequestParam("cartNo") int cartNo,@RequestParam("result") int cartProductCount) {
		
		
		  System.out.println(cartNo);
		  System.out.println(cartProductCount);
		 
		
		int result = 0;
		
		result = cartService.amountUpdate(cartNo,cartProductCount);
	
		if (result > 0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		return result;
	
	};
	
	
	
	
	
	
	
}
