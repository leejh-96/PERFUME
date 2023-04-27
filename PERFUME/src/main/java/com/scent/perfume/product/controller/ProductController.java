package com.scent.perfume.product.controller;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.scent.perfume.common.Interceptor.LoginCheckInterceptor;
import com.scent.perfume.common.util.PageInfo;
import com.scent.perfume.planning.model.vo.Member;
import com.scent.perfume.product.model.service.ProductService;
import com.scent.perfume.product.model.vo.Option;
import com.scent.perfume.product.model.vo.Product;
import com.scent.perfume.product.model.vo.ProductBoard;
import com.scent.perfume.product.model.vo.ProductBoardCategory;
import com.scent.perfume.product.model.vo.ProductBoardReply;
import com.scent.perfume.product.model.vo.ProductLike;
import com.scent.perfume.product.model.vo.TopCate;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SessionAttributes("loginMember")
@Controller
//@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	
	// 전체 상품 페이지
	
	
	@GetMapping("/product/list")
	public ModelAndView list(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page
			, @RequestParam(required = false) String gender, @RequestParam(required = false) String bn
			, @RequestParam(required = false) String sort , @RequestParam(required = false) String keyword
			, @SessionAttribute(name = "loginMember", required= false) Member loginMember) {
		
		
		
		// PRODUCT 리스트
		int listCount = service.getProductCount(gender, bn, sort, keyword);
		
		
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 12);
		
		if(loginMember == null) {
		String MNo = null;
		
	     
		            List<Product> list = service.getProductList(pageInfo,gender,sort,bn, keyword, MNo);	
					modelAndView.addObject("list",list);

					
				
		
		} else if(loginMember != null) {
			String MNo = Integer.toString(loginMember.getNo());
			
			List<Product> list = service.getProductList(pageInfo,gender,sort,bn, keyword, MNo);
			
		
			modelAndView.addObject("list",list);
		}
		
		
		
		
		// BRAND 리스트
		List<Product> brand = service.getBrandList();
		
		// SCENT 리스트
				int listCount2 = service.getTopCateCount();
				List<TopCate> topcate = service.getTopCateList();
				
			
		
		// TOPCATEGORY modelAndView
		modelAndView.addObject("listCount2",listCount2);
		modelAndView.addObject("topcate",topcate);

		// BRAND modelAndView
		modelAndView.addObject("brand",brand);
		
		
		
		// PRODUCT modelAndView
		modelAndView.addObject("pageInfo", pageInfo);
		
		modelAndView.addObject("gender", gender);
		modelAndView.addObject("bn", bn);
		modelAndView.addObject("sort",sort);
		
	
		modelAndView.setViewName("product/list");
		
		
		return modelAndView;
		
	}
	
	// 상품 상세페이지 이동
	
	@GetMapping("/product/detail")
	public ModelAndView view(ModelAndView modelAndView, @RequestParam int no, @RequestParam(defaultValue = "1") int page
			) {
	   
		
		List<Product> list= service.findProductByNo(no);
		 
		
		Product LikeCount = service.getLikeCountByNo(no);
		
	
		
		List<Option> option = service.findProductOptionByNo(no);
		
		
		int listCount = service.getProductBoardCount(no);
		int qnalistCount = service.getProductQnaCount(no);
		
		
		List<ProductBoardCategory> boardcate = service.getBoardCategoryList();
		
	
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 5);
		PageInfo qnapageInfo = new PageInfo(page, 10, qnalistCount, 5);
		
		
		//관련 상품 구하기
		
		//1. 상품코드를 이용하여 단일 상품 조회
		   Product related = service.findByRelatedProductByNo(no);
		//2. 키워드를 사용해 관련상품에 뿌려줄 여러 상품 조회
		   List<Product> relatedProduct  = service.findRelatedProductByKeyword(related.getBrand(), no);            

		  
		   
		   
		List<ProductBoard> board = service.findProductBoardByNo(pageInfo, no);
		
		List<ProductBoard> qnaboard = service.findProductQnaByNo(qnapageInfo, no);
		
		List<ProductBoard> grade = service.findGradebyNo(no);
			
	
		modelAndView.addObject("boardcate", boardcate);
		modelAndView.addObject("grade", grade);
		modelAndView.addObject("list", list);
		modelAndView.addObject("no", no);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("qnapageInfo", qnapageInfo);
		modelAndView.addObject("board", board);
		modelAndView.addObject("qnaboard", qnaboard);
		modelAndView.addObject("option", option);
		modelAndView.addObject("LikeCount", LikeCount);
		modelAndView.addObject("relatedProduct", relatedProduct);
		modelAndView.setViewName("product/detail");
			
		return modelAndView;
			
		}	
		
	
	

	
	@GetMapping("product/scent")
	public ModelAndView scent(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page, @RequestParam int no,
			 @RequestParam(required = false) String gender, @RequestParam(required = false) String bn
			, @RequestParam(required = false) String sort , @RequestParam(required = false) String keyword,
			@SessionAttribute(name = "loginMember", required= false) Member loginMember) {
		
		
		int listCount = service.getScentProductCountByNo(no, gender, bn, keyword);
		TopCate scent =  service.findScentByNo(no);
		
		int listCount2 = service.getTopCateCount();
		List<TopCate> topcate = service.getTopCateList();
		
		List<Product> brand = service.getBrandList();
		
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 10);
		
		
		if(loginMember == null) {
			String MNo = null;
		
		     List<Product> list = service.getScentProductList(pageInfo, no, gender, bn, sort, keyword, MNo);
		     modelAndView.addObject("list", list);
		     
		} else if(loginMember != null) {
			String MNo = Integer.toString(loginMember.getNo());
			List<Product> list = service.getScentProductList(pageInfo, no, gender, bn, sort, keyword, MNo);
			modelAndView.addObject("list", list);
		}
		
		modelAndView.addObject("listCount2",listCount2);
		modelAndView.addObject("topcate",topcate);
		
		modelAndView.addObject("no", no);
		
		modelAndView.addObject("scent", scent);
		
		modelAndView.addObject("brand",brand);
		modelAndView.addObject("gender", gender);
		modelAndView.addObject("bn", bn);
		modelAndView.addObject("sort",sort);
		modelAndView.setViewName("product/scent");
		
		return modelAndView;
		
	}
	
	
	@GetMapping("product/paper")
	public ModelAndView modelAndView(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page,
			@RequestParam(required = false) String sort,
			@SessionAttribute(name = "loginMember", required= false) Member loginMember) {
		
	
		int listCount = service.getProductPaperCount();
		
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 12);
		
		
		if(loginMember == null) {
			String MNo = null;
			
			List<Product> list = service.getProductPaperList(pageInfo, sort, MNo);
			modelAndView.addObject("list", list);
		} else if(loginMember != null) {
			String MNo = Integer.toString(loginMember.getNo());
			
			List<Product> list = service.getProductPaperList(pageInfo, sort, MNo);
			modelAndView.addObject("list", list);
		}
	
		modelAndView.setViewName("product/paper");
		
		return modelAndView;
	}
	
	
	@GetMapping("product/salelist")
	public ModelAndView modelAndView(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page,
			@SessionAttribute(name = "loginMember", required= false) Member loginMember) {
		
		int listCount = service.getSaleProductCount();
		
		
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 12);
		
		
		
		if(loginMember == null) {
			String MNo = null;
		
		    List<Product> list = service.getSaleProductList(pageInfo, MNo);
		    modelAndView.addObject("list", list);
		    
		} else if(loginMember != null) {
			String MNo = Integer.toString(loginMember.getNo());
			
			List<Product> list = service.getSaleProductList(pageInfo, MNo);
			modelAndView.addObject("list", list);	
		}
	
		
		modelAndView.setViewName("product/salelist");
		return modelAndView;
	}
	

	@GetMapping("product/bestlist") 
	public ModelAndView bestlist(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page
			) {
	
			
		
			 List<Product> list = service.getBestProductList();
			 modelAndView.addObject("list", list);	
			
			 System.out.println("리스트입니다." + list);
		
			
		modelAndView.setViewName("product/bestlist");
		return modelAndView;
		
	
	}
	
	@ResponseBody
	@GetMapping("/reviewRe")
	public ProductBoard reviewView(@RequestParam int pbNo) {
		
		System.out.println(pbNo);
		List<ProductBoardReply> reply = service.findBypbNo(pbNo);
		
	
		
		
		//글 정보 가져오기
		ProductBoard pb = service.findReviewByPbNo(pbNo);
		
		System.out.println(pb);
		
		
		return pb;
	}
	
	
	@ResponseBody
	@GetMapping("reviewReplyRe")
	public List<ProductBoardReply> reply(@RequestParam int pbNo) {
		System.out.println(pbNo);
		List<ProductBoardReply> reply = service.findBypbNo(pbNo);
		
		
		return reply;	
	}
	
	
	
	
	
	
	
