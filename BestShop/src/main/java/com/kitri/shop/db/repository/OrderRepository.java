package com.kitri.shop.db.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.kitri.shop.db.domain.Order;

public interface OrderRepository extends CrudRepository<Order,String>{

	@Query("SELECT o FROM Order o WHERE u_id = ?1 ORDER BY updateTime DESC")
	List<Order> SelectUserOrders(String userName);
	
	@Query("SELECT o FROM Order o WHERE p_id = ?1")
	List<Order> returnOrderID(long p_ID);
	
	
}
