package com.scent.perfume.mypage.controller;

import java.net.URLDecoder;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.scent.perfume.mypage.model.service.MyPageMemberService;
import com.scent.perfume.mypage.model.service.MyPageService;
import com.scent.perfume.mypage.model.vo.CouponDTO;
import com.scent.perfume.mypage.model.vo.DeliveryAddressDTO;
import com.scent.perfume.mypage.model.vo.MemberDTO;
import com.scent.perfume.mypage.model.vo.OrderDetailDTO;
import com.scent.perfume.mypage.model.vo.ProductDTO;
import com.scent.perfume.mypage.model.vo.UpdateMemberDTO;
import com.scent.perfume.planning.model.service.MemberService;
import com.scent.perfume.planning.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
@SessionAttributes("loginMember")
public class MyPageController {
	private int contentPerPage=10; // 한 페이지에 보여지는 게시물의 개수
	
	private int productPerPage=8; // 한 페이지에 보여지는 최근 본 상품의 개수
	
	private int receiptPerPage=5; // 한 페이지에 보여지는 주문내역의 개수
	
	private int blockPerPage=5; // 한 페이지에 보여지는 페이지 블록의 개수
	
	@Autowired
	private MyPageService service;
	
//	@Autowired
//	private MemberService memberService;
	
//	@Autowired 리뷰 미구현 ;
//	private ReviewService reviewService;
	
	@RequestMapping("/mypage")
	public String mypage(@ModelAttribute("loginMember") Member member,
						  Model model) {
		if(member != null) { 
			MemberDTO memberDto =service.getMember(member.getNo());
			model.addAttribute("memberDto", memberDto);
		} else {
			model.addAttribute("msg", "잘못된 접근입니다");
			model.addAttribute("location", "/");
			return "common/msg";
		}
			return "mypage/mypage";
	}
	
	 @GetMapping("/confirmPassword/changeInfo")
	    public String changeInfoPage() {
	        return "mypage/changeInfo";
	    }
	 
//	 @GetMapping("/pointHistory/all")
//	    public String getAllPointHistory() {
//	        return "mypage/point-history-all";
//	    }
	 
	 @GetMapping("/confirmPassword/changePassword")
	    public String changePasswordPage() {
	        return "mypage/changePassword";
	    }
	 
	 @GetMapping("/myReview")
	    public String myReviewPage() {
	        return "mypage/myReview";
	    }
	 
//	 @GetMapping("/myReview")
//	    public String getMyReview {
//	        return "mypage/myReview";
//	    }
	
	
//	@GetMapping("/confirmPassword/changeInfo")
//    public String changeInfo(HttpSession session, Model model) {
//        MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
//        
//        if (memberDTO == null) {
//            return "redirect:/member/login";
//        }
//        
//        model.addAttribute("memberDTO", memberDTO);
//        return "mypage/confirmPassword";
//    }
//    
//    @GetMapping("/changeInfo")
//    public String changeInfo(HttpSession session, Model model, String password) {
//        MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
//        
//        if (memberDTO == null) {
//            return "redirect:/member/login";
//        }
//        
//        if (MyPageService.confirmPassword(memberDTO.getMemberId(), password)) {
//            model.addAttribute("memberDTO", memberDTO);
//            return "mypage/changeInfo";
//        } else {
//            model.addAttribute("errorMsg", "비밀번호가 일치하지 않습니다.");
//            return "mypage/confirmPassword";
//        }
//    }
	
    
    
	@RequestMapping(value="/mypage/confirmPassword/", method=RequestMethod.GET)
	public String getConfirmForm(@ModelAttribute("loginMember") Member member, Principal principal, Model model) throws Exception {
		try {
			MemberDTO memberDTO = MyPageMemberService.getMemberId(principal.getName());
			model.addAttribute("memberDTO", memberDTO);
			
//			List<CategoryDTO> parentCategory = categoryService.showCategoryMenu();
//			model.addAttribute("parentCategory", parentCategory);
			
			long memberPoint = service.getMemberPoint(memberDTO.getMemberId());
			model.addAttribute("memberPoint", memberPoint);
			
			long couponCount = service.getCouponCount(memberDTO.getMemberId(), "available");
			model.addAttribute("couponCount", couponCount);
			
//			// 작성 가능한 상품평 개수 불러오기
//			List<ProductDTO> writeableList = reviewService.getWriteableReview(memberDTO.getId());
//			model.addAttribute("writeableList", writeableList);
//			model.addAttribute("writeableCount", writeableList.size());
			
			model.addAttribute("member", member);
		} catch(Exception e) {
			log.info(e.getMessage());
		}
		return "mypage/confirmPassword";
	}
	
