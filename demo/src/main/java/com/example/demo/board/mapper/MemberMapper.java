package com.example.demo.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.board.domain.MemberVO;

@Repository("com.example.demo.board.mapper.MemberMapper")
public interface MemberMapper {

	// 회원가입 작성
	public int join(MemberVO member) throws Exception;
	
	// 로그인
	public List<MemberVO> login(@Param("id") String id, @Param("pwd") String pwd);
	
	
}
