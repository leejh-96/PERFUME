package com.scent.perfume.product.model.service;

import java.util.List;


import com.scent.perfume.common.util.PageInfo;
import com.scent.perfume.product.model.vo.Option;
import com.scent.perfume.product.model.vo.Product;
import com.scent.perfume.product.model.vo.TopCate;

public interface ProductService {

	int getProductCount(String gender);

	List<Product> getProductList(PageInfo pageInfo, String gender, String sort, String bn, String keyword);

	List<Product> findProductByNo(int no);

	int getTopCateCount();

	List<TopCate> getTopCateList();

	List<Product> findByPtNo(int no);

	int getScentProductCountByNo(int no);

	List<Product> getScentPrductList(PageInfo pageInfo, int no);

	TopCate findScentByNo(int no);

	int getProductCountByGender(String gender);

	List<Product> getProductListByGender(PageInfo pageInfo, String gender);

	List<Product> getBrandList();
	


		
}
