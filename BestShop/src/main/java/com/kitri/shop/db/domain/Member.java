package com.kitri.shop.db.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name="users")
@Getter
@Setter
@NoArgsConstructor
public class Member {
	@Id
	private String id;

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
	
//	@CreationTimestamp
//	private Date createTime;
//	
//	@UpdateTimestamp
//	private Date updateTime;
	
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	@JoinColumn(name="id")
	private List<MemberRole> roles;

	
	public Member(String name, String gender, String age, String phone, String address, String email, String id, String pwd, String likeit, String agree, String agree2) {
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.id = id;
		this.pwd = pwd;
		this.likeit = likeit;
		this.agree = agree;
		this.agree2 = agree2;
	}
}
