package com.scent.perfume.product.model.service;

import java.util.List;


import com.scent.perfume.common.util.PageInfo;
import com.scent.perfume.product.model.vo.Option;
import com.scent.perfume.product.model.vo.Product;
import com.scent.perfume.product.model.vo.ProductBoard;
import com.scent.perfume.product.model.vo.ProductBoardCategory;
import com.scent.perfume.product.model.vo.ProductBoardReply;
import com.scent.perfume.product.model.vo.TopCate;

public interface ProductService {

	int getProductCount(String gender, String sort, String bn, String keyword);

	List<Product> getProductList(PageInfo pageInfo, String gender, String sort, String bn, String keyword);

	List<Product> findProductByNo(int no);

	int getTopCateCount();

	List<TopCate> getTopCateList();

	List<Product> findByPtNo(int no);

	int getScentProductCountByNo(int no, String gender, String bn, String keyword);

	List<Product> getScentProductList(PageInfo pageInfo, int no, String gender, String bn, String sort, String keyword);
	

	TopCate findScentByNo(int no);

	int getProductCountByGender(String gender);

	List<Product> getProductListByGender(PageInfo pageInfo, String gender);

	List<Product> getBrandList();

	List<Option> findProductOptionByNo(int no);

	int getProductPaperCount();

	List<Product> getProductPaperList(PageInfo pageInfo , String sort);

	List<ProductBoard> findProductBoardByNo(PageInfo pageInfo, int no);

	int getProductBoardCount(int no);

	List<ProductBoard> findGradebyNo(int no);

	int getSaleProductCount();

	List<Product> getSaleProductList(PageInfo pageInfo);

	int getProductQnaCount(int no);

	List<ProductBoard> findProductQnaByNo(PageInfo qnapageInfo, int no);

	List<ProductBoardReply> findBypbNo(int pbNo);


	int save(ProductBoardReply reply);

	ProductBoardReply findBypbrNo(int pbrno);

	int save(ProductBoard review);

	List<ProductBoardCategory> getBoardCategoryList();





	

	
	


		
}
