package com.example.demo.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.board.domain.ProductVO;

@Repository("com.example.demo.board.mapper.ProductMapper")
public interface ProductMapper {

	// 상품 업로드
	public int upload(ProductVO product) throws Exception;
	
	// 상품 검색
	public List<ProductVO> search(@Param("name") String name) throws Exception;
	
	public ProductVO findById(@Param("id") String id) throws Exception;
	
	public int delete(@Param("id") String id) throws Exception;

	public int update(@Param("id") String id) throws Exception;
	
	public List<ProductVO> printAllProducts() throws Exception;
	
	public List<ProductVO> printProductsByType(@Param("type") String type) throws Exception;
	
	public ProductVO printProductDetail(@Param("id") String id) throws Exception;
}
