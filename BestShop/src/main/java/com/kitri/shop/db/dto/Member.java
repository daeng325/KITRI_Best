package com.kitri.shop.db.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="members")
public class Member {
	@Id
	private String ID;

	private String name;	
	private String gender;
	private String age;
	private String phone;
	private String address;
	private String email;

	private String pwd;

	private String likeit;
	private String agree;
	private String agree2;
	
	protected Member() {
		
	}
	
	public Member(String name, String gender, String age, String phone, String address, String email, String ID, String pwd, String likeit, String agree, String agree2) {
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.ID = ID;
		this.pwd = pwd;
		this.likeit = likeit;
		this.agree = agree;
		this.agree2 = agree2;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		this.ID = iD;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getLikeit() {
		return likeit;
	}
	public void setLikeit(String likeit) {
		this.likeit = likeit;
	}
	public String getAgree() {
		return agree;
	}
	public void setAgree(String agree) {
		this.agree = agree;
	}
	public String getAgree2() {
		return agree2;
	}
	public void setAgree2(String agree2) {
		this.agree2 = agree2;
	}	
}
