package com.kitri.shop.db.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.kitri.shop.db.domain.Product;

public interface ProductRepository extends CrudRepository<Product, String>{

	@Query("SELECT p FROM Product p WHERE name LIKE %?1%")
	List<Product> selectProductByName(String search_name);
	
	@Query("SELECT p FROM Product p WHERE id=?1")
	Product findProductDetail(long id);
	
	@Query("SELECT p FROM Product p")
	List<Product> printAllProducts();
	
	@Query("SELECT p FROM Product p WHERE type=?1")
	List<Product> printProductsByType(String type);
	
	@Query("SELECT p FROM Product p WHERE type=?1 OR type=?2 ORDER BY createTime DESC")
	List<Product> printOrderByTime(String type1, String type2);
	
	@Query("SELECT p FROM Product p WHERE type=?1 OR type=?2 ORDER BY price ASC")
	List<Product> printOrderByLowPrice(String type1, String type2);
	
	@Query("SELECT p FROM Product p WHERE type=?1 OR type=?2 ORDER BY price DESC")
	List<Product> printOrderByHighPrice(String type1, String type2);	
}
