package com.example.demo.board.mapper;

import org.springframework.stereotype.Repository;

import com.example.demo.board.domain.MemberVO;

@Repository("com.example.demo.board.mapper.MemberMapper")
public interface MemberMapper {

	// 회원가입 작성
	public int signinInsert(MemberVO member) throws Exception;
}
