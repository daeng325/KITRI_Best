package com.kitri.shop.db.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.shop.db.domain.Order;
import com.kitri.shop.db.repository.OrderRepository;

@Service
public class OrderService {

	@Autowired
	OrderRepository oRepo;
	
	public Order selectOrderByOid(Long oid) {
		return oRepo.selectOrderByOid(oid);
	}
	
}
