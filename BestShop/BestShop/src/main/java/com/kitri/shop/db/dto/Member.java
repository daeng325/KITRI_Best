package com.kitri.shop.db.dto;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name="members")
@Getter
@Setter
@NoArgsConstructor
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
}
