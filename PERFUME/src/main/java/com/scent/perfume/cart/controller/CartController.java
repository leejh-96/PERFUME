package com.scent.perfume.cart.controller;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.scent.perfume.cart.model.service.CartService;
import com.scent.perfume.cart.model.vo.Cart;
import com.scent.perfume.cart.model.vo.CartList;
import com.scent.perfume.cart.model.vo.CartProduct;
import com.scent.perfume.cart.model.vo.CartMember;
import com.scent.perfume.cart.model.vo.Order;
import com.scent.perfume.cart.model.vo.OrderList;
import com.scent.perfume.cart.model.vo.productOption;
import com.scent.perfume.planning.model.vo.Member;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class CartController {

	@Autowired
	private CartService cartService;
	
	@RequestMapping("/cartTest")
	public String test() {//테스트용
		
		return "cart/test";
	}
	
	@RequestMapping("/header")
	public String header() {//테스트용
		
		return "cart/headertest";
	}
	
	@RequestMapping("/cart")
	public String cartAll(@ModelAttribute("loginMember") Member member,
						  Model model) {
	
		CartMember memberInfo = null;
		List<Cart> clist = null;
		
		//로그인체크로직작성
		if (member != null) {
			//회원의 장바구니 상품과 혜택정보를 불러온다.	
			clist = cartService.selectCartInfo(member.getNo());
			
			//회원의 혜택정보를 불러온다.
			memberInfo = cartService.selectCartMemberInfo(member.getNo());
			
			log.info("clist : {}",clist);
			
			model.addAttribute("memberInfo", memberInfo);
			model.addAttribute("clist", clist);
		}
		return "cart/cart";
	}
	
	@ResponseBody
	@PostMapping("cart/couponUpdate")
	public int couponUpdate(@RequestParam("memberNo") int memberNo,
							@RequestParam("benefitNo") int benefitNo) {
		
		int result = cartService.couponUpdate(memberNo,benefitNo);
		
		return result;
		
	}
	@ResponseBody
	@PostMapping("cart/couponReset")
	public int couponReset(@RequestParam("memberNo") int memberNo,
						   @RequestParam("benefitNo") int benefitNo) {
		
		int result = cartService.couponReset(memberNo,benefitNo);
		
		return result;
		
	}
	@ResponseBody
	@PostMapping("cart/cartDelete")
	public int cartDelete(@RequestParam("memberNo")int memberNo,
						  @RequestParam("cartNo") int cartNo){
		
		System.out.println("memberNo : "+memberNo+", "+"carNo : "+cartNo);
		
		int result = cartService.cartDelete(memberNo,cartNo);
		
		if (result > 0) {
			log.info("성공");
			return result;
		}else {
			log.info("실패");
			return result;
		}
	}

	@ResponseBody
	@RequestMapping(value="cart/orderDetail", method=RequestMethod.POST, produces="application/json;")
	public Order orderDetail(@RequestBody Order order) {
		
	    String orderNo = order.getOrderNo(); 
		
		int result = cartService.orderInsert(order);
		
		order.setOrderNo(orderNo);
		
		System.out.println(order);
		
		if (result > 0) {
			log.info("성공");
		}else {
			log.info("실패");
		}
		return order;
	}
	
	@ResponseBody
	@RequestMapping(value="cart/order", method=RequestMethod.POST, produces="application/json;")
	public int order(@RequestBody OrderList orderList) {
		
		System.out.println("orderList : "+orderList);
		
		int result = cartService.orderListInsert(orderList);
		
		if (result > 0) {
			return result;
		}else {
			return result;
		}
	}
	
	@ResponseBody
	@PostMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(  Model model
													, Locale locale
													, HttpSession session
													, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{	
		
			IamportClient iamport = new IamportClient("1800245033135003","tgBOxjYHrfyYGoGlA8oAOVutDILLtedqsru69Vzmzvcfu9oEyHOqhFpuIkkX4s0Hx68Ryy44QepSvK2O");
			
			return iamport.paymentByImpUid(imp_uid);
	}
	
	@RequestMapping("/cart/orderList/{orderNo}/{memberNo}/{plusPoint}")
	public String orderList(@PathVariable("orderNo") String orderNo,
							@PathVariable("memberNo") int memberNo,
							@PathVariable("plusPoint") int plusPoint,
							Model model) {
		Order order = null;
		
		order = cartService.orderList(orderNo);
		
		model.addAttribute("order", order);
		model.addAttribute("plusPoint", plusPoint);
		
		return "cart/orderList";
	}
	
	@ResponseBody
	@RequestMapping("/order/pointUpdate/{point}/{memberNo}")
	public int pointUpdate(@PathVariable("point") int point,
						   @PathVariable("memberNo") int memberNo) {
		
		return cartService.memberPointUpdate(point,memberNo);
	}
	
	@ResponseBody
	@RequestMapping("/order/plusPoint/{plusPoint}/{memberNo}")
	public int plusPoint(@PathVariable("plusPoint") int plusPoint,
						 @PathVariable("memberNo") int memberNo) {
		
		log.info("plusPoint : {}",plusPoint);
		log.info("memberNo : {}",memberNo);
		
		return cartService.memberPlusPoint(plusPoint,memberNo);
	}
	
	@GetMapping("/cart/nowOrder/{productNo}/{poName}/{poAmount}")
	public String nowOrder(HttpServletRequest request,
						   @ModelAttribute productOption option,
						   Model model) {
		
		CartMember memberInfo = null;
		productOption directInfo = null;
		//로그인 정보 가져오기
		HttpSession member = request.getSession();
		Member loginMember = (Member)member.getAttribute("loginMember");
		
		if (loginMember != null) {
			//회원일 경우
			memberInfo = cartService.selectCartMemberInfo(loginMember.getNo());
			
			if (memberInfo.getMemberNo()==loginMember.getNo()) {
				//로그인정보와 회원정보 검증 성공시
				directInfo = cartService.selectNowOrder(option);
				
				if (directInfo != null) {
					log.info("option : {}",option);
					log.info("memberInfo : {}",memberInfo);
					log.info("directInfo : {}",directInfo);
					model.addAttribute("option", option);
					model.addAttribute("memberInfo", memberInfo);
					model.addAttribute("directInfo", directInfo);
					return "cart/orderPage";
				}else {
					model.addAttribute("msg", "잘못된 접근입니다.");
					model.addAttribute("location", "/product/detail?no="+option.getProductNo());
				}
			}else {
				//로그인정보와 회원정보 검증 실패시
				model.addAttribute("msg", "잘못된 접근입니다.");
				model.addAttribute("location", "/product/detail?no="+option.getProductNo());
			}
		}else if (loginMember == null) {
			//비회원일 경우
			directInfo = cartService.selectNowOrder(option);
			if (directInfo != null) {
				log.info("option : {}",option);
				log.info("memberInfo : {}",memberInfo);
				log.info("directInfo : {}",directInfo);
				model.addAttribute("option", option);
				model.addAttribute("memberInfo", memberInfo);
				model.addAttribute("directInfo", directInfo);
				return "cart/orderPage";
			}else {
				model.addAttribute("msg", "잘못된 접근입니다.");
				model.addAttribute("location", "/product/detail?no="+option.getProductNo());
			}
		}
		return "common/msg";
	}
	
	@ResponseBody
	@GetMapping("/cart/insert")
	public int insert(HttpServletRequest request,
					  @ModelAttribute Cart cart) {
		
		int result = 0;
		
		HttpSession member = request.getSession();
		
		Member loginMember = (Member)member.getAttribute("loginMember");
		
		log.info("cart : {}",cart);
		log.info("loginMember : {}",loginMember);
		
		if (loginMember != null) {
			
			result = cartService.insert(loginMember.getNo(),cart);
			
		}
		return result;
	}
	
	
	
	
	
}
