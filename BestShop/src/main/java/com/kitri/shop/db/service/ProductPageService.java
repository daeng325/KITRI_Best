package com.kitri.shop.db.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.shop.db.domain.Product;
import com.kitri.shop.db.repository.ProductRepository;

@Service
public class ProductPageService{
	@Autowired
	ProductRepository proRepo;

	public List<Product> selectSortProducts(String path) {

		int idx = path.indexOf('_');
    	String sorted = path.substring(idx+1);       	
    	String type = path.substring(1, idx);
    	
    	if(type.contains("bags")) {
    		type="Bags & Shoes";
    	} 
    	
       List<Product> products;
   	
    	if(sorted.equals("new")) {
    		if(type.contains("&")) {
    			products = proRepo.printOrderByTime("bag", "shoes");
    		}
    		else {
    			products = proRepo.printOrderByTime(type, type);
    		}
    	}
    	else if(sorted.equals("low")) {
    		if(type.contains("&")) {
    			products = proRepo.printOrderByLowPrice("bag", "shoes");
    		}
    		else {
    			products = proRepo.printOrderByLowPrice(type, type);
    		}
    	}
    	else {
    		if(type.contains("&")) {
    			products = proRepo.printOrderByHighPrice("bag", "shoes");
    		}
    		else {
    			products = proRepo.printOrderByHighPrice(type, type);
    		}
    	}
		return products;
	}

	public List<Product> selectProductsType(String type){
		return proRepo.printProductsByType(type);
	}

}
