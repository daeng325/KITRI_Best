package com.example.demo.board.domain;

public class ReviewVO {

	private String id;
	private String o_id;
	private String u_id;

	private double rev_price;
	private double rev_quality;
	private double rev_ship;
	private double rev_agv;
	
	private String content;
	private byte[] image_1;
	private byte[] image_2;
	private byte[] image_3;
	
	private String ext;
	
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getO_id() {
		return o_id;
	}
	public void setO_id(String o_id) {
		this.o_id = o_id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public double getRev_price() {
		return rev_price;
	}
	public void setRev_price(double rev_price) {
		this.rev_price = rev_price;
	}
	public double getRev_quality() {
		return rev_quality;
	}
	public void setRev_quality(double rev_quality) {
		this.rev_quality = rev_quality;
	}
	public double getRev_ship() {
		return rev_ship;
	}
	public void setRev_ship(double rev_ship) {
		this.rev_ship = rev_ship;
	}
	public double getRev_agv() {
		return rev_agv;
	}
	public void setRev_agv(double rev_agv) {
		this.rev_agv = rev_agv;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public byte[] getImage_1() {
		return image_1;
	}
	public void setImage_1(byte[] image_1) {
		this.image_1 = image_1;
	}
	public byte[] getImage_2() {
		return image_2;
	}
	public void setImage_2(byte[] image_2) {
		this.image_2 = image_2;
	}
	public byte[] getImage_3() {
		return image_3;
	}
	public void setImage_3(byte[] image_3) {
		this.image_3 = image_3;
	}
	
	
	
}
