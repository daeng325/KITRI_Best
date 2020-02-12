package com.kitri.shop.db.domain;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

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
	private String image_thumbnail;
	private String image_detail;
	private int count;
	private String status;
	private String image;
	
	@CreationTimestamp
	private LocalDateTime createTime;
	
	@UpdateTimestamp
	private LocalDateTime updateTime;

	
	public Product(Long id, String name, String type, int price, String description, String image_thumbmail, String image_detail, int count, String image, String status) {
		this.id = id;
		this.name = name;
		this.type = type;
		this.price = price;
		this.description = description;
		this.image_thumbnail = image_thumbmail;
		this.image_detail = image_detail;
		this.count = count;
		this.image = image;
		this.status = status;
	}
	
	public Product(String name, String type, int price, String description, String image_thumbmail, String image_detail, int count, String image, String status) {
		this.name = name;
		this.type = type;
		this.price = price;
		this.description = description;
		this.image_thumbnail = image_thumbmail;
		this.image_detail = image_detail;
		this.count = count;
		this.image = image;
		this.status = status;
	}
}
