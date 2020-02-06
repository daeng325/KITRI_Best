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
@Table(name="products")
@Getter
@Setter
@NoArgsConstructor
public class Product {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String name;	
	private String type;
	private int price;
	private String description;
	private byte[] image;
	private String status;
	
	public Product(Long id, String name, String type, int price, String description, byte[] image, String status) {
		this.id = id;
		this.name = name;
		this.type = type;
		this.price = price;
		this.description = description;
		this.image = image;
		this.status = status;
	}
}
