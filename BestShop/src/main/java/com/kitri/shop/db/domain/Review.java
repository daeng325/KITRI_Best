package com.kitri.shop.db.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="reviews")
@Getter
@Setter
public class Review {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private Long o_id;
	private String u_id;

	private double rev_price;
	private double rev_quality;
	private double rev_ship;
	private double rev_agv;
	
	private String title;
	private String content;
	private byte[] image_1;
	private byte[] image_2;
	private byte[] image_3;
}
