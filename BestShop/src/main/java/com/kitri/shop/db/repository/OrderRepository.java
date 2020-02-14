package com.kitri.shop.db.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.kitri.shop.db.domain.Order;
import com.kitri.shop.db.domain.Product;

public interface OrderRepository extends CrudRepository<Order,String>{

	@Query("SELECT o FROM Order o WHERE u_id = ?1 ORDER BY update_time DESC")
	List<Order> selectOrderByUid(String userName);
	
	@Query("SELECT o FROM Order o WHERE p_id = ?1")
	List<Order> selectOrder(long p_ID);
	
	@Query("SELECT o FROM Order o WHERE id = ?1")
	Order selectOrderByOid(Long oid);

	@Query("SELECT o.p_id FROM Order o WHERE id = ?1")
	Long selectPid(Long id);
	
	
}