	@RequestMapping(value="/confirmPassword/}", method=RequestMethod.POST)
	public String confirmPassword(@PathVariable("type") String type,
		@RequestParam("userPassword") String userPassword, Principal principal, Model model) throws Exception {
		try {
			MemberDTO memberDTO = MyPageMemberService.getMemberId(principal.getName());
			String phoneNum = memberDTO.getPhone().substring(0, 3) + "-"
				+ memberDTO.getPhone().substring(3, 7) + "-" + memberDTO.getPhone().substring(7);
			
//			List<CategoryDTO> parentCategory = categoryService.showCategoryMenu();
//			model.addAttribute("parentCategory", parentCategory);
			
			long memberPoint = service.getMemberPoint(memberDTO.getMemberId());
			model.addAttribute("memberPoint", memberPoint);
			
			long couponCount = service.getCouponCount(memberDTO.getMemberId(), "available");
			model.addAttribute("couponCount", couponCount);
			
//			// 작성 가능한 상품평 개수 불러오기
//			List<ProductDTO> writeableList = reviewService.getWriteableReview(memberDTO.getMemberId());
//			model.addAttribute("writeableList", writeableList);
//			model.addAttribute("writeableCount", writeableList.size());
			
			if(service.confirmPassword(userPassword, memberDTO.getPassword())) {
				if(type.equals("changeInfo")) {
					String[] birthdate = memberDTO.getBirthDate().split("-");
					model.addAttribute("birthYear", birthdate[0]);
					model.addAttribute("birthMonth", birthdate[1]);
					model.addAttribute("birthDay", birthdate[2]);
					model.addAttribute("phoneNum", phoneNum);
				}
				model.addAttribute("memberDTO", memberDTO);
				return "mypage/"+type;
			}
			return "redirect:/mypage/confirmPassword/"+type;
		} catch(Exception e) {
			log.info(e.getMessage());
			return "redirect:/mypage/confirmPassword"+type;
		}
	}
	
	// 196~211 주석처리
//	@ResponseBody
//	@RequestMapping(value="/changePassword", method=RequestMethod.POST)
//	public String changePassword(@RequestParam("curPassword") String curPassword,
//		@RequestParam("newPassword") String newPassword, Principal principal, Model model) throws Exception {
//		try {
//			MemberDTO memberDTO = MyPageMemberService.getMemberId(principal.getName());
//			if(service.changePassword(curPassword, newPassword, memberDTO)) {
//				model.addAttribute("memberDTO", memberDTO);
//				return "1";
//			}
//			return "2";
//		} catch(Exception e) {
//			log.info(e.getMessage());
//			return "3";
//		}
//	}
	
	@ResponseBody
	@RequestMapping(value="/changeInfo", method=RequestMethod.POST)
	public String changeInfo(@ModelAttribute UpdateMemberDTO updateDTO, BindingResult result, Principal principal, Model model) throws Exception {
		try {
			MemberDTO memberDTO = MyPageMemberService.getMemberId(principal.getName());
			if(service.changeInfo(updateDTO, memberDTO)) {
				model.addAttribute("memberDTO", memberDTO);
				return "1";
			}
			return "2";
		} catch(Exception e) {
			log.info(e.getMessage());
			return "3";
		}
	}    
	
	@RequestMapping(value="/confirmPassword")
	public String confirmPassword() {
		return "mypage/confirmPassword";
	}
	
	
//		1차 컷.	
	
	
	
