package com.kitri.shop.repository;

import org.springframework.data.repository.CrudRepository;
import com.kitri.shop.db.dto.Product;

public interface ProductRepository extends CrudRepository<Product, String>{

}
