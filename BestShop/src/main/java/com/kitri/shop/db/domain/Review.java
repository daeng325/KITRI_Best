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
	private String ext;
	
	private String image;
	private String image_1;
	private String image_2;
	private String image_3;

	
	public Review(Long o_id, String u_id, double rev_price, double rev_quality, double rev_ship, String title, String content, String image) {
		this.o_id = o_id;
		this.u_id = u_id;
		this.rev_price = rev_price;
		this.rev_quality = rev_quality;
		this.rev_ship = rev_ship;
		this.title = title;
		this.content = content;
		
		byte[] byteImage = org.apache.commons.codec.binary.Base64.encodeBase64(image.getBytes());
		String encodedImage = new String(byteImage);
		this.image = encodedImage;
		

	}

	public Review(Long id, Long o_id, String u_id, double rev_price, double rev_quality, double rev_ship,
			double rev_agv, String title, String content, String ext, String image, String image_1, String image_2,
			String image_3) {
		super();
		this.id = id;
		this.o_id = o_id;
		this.u_id = u_id;
		this.rev_price = rev_price;
		this.rev_quality = rev_quality;
		this.rev_ship = rev_ship;
		this.rev_agv = rev_agv;
		this.title = title;
		this.content = content;
		this.ext = ext;
		this.image = image;
		this.image_1 = image_1;
		this.image_2 = image_2;
		this.image_3 = image_3;
	}
	
}
