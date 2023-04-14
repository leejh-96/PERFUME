package com.scent.perfume.product.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scent.perfume.common.util.PageInfo;
import com.scent.perfume.product.model.mapper.ProductMapper;
import com.scent.perfume.product.model.vo.Option;
import com.scent.perfume.product.model.vo.Product;
import com.scent.perfume.product.model.vo.TopCate;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductMapper mapper;
		
	@Override
	public int getProductCount(String gender) {
		
		return mapper.selectProductCount(gender);
	}

	@Override
	public List<Product> findProductByNo(int no) {
		
		return mapper.selectProductByNo(no);
	}

	@Override
	public List<Product> getProductList(PageInfo pageInfo, String gender, String sort, String bn, String keyword) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return mapper.selectAll(rowBounds, gender, sort, bn, keyword);
	}

	@Override
	public int getTopCateCount() {
		
		return mapper.selelctTopCateCount();
	}

	@Override
	public List<TopCate> getTopCateList() {
		
		return mapper.selectAllTopCate();
	}

	@Override
	public List<Product> findByPtNo(int no) {
		
		return mapper.selectProductByPtNo(no);
	}

	@Override
	public int getScentProductCountByNo(int no) {
		
		return mapper.selectScentProductCountByNo(no);
	}

	@Override
	public List<Product> getScentPrductList(PageInfo pageInfo, int no) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectScentProductByNo(rowBounds, no);
	}

	@Override
	public TopCate findScentByNo(int no) {
		return mapper.selectScentByNo(no);
	}

	@Override
	public int getProductCountByGender(String gender) {
		
		return mapper.selectProductCountByGender(gender);
	}

	@Override
	public List<Product> getProductListByGender(PageInfo pageInfo, String gender) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
	
		return mapper.selectProductByGender(rowBounds, gender);
	}

	@Override
	public List<Product> getBrandList() {
		
		return mapper.selectBrandList();
	}
	

}
