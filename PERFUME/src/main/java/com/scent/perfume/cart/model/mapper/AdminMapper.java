package com.scent.perfume.cart.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.web.multipart.MultipartFile;

import com.scent.perfume.cart.model.vo.AdminProductFile;
import com.scent.perfume.cart.model.vo.Benefit;
import com.scent.perfume.cart.model.vo.CartMember;
import com.scent.perfume.cart.model.vo.CartProduct;
import com.scent.perfume.cart.model.vo.Order;
import com.scent.perfume.cart.model.vo.OrderList;
import com.scent.perfume.cart.model.vo.AdminProductFile;
import com.scent.perfume.cart.model.vo.productOption;

@Mapper
public interface AdminMapper {

	int insertProduct(@Param("product") CartProduct product);

	int insertProductOption(@Param("productNo") int productNo,@Param("pOption") productOption productOption);

	int insertProductFile(@Param("productNo") int productNo,
						  @Param("originalFilename") String originalFilename,
						  @Param("renamedFileName") String renamedFileName,
						  @Param("fileSort") int fileSort);

	int getProductCount();

	List<CartProduct> selectProductAll(RowBounds rowBounds);

	CartProduct selectproductDetail(int productNo);

	int updateProduct(@Param("product") CartProduct product);

	int updateProductOption(@Param("productNo") int productNo,@Param("pOption") productOption option);

	int updateProductFile(@Param("productNo") int productNo,
						  @Param("originalFilename") String originalFilename,
						  @Param("renamedFileName") String renamedFileName,
						  @Param("fileSort") int fileSort);

	List<AdminProductFile> selectFileDetail(int productNo);

	int deleteProductFile(@Param("productNo") int productNo);

	int deleteProduct(@Param("productNo") int productNo);

	int getMemberCount();

	List<CartMember> getAdminMemberList(RowBounds rowBounds);

	CartMember selectMemberDetail(@Param("memberNo") int memberNo);

	int idCheck(@Param("id") String id);

	int memberUpdate(@Param("member") CartMember member);

	String adminPwdCheck();

	int memberDelete(@Param("memberNo") int memberNo);

	int memberRecover(@Param("memberNo") int memberNo);

	int getBenefitCount();

	List<Benefit> getAdminBenefitList(RowBounds rowBound);

	List<Benefit> selectAdminBenefitList();

	int benefitStatusUpdate(@Param("benefit") Benefit benefit);

	Benefit selectBenefitDetail(@Param("benefitNo") int benefitNo);

	int benefitInsert(@Param("benefit") Benefit benefit);

	int benefitFileInsert(@Param("file") AdminProductFile file);

	int benefitUpdate(@Param("benefit") Benefit benefit);

	int benefitFileUpdate(@Param("file") AdminProductFile file);

	int benefitApplyCheck(@Param("benefitNo") int benefitNo,@Param("productNo") int productNo);

	int benefitProductInsert(@Param("benefitNo") int benefitNo,@Param("productNo") int productNo);

	int benefitProductDelete(@Param("benefitNo") int benefitNo,@Param("productNo") int productNo);

	int benefitProductAllDelete(@Param("benefitNo") int benefitNo);

	int benefitFileAllDelete(@Param("benefitNo") int benefitNo);

	int benefitDelete(@Param("benefitNo") int benefitNo);

	int getAdminOrderList();

	List<Order> getAdminOrderDetailList(RowBounds rowBound);

	Order selectOrderList(@Param("orderNo") String orderNo);

	int statusUpdate(@Param("orderNo") String orderNo, @Param("status") String status);

	int deleteOrder(@Param("order") String order);//삭제하기 해결하기

	int deleteOrderList(@Param("order") String order);//삭제하기 해결하기

	

	
	
	
	
	
}
