package com.example.demo.board.service;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.example.demo.board.domain.ProductVO;
import com.example.demo.board.mapper.ProductMapper;

@Service("com.example.demo.board.service.ProductService")
public class ProductService {
	
	@Resource(name="com.example.demo.board.mapper.ProductMapper")
	ProductMapper productMapper;
	
    public int productInsertService(ProductVO product) throws Exception{
        return productMapper.upload(product);
    }
	
    public List<ProductVO> findByName(String name) throws Exception{
    	return productMapper.search(name);
    }

    public ProductVO findById(String id) throws Exception{
    	return productMapper.findById(id);
    }
    
    public int deleteById(String id) throws Exception{
    	return productMapper.delete(id);
    }

	public int updateProduct(ProductVO product) throws Exception {
		return productMapper.update(product.getId());
	}
	
	public List<ProductVO> printAllProducts()  throws Exception{
		return productMapper.printAllProducts();
		
	}
	
	public List<ProductVO> printProductsByType(@Param("type") String type) throws Exception{
		return productMapper.printProductsByType(type);
	}
	
	public ProductVO printProductDetail(@Param("id") String id) throws Exception{
		return productMapper.printProductDetail(id);
	}
    
}