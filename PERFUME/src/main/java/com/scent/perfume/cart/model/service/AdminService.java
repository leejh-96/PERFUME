package com.scent.perfume.cart.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.scent.perfume.cart.model.vo.AdminPageInfo;
import com.scent.perfume.cart.model.vo.AdminProductFile;
import com.scent.perfume.cart.model.vo.Benefit;
import com.scent.perfume.cart.model.vo.CartMember;
import com.scent.perfume.cart.model.vo.CartProduct;

public interface AdminService {

	int save(MultipartFile[] upfile, String[] renamedFileName, CartProduct cartProduct);

	int getProductCount();

	List<CartProduct> getAdminProductList(AdminPageInfo pageInfo);

	CartProduct selectproductDetail(int productNo);

	List<AdminProductFile> selectFileDetail(int productNo);

	int deleteProduct(int productNo);

	int getMemberCount();

	List<CartMember> getAdminMemberList(AdminPageInfo pageInfo);

	CartMember selectMemberDetail(int memberNo);

	int idCheck(String id);

	int memberUpdate(CartMember member);

	String adminPwdCheck();

	int memberDelete(int memberNo);

	int memberRecover(int memberNo);

	int getBenefitCount();

	List<Benefit> getAdminBenefitList(AdminPageInfo pageInfo);

	Benefit benefitDetail(int benefitNo);

	int benefitInsert(MultipartFile upfile, String renamedFileName, Benefit benefit);

	int benefitUpdate(MultipartFile upfile, String renamedFileName, Benefit benefit);

	int benefitApplyCheck(int benefitNo, int productNo);

	int benefitProductInsert(int benefitNo, int productNo);

	int benefitProductDelete(int benefitNo, int productNo);

	int benefitAllDelete(int benefitNo);

}
