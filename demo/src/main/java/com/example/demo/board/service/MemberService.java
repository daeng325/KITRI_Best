package com.example.demo.board.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.board.domain.MemberVO;
import com.example.demo.board.mapper.MemberMapper;

@Service("com.example.demo.board.service.MemberService")
public class MemberService {
	
	@Autowired
	SqlSessionTemplate sqlsession;
	
	@Resource(name="com.example.demo.board.mapper.MemberMapper")
	MemberMapper memberMapper;
	
    public int join(MemberVO member) throws Exception{
        return memberMapper.join(member);
        }
	
	public List<MemberVO> login(String id, String pwd) {
		return memberMapper.login(id, pwd);
		
	}
	/*
	public MemberVO login(MemberVO member) {
		// Mapper의 namespace명.id
		return sqlsession.selectOne("com.example.demo.board.mapper.MemberMapper",member);
	}
	*/
	
	// 자동 로그인 체크한 경우 사용자 테이블에 세션과 유효시간 저장
	public void keepLogin(String id, String sessionId, Date next) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("sessionId",sessionId);
		map.put("next", next);
		
		//memberMapper.keepLogin(id, sessionId, next);
		sqlsession.update("com.example.demo.board.mapper.MemberMapper.keepLogin",map);
	}
	
	
	// 이전에 로그인한 적 있는지, 유효시간이 넘지 않은 세션을 가지고 있는지 체크
	public MemberVO checkUserWithSessionKey(String sessionId) {
		
		// return memberMapper.checkUserWithSessionKey(sessionId);
		return sqlsession.selectOne("com.example.demo.board.mapper.MemberMapper.checkMeberWithSessionKey", sessionId);
	}
	
	// 개인정보 수정
	public void selfuseredit(MemberVO member) {
		memberMapper.selfuseredit(member);
	}
	
	// 회원 탈퇴
	public void selfuserout (String id) {
		memberMapper.selfuserout(id);
	}
    
}
