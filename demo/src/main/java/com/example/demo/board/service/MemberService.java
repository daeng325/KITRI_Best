package com.example.demo.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.board.domain.MemberVO;
import com.example.demo.board.mapper.MemberMapper;

@Service("com.example.demo.board.service.MemberService")
public class MemberService {
	
	@Autowired
	SqlSession sqlsession;
	
	@Resource(name="com.example.demo.board.mapper.MemberMapper")
	MemberMapper memberMapper;
	
    public int memberInsertService(MemberVO member) throws Exception{
        return memberMapper.join(member);
        }
	
	public List<MemberVO> login(String id, String pwd) {
		return memberMapper.login(id, pwd);
		
	}
    
}
