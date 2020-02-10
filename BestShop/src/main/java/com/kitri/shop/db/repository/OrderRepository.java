package com.kitri.shop.db.repository;

import org.springframework.data.repository.CrudRepository;

import com.kitri.shop.db.domain.Order;

public interface OrderRepository extends CrudRepository<Order,String>{

}
