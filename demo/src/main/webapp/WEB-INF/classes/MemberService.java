package com.example.demo.board.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.demo.board.domain.MemberVO;
import com.example.demo.board.mapper.MemberMapper;

@Service("com.example.demo.board.service.MemberService")
public class MemberService {
	
	@Resource(name="com.example.demo.board.mapper.MemberMapper")
	MemberMapper memberMapper;
	
    public int memberInsertService(MemberVO member) throws Exception{
        return memberMapper.signinInsert(member);
        }
	
	
    
}
