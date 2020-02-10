package com.kitri.shop.db.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name="orders")
@Getter
@Setter
@NoArgsConstructor
public class Order {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String u_id;
	private int p_id;
	private int count;

	private String status;
	private String ship_addr;
	private String payment;

	public Order(String u_id, int p_id, int count, String status, String ship_addr, String payment) {
		this.u_id = u_id;
		this.p_id = p_id;
		this.count = count;
		this.status = status;
		this.ship_addr = ship_addr;
		this.payment = payment;
	}
	
}
