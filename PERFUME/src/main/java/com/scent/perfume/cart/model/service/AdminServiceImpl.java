package com.scent.perfume.cart.model.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.scent.perfume.cart.model.mapper.AdminMapper;
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
@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;

	@Override
	@Transactional
	public int save(MultipartFile[] upfile, String[] renamedFileName, CartProduct cartProduct) {
		int result = 0;
		
		if (cartProduct.getProductNo()>0) {
			//update작업
			//topcategory && midcategory mapping 작업
			if (cartProduct.getPtNo() == 1 && cartProduct.getPmNo() == 1) {
				cartProduct.setPmNo(1);
			}else if (cartProduct.getPtNo() == 1 && cartProduct.getPmNo() == 2) {
				cartProduct.setPmNo(2);
			}else if (cartProduct.getPtNo() == 2 && cartProduct.getPmNo() == 1) {
				cartProduct.setPmNo(3);
			}else if (cartProduct.getPtNo() == 2 && cartProduct.getPmNo() == 2) {
				cartProduct.setPmNo(4);
			}else if (cartProduct.getPtNo() == 3 && cartProduct.getPmNo() == 1) {
				cartProduct.setPmNo(5);
			}else if (cartProduct.getPtNo() == 3 && cartProduct.getPmNo() == 2) {
				cartProduct.setPmNo(6);
			}else if (cartProduct.getPtNo() == 4 && cartProduct.getPmNo() == 1) {
				cartProduct.setPmNo(7);
			}else if (cartProduct.getPtNo() == 4 && cartProduct.getPmNo() == 2) {
				cartProduct.setPmNo(8);
			}else if (cartProduct.getPtNo() == 5 && cartProduct.getPmNo() == 1) {
				cartProduct.setPmNo(9);
			}else if (cartProduct.getPtNo() == 5 && cartProduct.getPmNo() == 2) {
				cartProduct.setPmNo(10);
			}else if (cartProduct.getPtNo() == 6 && cartProduct.getPmNo() == 1) {
				cartProduct.setPmNo(11);
			}else if (cartProduct.getPtNo() == 6 && cartProduct.getPmNo() == 2) {
				cartProduct.setPmNo(12);
			}
			//product update
			result = adminMapper.updateProduct(cartProduct);
			
			if (result > 0) {
				//option update
				for (int i = 0; i < cartProduct.getPoList().size(); i++) {
					adminMapper.updateProductOption(cartProduct.getProductNo(),cartProduct.getPoList().get(i));
				}
				//file update
				for (int i = 0; i < upfile.length; i++) {
					int fileSort = i;
					if (fileSort == 0) {
						fileSort = 1;
						adminMapper.updateProductFile(cartProduct.getProductNo(),
													  upfile[i].getOriginalFilename(),
													  renamedFileName[i],
													  fileSort);
					}else if (fileSort == 1) {
							  fileSort = 2;
							  adminMapper.updateProductFile(cartProduct.getProductNo(),
														    upfile[i].getOriginalFilename(),
														    renamedFileName[i],
														    fileSort);
					}else if (fileSort == 2) {
							  fileSort = 3;
							  adminMapper.updateProductFile(cartProduct.getProductNo(),
														    upfile[i].getOriginalFilename(),
														    renamedFileName[i],
														    fileSort);
					}
				}
			}
		}else {
			//insert작업
			//topcategory && midcategory mapping 작업
			if (cartProduct.getPtNo() == 1 && cartProduct.getPmNo() == 1) {
				cartProduct.setPmNo(1);
			}else if (cartProduct.getPtNo() == 1 && cartProduct.getPmNo() == 2) {
				cartProduct.setPmNo(2);
			}else if (cartProduct.getPtNo() == 2 && cartProduct.getPmNo() == 1) {
				cartProduct.setPmNo(3);
			}else if (cartProduct.getPtNo() == 2 && cartProduct.getPmNo() == 2) {
				cartProduct.setPmNo(4);
			}else if (cartProduct.getPtNo() == 3 && cartProduct.getPmNo() == 1) {
				cartProduct.setPmNo(5);
			}else if (cartProduct.getPtNo() == 3 && cartProduct.getPmNo() == 2) {
				cartProduct.setPmNo(6);
			}else if (cartProduct.getPtNo() == 4 && cartProduct.getPmNo() == 1) {
				cartProduct.setPmNo(7);
			}else if (cartProduct.getPtNo() == 4 && cartProduct.getPmNo() == 2) {
				cartProduct.setPmNo(8);
			}else if (cartProduct.getPtNo() == 5 && cartProduct.getPmNo() == 1) {
				cartProduct.setPmNo(9);
			}else if (cartProduct.getPtNo() == 5 && cartProduct.getPmNo() == 2) {
				cartProduct.setPmNo(10);
			}else if (cartProduct.getPtNo() == 6 && cartProduct.getPmNo() == 1) {
				cartProduct.setPmNo(11);
			}else if (cartProduct.getPtNo() == 6 && cartProduct.getPmNo() == 2) {
				cartProduct.setPmNo(12);
			}
			//product insert
			result = adminMapper.insertProduct(cartProduct);
			
			if (result > 0) {
				//option insert
				for (int i = 0; i < cartProduct.getPoList().size(); i++) {
					adminMapper.insertProductOption(cartProduct.getProductNo(),cartProduct.getPoList().get(i));
				}
				//file insert
				for (int i = 0; i < upfile.length; i++) {
					int fileSort = i;
					if (fileSort == 0) {
						fileSort = 1;
						adminMapper.insertProductFile(cartProduct.getProductNo(),
													  upfile[i].getOriginalFilename(),
													  renamedFileName[i],
													  fileSort);
					}else if (fileSort == 1) {
						fileSort = 2;
						adminMapper.insertProductFile(cartProduct.getProductNo(),
													  upfile[i].getOriginalFilename(),
													  renamedFileName[i],
													  fileSort);
					}else if (fileSort == 2) {
						fileSort = 3;
						adminMapper.insertProductFile(cartProduct.getProductNo(),
													  upfile[i].getOriginalFilename(),
													  renamedFileName[i],
													  fileSort);
					}
				}
			}
		}
		return result;
	}

	@Override
	public int getProductCount() {
		
		return adminMapper.getProductCount();
	}

	@Override
	public List<CartProduct> getAdminProductList(AdminPageInfo pageInfo) {
		
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<CartProduct> list = adminMapper.selectProductAll(rowBounds);
		return list;
	}

	@Override
	public CartProduct selectproductDetail(int productNo) {
		
		CartProduct product = null;
		
		product = adminMapper.selectproductDetail(productNo);
		
		return product;
	}

	@Override
	public List<AdminProductFile> selectFileDetail(int productNo) {
		
		return adminMapper.selectFileDetail(productNo);
	}

	@Override
	@Transactional
	public int deleteProduct(int productNo) {
		
		int result1 = adminMapper.deleteProductFile(productNo);
		
			if (result1 > 0) {
				int result2 = adminMapper.deleteProduct(productNo);
				
				if (result2 > 0) {
					return result2;
				}
			}
		
		return 0;
		
	}

	@Override
	public int getMemberCount() {
		
		return adminMapper.getMemberCount();
	}

	@Override
	public List<CartMember> getAdminMemberList(AdminPageInfo pageInfo) {
		
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<CartMember> list = adminMapper.getAdminMemberList(rowBounds);
		
		return list;
	}

	@Override
	public CartMember selectMemberDetail(int memberNo) {
		
		return adminMapper.selectMemberDetail(memberNo);
	}

	@Override
	public int idCheck(String id) {
		int result = 0;
		
		result = adminMapper.idCheck(id);
		
		return result;
	}

	@Override
	@Transactional
	public int memberUpdate(CartMember member) {
		
		return adminMapper.memberUpdate(member);
	}

	@Override
	public String adminPwdCheck() {
		
		return adminMapper.adminPwdCheck();
	}

	@Override
	@Transactional
	public int memberDelete(int memberNo) {
		
		return adminMapper.memberDelete(memberNo);
	}

	@Override
	@Transactional
	public int memberRecover(int memberNo) {
		
		return adminMapper.memberRecover(memberNo);
	}

	@Override
	public int getBenefitCount() {
		
		return adminMapper.getBenefitCount();
	}

	@Override
	@Transactional
	public List<Benefit> getAdminBenefitList(AdminPageInfo pageInfo) {
		
		List<Benefit> list1 = null;
		List<Benefit> list2 = null;
		Date now = new Date();
		
		list1 = adminMapper.selectAdminBenefitList();
		
		for (int i = 0; i < list1.size(); i++) {
			
			if ((now.after(list1.get(i).getBenefitEndDate()))) {
				adminMapper.benefitStatusUpdate(list1.get(i));
			}
		}
		
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBound = new RowBounds(offset, limit);
		
		list2 = adminMapper.getAdminBenefitList(rowBound);
		
		return list2;
	}

	@Override
	public Benefit benefitDetail(int benefitNo) {
		
		return adminMapper.selectBenefitDetail(benefitNo);
	}

	@Override
	@Transactional
	public int benefitInsert(MultipartFile upfile, String renamedFileName, Benefit benefit) {
		
		int result = adminMapper.benefitInsert(benefit);
		
		if (result > 0) {
			
			AdminProductFile file = new AdminProductFile();
			file.setProductNo(benefit.getBenefitNo());
			file.setOriginalFileName(upfile.getOriginalFilename());
			file.setRenameFileName(renamedFileName);
			
			return adminMapper.benefitFileInsert(file);
			
		}
		return result;
	}

	@Override
	@Transactional
	public int benefitUpdate(MultipartFile upfile, String renamedFileName, Benefit benefit) {
		
		int result = adminMapper.benefitUpdate(benefit);
		
		if (result > 0) {
			
			AdminProductFile file = new AdminProductFile();
			file.setProductNo(benefit.getBenefitNo());
			file.setOriginalFileName(upfile.getOriginalFilename());
			file.setRenameFileName(renamedFileName);
			
			return adminMapper.benefitFileUpdate(file);
		}
		return result;
	}

	@Override
	public int benefitApplyCheck(int benefitNo, int productNo) {
		
		return adminMapper.benefitApplyCheck(benefitNo,productNo);
	}

	@Override
	@Transactional
	public int benefitProductInsert(int benefitNo, int productNo) {
		
		return adminMapper.benefitProductInsert(benefitNo,productNo);
	}

	@Override
	@Transactional
	public int benefitProductDelete(int benefitNo, int productNo) {
		
		return adminMapper.benefitProductDelete(benefitNo,productNo);
	}

	@Override
	@Transactional
	public int benefitAllDelete(int benefitNo) {
		
		int result = 0;
		result = adminMapper.benefitProductAllDelete(benefitNo);
		
		if (result > 0) {
			result = 0;
			result = adminMapper.benefitFileAllDelete(benefitNo);
			
			if (result > 0) {
				result = 0;
				result = adminMapper.benefitDelete(benefitNo);
			}
		}
		return result;
	}

	@Override
	public int getAdminOrderList() {
		
		return adminMapper.getAdminOrderList();
	}

	@Override
	public List<Order> getAdminOrderDetailList(AdminPageInfo pageInfo) {
		
		List<Order> list = null;
		
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBound = new RowBounds(offset, limit);
		
		list = adminMapper.getAdminOrderDetailList(rowBound);
		
		return list;
	}

	@Override
	public Order selectOrderList(String orderNo) {
		
		return adminMapper.selectOrderList(orderNo);
	}

	@Override
	@Transactional
	public int statusUpdate(String orderNo, String status) {
		
		return adminMapper.statusUpdate(orderNo,status);
	}

	@Override
	@Transactional//삭제하기 해결하기
	public int deleteOrderList(OrderList order) {
		
		return adminMapper.deleteOrderList(order.getOrderNo());
	}

	@Override
	@Transactional//삭제하기 해결하기
	public int deleteOrder(OrderList order) {
		
		return adminMapper.deleteOrder(order.getOrderNo());
	}

}