	public List<ProductDTO> setSeenProducts(long page, long productCount, HttpServletRequest request) throws NumberFormatException, Exception {
		List<ProductDTO> productList = new ArrayList<>();
		
		long startNum = (page-1) * productPerPage;
		long endNum = page * productPerPage - 1;
		if(endNum >= productCount) endNum = productCount - 1; // endNum이 productCount 보다 커지는 것을 방지
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
					// 이름이 'seenProducts'인 쿠키를 찾으면
				if(cookie.getName().equals("seenProducts")) {
					// 쿠키에 저장된 상품ID 값을 쉼표로 구분해서 배열 형식으로 저장
					String[] productIdArr = (URLDecoder.decode(cookie.getValue(), "utf-8")).split(",");
					// 상품ID들을 통해서 가져온 ProductInfo들을 productList에 각각 저장
					for(int i=(int)startNum; i<=endNum; i++) {
//						product mapper, service, impl 병합 필요 ..
//						productList.add(0,productService.getProductInfo(Long.parseLong(productIdArr[i])));
					}
				}
			}
		}
		return productList;
	}
	
// ---------살릴수도-------	
//	@RequestMapping(value="", method=RequestMethod.GET)
//	public String getMyPageMain(@RequestParam(value="page", defaultValue="1") long page,
//	        HttpServletRequest request, Principal principal, Model model) throws Exception {
//	    try {
//	        MemberDTO memberDTO = memberService.getMember(principal.getName());
//	        model.addAttribute("memberDTO", memberDTO);
//
////	      List<CategoryDTO> parentCategory = CategoryService.showCategoryMenu();
////	      model.addAttribute("parentCategory", parentCategory);
//
//	        long memberPoint = service.getMemberPoint(memberDTO.getMemberId());
//	        model.addAttribute("memberPoint", memberPoint);
//
//	        long couponCount = service.getCouponCount(memberDTO.getMemberId(), "available");
//	        model.addAttribute("couponCount", couponCount);
//	    } finally {
//	    }
//	}

//			리뷰 미구현?
//			// 작성 가능한 상품평 개수 불러오기
//			List<ProductDTO> writeableList = reviewService.getWriteableReview(memberDTO.getId());
//			model.addAttribute("writeableList", writeableList);
//			model.addAttribute("writeableCount", writeableList.size());
			
