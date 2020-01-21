package com.kitri.shop.db.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kitri.shop.db.dto.Member;
import com.kitri.shop.db.mapper.MemberMapper;

@Service("com.kitri.shop.db.service.MemberService")
public class MemberService {
	
	@Resource(name="com.kitri.shop.db.mapper.MemberMapper")
	MemberMapper memberMapper;
	
    public int memberInsertService(Member member) throws Exception{
        return memberMapper.signinInsert(member);
    }

}
