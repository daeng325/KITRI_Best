package com.kitri.shop.db.mapper;

import org.springframework.stereotype.Repository;

import com.kitri.shop.db.dto.Member;

@Repository("com.kitri.shop.db.mapper.MemberMapper")
public interface MemberMapper {
	// 회원가입 작성
	public int signinInsert(Member member) throws Exception;
}