//			// 최근 본 상품의 개수
//			long productCount = getSeenProductCount(request);
//			// 전체 페이지 개수 = 최근 본 상품의 개수 / 한 페이지에 보여지는 최근 본 상품의 개수
//			long pageCount = productCount / productPerPage;
//			// 예를 들어, 최근 본 상품의 개수가 101개인 경우, 11개의 페이지가 필요하므로 총 페이지의 개수를 증가시켜준다.
//			if(productCount % productPerPage != 0) pageCount++;
//			
//			// 시작 페이지 = (현재 페이지-1) / 페이지 블록 크기 * 페이지 블록 크기 + 1
//			long startPage = (page-1) / blockPerPage * blockPerPage + 1;
//			// 마지막 페이지 (현재 페이지-1) / 페이지 블록 크기 * 페이지 블록 크기 + 페이지 블록 크기
//			long endPage = (page-1) / blockPerPage * blockPerPage + blockPerPage;
//			// 마지막 페이지 개수가 전체 페이지 개수보다 많은 경우, 마지막 페이지를 전체 페이지 개수로 맞춰준다.
//			if(endPage > pageCount) endPage = pageCount;
//			
//			List<ProductDTO> productList = setSeenProducts(page, productCount, request);
//			
//			model.addAttribute("productList", productList);
//			model.addAttribute("page", page);
//			model.addAttribute("startPage", startPage);
//			model.addAttribute("endPage", endPage);
//			model.addAttribute("pageCount", pageCount);
//			model.addAttribute("productCount", productCount);
//		} catch(Exception e) {
//			log.info(e.getMessage());
//		}
//		return "mypage/main";
//	}
	
	@RequestMapping(value="/orderHistory", method=RequestMethod.GET)
	public String getOrderHistory(@RequestParam(value="page", defaultValue="1") long page,
		Principal principal, Model model) throws Exception {
		try {
			MemberDTO memberDTO = service.getMember(principal.getName());
			model.addAttribute("memberDTO", memberDTO);
			
//			List<CategoryDTO> parentCategory = categoryService.showCategoryMenu();
//			model.addAttribute("parentCategory", parentCategory);
			
			long memberPoint = service.getMemberPoint(memberDTO.getMemberId());
			model.addAttribute("memberPoint", memberPoint);
			
			long couponCount = service.getCouponCount(memberDTO.getMemberId(), "available");
			model.addAttribute("couponCount", couponCount);
			
//			// 작성 가능한 상품평 개수 불러오기
//			List<ProductDTO> writeableList = reviewService.getWriteableReview(memberDTO.getMemberId());
//			model.addAttribute("writeableList", writeableList);
//			model.addAttribute("writeableCount", writeableList.size());
			
			// 주문 내역의 개수
			long historyCount = service.getReceiptCount(memberDTO.getMemberId());
			// 전체 페이지 개수 = 포인트 내역의 개수 / 한 페이지에 보여지는 내역의 수
			long pageCount = historyCount / receiptPerPage;
			// 예를 들어, 내역이 101개인 경우, 11개의 페이지가 필요하므로 총 페이지 개수를 증가시켜준다.
			if(historyCount % receiptPerPage != 0) pageCount++;
			
			// 시작 페이지 = (현재 페이지-1) / 페이지 블록 크기 * 페이지 블록 크기 + 1
			long startPage = (page-1) / blockPerPage * blockPerPage + 1;
			// 마지막 페이지 (현재 페이지-1) / 페이지 블록 크기 * 페이지 블록 크기 + 페이지 블록 크기
			long endPage = (page-1) / blockPerPage * blockPerPage + blockPerPage;
			// 마지막 페이지 개수가 전체 페이지 개수보다 많은 경우, 마지막 페이지를 전체 페이지 개수로 맞춰준다.
			if(endPage > pageCount) endPage = pageCount;
			
			List<OrderDetailDTO> receiptHistory = service.getReceiptHistory(memberDTO.getMemberId(), page); // 회원ID로 결제정보DTO를 모두 불러오기
			model.addAttribute("receiptHistory", receiptHistory);
			for(OrderDetailDTO dto : receiptHistory) {
				log.info(dto.toString());
			}
			
			model.addAttribute("page", page);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
		} catch(Exception e) {
			log.info(e.getMessage());
		}
		return "mypage/orderHistory";
	}
	
	@RequestMapping(value="/orderHistory/{receiptId}", method=RequestMethod.GET)
	public String getOrderDetail(@PathVariable("receiptId") long receiptId, Principal principal, Model model) throws Exception {
		try {
			MemberDTO memberDTO = service.getMember(principal.getName());
			model.addAttribute("memberDTO", memberDTO);
			
//			List<CategoryDTO> parentCategory = categoryService.showCategoryMenu();
//			model.addAttribute("parentCategory", parentCategory);
			
			long memberPoint = service.getMemberPoint(memberDTO.getMemberId());
			model.addAttribute("memberPoint", memberPoint);
			
			long couponCount = service.getCouponCount(memberDTO.getMemberId(), "available");
			model.addAttribute("couponCount", couponCount);
			
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		return "mypage/orderDetail";
	}
	
	

	@ResponseBody
	@RequestMapping(value="/orderHistory/updateOrderStatus", method=RequestMethod.POST)
	public String updateOrderStatus(@RequestParam("orderId") long orderId, @RequestParam("status") String status) throws Exception {
		try {
			service.updateOrderStatus(orderId, status);
		} catch (Exception e) {
			log.info(e.getMessage());
			return "2";
		}
		return "1";
	}
	
	@ResponseBody
	@RequestMapping(value="/orderHistory/updateAllOrderStatus", method=RequestMethod.POST)
	public String updateAllOrderStatus(@RequestParam("receiptId") long receiptId, @RequestParam("status") String status) throws Exception {
		try {
			service.updateAllOrderStatus(receiptId, status);
		} catch (Exception e) {
			log.info(e.getMessage());
			return "2";
		}
		return "1";
	}
//			// 작성 가능한 상품평 개수 불러오기
//			List<ProductDTO> writeableList = reviewService.getWriteableReview(memberDTO.getId());
//			model.addAttribute("writeableList", writeableList);
//			model.addAttribute("writeableCount", writeableList.size());
			
//			MemberDTO member = new MemberDTO();
//	
//			// 포인트 내역의 개수
//			long historyCount = service.getPointHistoryCount(member.getMemberId(), type, startDate, endDate);
//			// 전체 페이지 개수 = 포인트 내역의 개수 / 한 페이지에 보여지는 내역의 수
//			long pageCount = historyCount / contentPerPage;
//			// 예를 들어, 내역이 101개인 경우, 11개의 페이지가 필요하므로 총 페이지 개수를 증가시켜준다.
//			if(historyCount % contentPerPage != 0) pageCount++;
//			
//			// 시작 페이지 = (현재 페이지-1) / 페이지 블록 크기 * 페이지 블록 크기 + 1
//			long startPage = (page-1) / blockPerPage * blockPerPage + 1;
//			// 마지막 페이지 (현재 페이지-1) / 페이지 블록 크기 * 페이지 블록 크기 + 페이지 블록 크기
//			long endPage = (page-1) / blockPerPage * blockPerPage + blockPerPage;
//			// 마지막 페이지 개수가 전체 페이지 개수보다 많은 경우, 마지막 페이지를 전체 페이지 개수로 맞춰준다.
//			if(endPage > pageCount) endPage = pageCount;
//			
//			List<PointDTO> pointHistory = service.getPointHistory(memberDTO.getId(), type, page, startDate, endDate);
//			model.addAttribute("pointHistory", pointHistory);
//			model.addAttribute("type", type);
//			model.addAttribute("page", page);
//			model.addAttribute("startDate", startDate);
//			model.addAttribute("endDate", endDate);
//			model.addAttribute("startPage", startPage);
//			model.addAttribute("endPage", endPage);
//			model.addAttribute("pageCount", pageCount);
//		} catch (Exception e) {
//			log.info(e.getMessage());
//		}
//		return "mypage/pointHistory";
//	}
//}	
	@RequestMapping(value="/couponHistory/{type}", method=RequestMethod.GET)
	public String getCouponHistory(@RequestParam(value="page", defaultValue="1") long page,
		@PathVariable("type") String type, Principal principal, Model model) throws Exception {
		try {
			MemberDTO memberDTO = service.getMember(principal.getName());
			model.addAttribute("memberDTO", memberDTO);
			
//			List<CategoryDTO> parentCategory = categoryService.showCategoryMenu();
//			model.addAttribute("parentCategory", parentCategory);
			
			long memberPoint = service.getMemberPoint(memberDTO.getMemberId());
			model.addAttribute("memberPoint", memberPoint);
			
			long couponCount = service.getCouponCount(memberDTO.getMemberId(), "available");
			model.addAttribute("couponCount", couponCount);
			
			// 쿠폰의 개수
			long historyCount = service.getCouponCount(memberDTO.getMemberId(), type);
			// 전체 페이지 개수 = 쿠폰의 개수 / 한 페이지에 보여지는 쿠폰의 개수
			long pageCount = historyCount / contentPerPage;
			// 예를 들어, 내역이 101개인 경우, 11개의 페이지가 필요하므로 총 페이지 개수를 증가시켜준다.
			if(historyCount % contentPerPage != 0) pageCount++;
			
			// 시작 페이지 = (현재 페이지-1) / 페이지 블록 크기 * 페이지 블록 크기 + 1
			long startPage = (page-1) / blockPerPage * blockPerPage + 1;
			// 마지막 페이지 (현재 페이지-1) / 페이지 블록 크기 * 페이지 블록 크기 + 페이지 블록 크기
			long endPage = (page-1) / blockPerPage * blockPerPage + blockPerPage;
			// 마지막 페이지 개수가 전체 페이지 개수보다 많은 경우, 마지막 페이지를 전체 페이지 개수로 맞춰준다.
			if(endPage > pageCount) endPage = pageCount;
			
			List<CouponDTO> couponList = service.getCouponHistory(memberDTO.getMemberId(), type, page);
			model.addAttribute("couponList", couponList);
			model.addAttribute("type", type);
			model.addAttribute("page", page);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
		} catch(Exception e) {
			log.info(e.getMessage());
		}
		return "mypage/couponHistory";
	}
	
	@RequestMapping(value="/manageAddress", method=RequestMethod.GET)
	public String getAddressList(Principal principal, Model model) throws Exception {
		try {
			MemberDTO memberDTO = service.getMember(principal.getName());
			model.addAttribute("memberDTO", memberDTO);
			
//			List<CategoryDTO> parentCategory = categoryService.showCategoryMenu();
//			model.addAttribute("parentCategory", parentCategory);
			
			long memberPoint = service.getMemberPoint(memberDTO.getMemberId());
			model.addAttribute("memberPoint", memberPoint);
			
			long couponCount = service.getCouponCount(memberDTO.getMemberId(), "available");
			model.addAttribute("couponCount", couponCount);
			
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		return "mypage/manageAddress";
	}
	
	@ResponseBody
	@RequestMapping(value="/manageAddress/addAddress", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String addAddress(@RequestBody DeliveryAddressDTO dto, Principal principal) throws Exception {
		try {
			MemberDTO memberDTO = service.getMember(principal.getName());
			dto.setMemberId(memberDTO.getMemberId());
			service.addAddress(dto);
		} catch(Exception e) {
			log.info(e.getMessage());
			return "2";
		}
		return "1";
	}
	
	@ResponseBody
	@RequestMapping(value="/manageAddress/updateAddress", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String updateAddress(@RequestBody DeliveryAddressDTO dto, Principal principal) throws Exception {
		try {
			MemberDTO memberDTO = service.getMember(principal.getName());
			dto.setMemberId(memberDTO.getMemberId());
			service.updateAddress(dto);
		} catch (Exception e) {
			return "2";
		}
		return "1";
	}
	
	@ResponseBody
	@RequestMapping(value="/manageAddress/deleteAddress", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String deleteAddress(@RequestBody List<Integer> list, Principal principal) throws Exception {
		try {
			MemberDTO memberDTO = service.getMember(principal.getName());
			for(long addressId : list) {
				service.deleteAddress(memberDTO.getMemberId(), addressId);
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			return "2";
		}
		return "1";
	}
	
	@ResponseBody
	@RequestMapping(value="/manageAddress/setDefault", method=RequestMethod.POST)
	public String setDefault(@RequestParam long addressId, Principal principal) throws Exception {
		try {
			MemberDTO memberDTO = service.getMember(principal.getName());
			service.setDefault(memberDTO.getMemberId(), addressId);
		} catch(Exception e) {
			log.info(e.getMessage());
			return "2";
		}
		return "1";
	}
	
	@ResponseBody
	@RequestMapping(value="/manageAddress/cancelDefault", method=RequestMethod.POST)
	public String cancelDefault(@RequestParam long addressId, Principal principal) throws Exception {
		try {
			MemberDTO memberDTO = service.getMember(principal.getName());
			service.cancelDefault(memberDTO.getMemberId());			
		} catch(Exception e) {
			log.info(e.getMessage());
			return "2";
		}
		return "1";
	}
	
	
	@RequestMapping(value="/resignMember", method=RequestMethod.GET)
	public String getResignForm(Principal principal, Model model) throws Exception {
		try {
			MemberDTO memberDTO = service.getMember(principal.getName());
			model.addAttribute("memberDTO", memberDTO);
			
//			List<CategoryDTO> parentCategory = CategoryService.showCategoryMenu();
//			model.addAttribute("parentCategory", parentCategory);
			
			long memberPoint = service.getMemberPoint(memberDTO.getMemberId());
			model.addAttribute("memberPoint", memberPoint);
			
			long couponCount = service.getCouponCount(memberDTO.getMemberId(), "available");
			model.addAttribute("couponCount", couponCount);
			
		} catch(Exception e) { 
			e.printStackTrace();
		} 
			return "mypage/resignMember";
	}		
}