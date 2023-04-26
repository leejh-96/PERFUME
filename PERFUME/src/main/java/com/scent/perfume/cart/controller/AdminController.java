package com.scent.perfume.cart.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scent.perfume.cart.model.service.AdminService;
import com.scent.perfume.cart.model.vo.AdminMultipartFileUtil;
import com.scent.perfume.cart.model.vo.AdminPageInfo;
import com.scent.perfume.cart.model.vo.AdminProductFile;
import com.scent.perfume.cart.model.vo.Benefit;
import com.scent.perfume.cart.model.vo.CartMember;
import com.scent.perfume.cart.model.vo.CartProduct;
import com.scent.perfume.cart.model.vo.Order;
import com.scent.perfume.cart.model.vo.OrderList;
import com.scent.perfume.cart.model.vo.AdminProductFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping("/home")
	public String adminHome() {
		return "cart/adminHome";
	}
	
	@RequestMapping("/benefit")
	public String benefit() {
		
		return "cart/adminBenefitInsert";
	}
	
	@ResponseBody
	@PostMapping("/benefitDelete")
	public int benefitDelete(@RequestParam("benefitNo") int benefitNo) {
		
		int result = 0;
		String location = "";
		Benefit benefit = null;
		
		benefit = adminService.benefitDetail(benefitNo);
		
		if (benefit.getBenefitFileList() != null) {
			try {
				location = resourceLoader.getResource("/resources/upload/benefit").getFile().getPath();
				
				for (int i = 0; i < benefit.getBenefitFileList().size(); i++) {
					AdminMultipartFileUtil.delete(location + "/" + benefit.getBenefitFileList().get(i).getRenameFileName());
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		result = adminService.benefitAllDelete(benefitNo);
		
		return result;
	}
	
	@PostMapping("/benefitInsert")
	public String benefitInsert(@ModelAttribute Benefit benefit,
								@RequestParam("originalFileName") MultipartFile upfile,
								Model model) {
		
		int result = 0;
		String location = null;
		String renamedFileName = "";
		
		try {
			location = resourceLoader.getResource("resources/upload/benefit").getFile().getPath();
			
			if (upfile != null) {
				renamedFileName = AdminMultipartFileUtil.save(upfile, location);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (renamedFileName != null || renamedFileName != "") {
			
			result = adminService.benefitInsert(upfile,renamedFileName,benefit);
			
			if (result > 0) {
				model.addAttribute("msg", "기획전혜택이 정상적으로 등록되었습니다.");
				model.addAttribute("location", "/admin/benefitList");
			}else {
				model.addAttribute("msg", "기획전혜택 등록에 실패했습니다.");
				model.addAttribute("location", "/admin/benefit");
			}
		}
		return "common/msg";
	}
	
	@PostMapping("/benefitUpdate")
	public String benefitUpdate(@ModelAttribute Benefit benefit,
								@RequestParam("originalFileName") MultipartFile upfile,
								Model model) {
		
		Benefit benefit2 = null;
		int result = 0;
		String location = null;
		String renamedFileName = "";
		
		benefit2 = adminService.benefitDetail(benefit.getBenefitNo());
		
		if (benefit2 != null) {
			try {
				location = resourceLoader.getResource("resources/upload/product").getFile().getPath();
				if (benefit2.getBenefitFileList()!= null) {
					for (int i = 0; i < benefit2.getBenefitFileList().size(); i++) {
						//기존 있던 사진을 삭제하는 로직
						AdminMultipartFileUtil.delete(location + "/" + benefit2.getBenefitFileList().get(i).getRenameFileName());
					}
				}
				if (upfile != null) {
					//변경된 파일의 이름을 리턴받는다.
					renamedFileName = AdminMultipartFileUtil.save(upfile, location);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (renamedFileName != null) {
				result = adminService.benefitUpdate(upfile,renamedFileName,benefit);
			}
			if (result > 0) {
				model.addAttribute("msg", "상품이 정상적으로 수정되었습니다!");
				model.addAttribute("location", "/admin/benefitDetail?benefitNo="+benefit2.getBenefitNo());
			}else {
				model.addAttribute("msg", "상품 수정에 실패하였습니다.");
				model.addAttribute("location", "/admin/benefitDetail?benefitNo="+benefit2.getBenefitNo());
			}
		}else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("location", "/admin/benefitList");
		}
		return "common/msg";
	}
	
	@GetMapping("/benefitList")
	public String benefitList(@RequestParam(defaultValue = "1") int page,
							  Model model) {
		
		List<Benefit> list = null;
		
		int count = adminService.getBenefitCount();
		
		AdminPageInfo pageInfo = new AdminPageInfo(page, 10, count, 10);
		
		list = adminService.getAdminBenefitList(pageInfo);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("list", list);
		
		return "cart/adminBenefitList";
	}
	
	@GetMapping("/benefitDetail")
	public String benefitDetail(@RequestParam("benefitNo") int benefitNo,
								Model model) {
		
		Benefit benefit = null;
		
		benefit = adminService.benefitDetail(benefitNo);
		
		log.info("benefit : {}",benefit);
		
		model.addAttribute("benefit", benefit);
		
		return "cart/adminBenefitDetail";
	}
	
	@ResponseBody
	@GetMapping("/benefitApplyCheck")
	public int benefitApplyCheck(@RequestParam("benefitNo") int benefitNo,
								 @RequestParam("productNo") int productNo) {
		
		int result = adminService.benefitApplyCheck(benefitNo,productNo);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("benefitProductInsert")
	public int benefitProductInsert(@RequestParam("benefitNo") int benefitNo,
			 						@RequestParam("productNo") int productNo) {
		
		int result = adminService.benefitProductInsert(benefitNo,productNo);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/benefitProductDelete")
	public int benefitProductDelete(@RequestParam("benefitNo") int benefitNo,
									@RequestParam("productNo") int productNo) {
		
		int result = adminService.benefitProductDelete(benefitNo,productNo);
		
		return result;
	}
	
	@RequestMapping("/product")
	public String product() {
		return "cart/adminProduct";
	}
	
	@GetMapping("/memberDetail")
	public String memberDetail(@RequestParam("memberNo") int memberNo,
							   Model model) {
		
		CartMember member = null;
		
		member = adminService.selectMemberDetail(memberNo);
		
		model.addAttribute("member", member);
		
		return "cart/adminMemberDetail";
	}

	@GetMapping("/memberList")
	public String memberList(Model model,@RequestParam(defaultValue = "1")int page) {
		
		int count = adminService.getMemberCount();
		AdminPageInfo pageInfo = new AdminPageInfo(page, 10, count, 10);
		
		List<CartMember> list = adminService.getAdminMemberList(pageInfo);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("list", list);
		
		return "cart/adminMemberList";
	}
	
	@PostMapping("/memberUpdate")
	public String memberUpdate(@ModelAttribute CartMember member,
							   Model model) {
		
		int result = 0;
		
		member.setMemberPwd(passwordEncoder.encode(member.getMemberPwd()));
		
		result = adminService.memberUpdate(member);
		
		if (result > 0) {
			model.addAttribute("msg", "회원 정보 수정에 성공하였습니다.");
			model.addAttribute("location", "/admin/memberDetail?memberNo="+member.getMemberNo());
		}else {
			model.addAttribute("msg", "회원 정보 수정에 실패하였습니다.");
			model.addAttribute("location", "/admin/memberDetail?memberNo="+member.getMemberNo());
		}
		return "common/msg";
	}
	
	@ResponseBody
	@GetMapping("/idCheck")
	public int idCheck(@RequestParam("id") String id) {
		int result = 0;
		
		result = adminService.idCheck(id);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/adminPwdCheck")
	public boolean adminPwdCheck(@RequestParam("adminPwd") String pwd) {
		
		boolean adminPwd = false;
		String adminPassWord = "";
		
		adminPassWord = adminService.adminPwdCheck();
		
		if (passwordEncoder.matches(pwd, adminPassWord)) {
			adminPwd = true;
		}else {
			adminPwd = false;
		}
		return adminPwd;
	}
	
	@ResponseBody
	@PostMapping("/memberDelete")
	public int memberDelete(@RequestParam("memberNo") int memberNo) {
		
		int result = 0;
		
		result = adminService.memberDelete(memberNo);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("memberRecover")
	public int memberRecover(@RequestParam("memberNo") int memberNo) {
		int result = 0;
		
		result = adminService.memberRecover(memberNo);
		
		return result;
	}
	
	@GetMapping("/productList")
	public String productUpdate(Model model,@RequestParam(defaultValue = "1")int page) {
		
		int count = adminService.getProductCount();
		
		AdminPageInfo pageInfo = new AdminPageInfo(page, 10, count, 10);
		
		List<CartProduct> list = adminService.getAdminProductList(pageInfo);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("list", list);
		
		return "cart/adminProductList";
	}
	
	@GetMapping("/productDetail")
	public String productDetail(@RequestParam("productNo") int productNo,
								Model model){
		
		CartProduct product = null;
		
		product = adminService.selectproductDetail(productNo);
		
		model.addAttribute("product", product);
		
		return "cart/adminProductDetail";
	}
	
	@PostMapping("/insert")
	public String insert(@RequestParam("originalFileName") MultipartFile[] upfile,
						 @ModelAttribute CartProduct cartProduct,
						 Model model) {
		
		int result = 0;
		String location = null;
		String renamedFileName[] = new String[upfile.length];

		try {
		location = resourceLoader.getResource("resources/upload/product").getFile().getPath();
		if (upfile != null) {
			for (int i = 0; i < upfile.length; i++) {
				renamedFileName[i] = AdminMultipartFileUtil.save(upfile[i], location);
			}
		}
		
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		if (renamedFileName != null) {
			result = adminService.save(upfile,renamedFileName,cartProduct);
		}
		
		if (result > 0) {
			model.addAttribute("msg", "상품이 정상적으로 등록되었습니다!");
			model.addAttribute("location", "/admin/product");
		}else {
			model.addAttribute("msg", "상품이 등록에 실패하였습니다!");
			model.addAttribute("location", "/admin/product");
		}
		return "common/msg";
	}
	
	@PostMapping("/update")
	public String update(@RequestParam("originalFileName") MultipartFile[] upfile,
			 			 @ModelAttribute CartProduct cartProduct,
			 			 Model model) {
		
		CartProduct product = null;
		int result = 0;
		String location = null;
		String[] renamedFileName = new String[upfile.length];
		
		product = adminService.selectproductDetail(cartProduct.getProductNo());
		
		if (product != null) {
			try {
				location = resourceLoader.getResource("resources/upload/product").getFile().getPath();
				if (product.getPfList()!= null) {
					for (int i = 0; i < product.getPfList().size(); i++) {
						AdminMultipartFileUtil.delete(location + "/" + product.getPfList().get(i).getRenameFileName());
					}
				}
				if (upfile != null) {
					for (int i = 0; i < upfile.length; i++) {
						renamedFileName[i] = AdminMultipartFileUtil.save(upfile[i], location);
					}
				}
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			if (renamedFileName != null) {
				result = adminService.save(upfile,renamedFileName,cartProduct);
			}
			if (result > 0) {
				model.addAttribute("msg", "상품이 정상적으로 수정되었습니다!");
				model.addAttribute("location", "/admin/productDetail?productNo="+cartProduct.getProductNo());
			}else {
				model.addAttribute("msg", "상품 수정에 실패하였습니다.");
				model.addAttribute("location", "/admin/productDetail?productNo="+cartProduct.getProductNo());
			}
		}else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("location", "/admin/productList");
		}
		
		return "common/msg";
	}
	
	@ResponseBody
	@PostMapping("delete")
	public int delete(@RequestParam("productNo") int productNo,
					  Model model) {
		
		int result = 0;
		
		List<AdminProductFile> fileList = null;
		String location = null;
		
		fileList = adminService.selectFileDetail(productNo);
		
		if (fileList != null) {
			try {
				location = resourceLoader.getResource("resources/upload/product").getFile().getPath();
				//지정된 경로의 파일을 삭제하는 로직
				for (int i = 0; i < fileList.size(); i++) {
					AdminMultipartFileUtil.delete(location + "/" + fileList.get(i).getRenameFileName());
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		result = adminService.deleteProduct(productNo);

		return result;
	}
	
	@GetMapping("/orderList")
	public String orderList(@RequestParam(defaultValue = "1")int page,
							Model model) {
		
		int count = adminService.getAdminOrderList();
		AdminPageInfo pageInfo = new AdminPageInfo(page, 10, count, 10);
		
		List<Order> list = adminService.getAdminOrderDetailList(pageInfo);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("list", list);
		
		return "cart/adminOrderList";
	}
	
	@GetMapping("/orderDetail")
	public String orderDetail(@RequestParam("orderNo") String orderNo,
							  Model model) {
		
		Order order = null;
		
		order = adminService.selectOrderList(orderNo);
		
		model.addAttribute("order", order);
		
		return "cart/adminOrderDetail";
	}
	
	@ResponseBody
	@PostMapping("/statusUpdate")
	public int statusUpdate(@RequestParam("orderNo") String orderNo,
							@RequestParam("status") String status) {
		
		log.info("orderNo : {}", orderNo);
		log.info("status : {}", status);
		
		int result = adminService.statusUpdate(orderNo,status);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/deleteOrder")//삭제하기 해결하기
	public int deleteOrder(@ModelAttribute OrderList order) {
		
		log.info("orderNo : {}",order);
		
		int result = adminService.deleteOrderList(order);
		
		if (result > 0) {
			adminService.deleteOrder(order);
		
		return result;
		}
		
		return result;
	}
	
}
