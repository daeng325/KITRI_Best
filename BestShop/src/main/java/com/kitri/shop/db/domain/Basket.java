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
@Table(name="baskets")
@Getter
@Setter
@NoArgsConstructor
public class Basket {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String id;
	private String u_id;
	private Long p_id;
	
	private int count;
	
	@CreationTimestamp
	private LocalDateTime createTime;
	
	@UpdateTimestamp
	private LocalDateTime updateTime;
	
}