//	@ResponseBody
//	@GetMapping("/reviewRe")
//	public List<ProductBoardReply> reply(@RequestParam int pbNo) {
//		
//		System.out.println(pbNo);
//		List<ProductBoardReply> reply = service.findBypbNo(pbNo);
//		
//		System.out.println("리플 보기" + reply);
//		
//		
//		//글 정보 가져오기
//		ProductBoard pb = service.findReviewByPbNo(pbNo);
//		
//		System.out.println(pb);
//		
//		
//		return pb;
//	}
	
	
	
	
	
	@ResponseBody
	@PostMapping("/reviewReply")
	public ProductBoardReply replyenroll( @ModelAttribute ProductBoardReply reply) {
		int result = 0;

		//모델로만들어서 인설트 하면 댓글에 해당하는프라이러미리 키 조회 
		// 모델어트리뷰트로 만들기.
		ProductBoardReply replySet = null;
		result = service.save(reply);
		
		if(result > 0) {
			replySet = service.findBypbrNo(reply.getPbrNo());    
		} else {  
		}	
		
		
		return replySet;
	}
	
	
	@ResponseBody
	@PostMapping("/reviewWrite") 
	public ProductBoard reviewWrite(@ModelAttribute ProductBoard review) {
		int result = 0;
		

	
		result = service.save(review);
	
		return review;
	}
	
	@ResponseBody
	@GetMapping("/qnaView")
	public ProductBoard qnaView(@RequestParam int pbNo) {
		
		
		ProductBoard qnaView = service.findBoardQnaBypbNo(pbNo);
		
		
		
		
		return qnaView;
	}
	
	@ResponseBody
	@PostMapping("/qnaReply")
	public ProductBoardReply qnaReply(@ModelAttribute ProductBoardReply qnaReply) {
		int result = 0;
		
		
		result = service.saveQnaReply(qnaReply);
		
		
		ProductBoardReply qnaReplySet = null;
		
		if(result > 0) {
			qnaReplySet = service.findBypbrNo(qnaReply.getPbrNo());  
		} else {  
			
		}	
		
		
		System.out.println("이거이거" + qnaReplySet);
		
		return qnaReplySet;
	}

	
	@ResponseBody
	@PostMapping("/likeCheck")
	public int likeCheck(@ModelAttribute ProductLike favorite) {
		int result = 0;
		int likeCount = 0;
		int like = 0;
		
		// 좋아요 카운트를 측정하여 0또는 1을 구한다.
		like = service.findIsLike(favorite);
		
		System.out.println("like"+ like);
//		System.out.println("like 했는지" + like);
//		
		
		// 구한 카운트가 0이면 insert , 1이면 delete 작업을 수행한다.
//		insert에 성공하면 상품테이블에 likeCount를 update해준다.
		
		

		
		
		return like;
	}
	
	
	@ResponseBody
	@PostMapping("/qnaWrite")
	public ProductBoard qnaWrite(@ModelAttribute ProductBoard qna) {
		int result = 0;

	    System.out.println("qna" + qna);
		result = service.saveQna(qna);
	
		
		return qna;
	}
	
	
	@ResponseBody
	@PostMapping("/likeCountUpdate")
	public Product likeCount(@ModelAttribute ProductLike favorite, @RequestParam int like) {
		
		int likeCount = 0;
		Product LikeProduct = null;
		
		int result = 0;
		
		if(like == 0) {
			
			result = service.saveLike(favorite);
			
		}else if(like == 1)	{
			
			result = service.deleteLike(favorite);	
		}
		
		if(result == 1) {
			likeCount =service.updateProductLikeCount(favorite.getPNo());
			if(likeCount == 1) {
				LikeProduct = service.findlikeCountByNo(favorite.getPNo());
			}
		}
		
		System.out.println(LikeProduct);
		return LikeProduct;

	}
	
	
	
	
	}
	
	
	
	
		
	
	
	
	
	
	
	
	

