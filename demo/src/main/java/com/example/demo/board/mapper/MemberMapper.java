package com.example.demo.board.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.board.domain.MemberVO;

@Repository("com.example.demo.board.mapper.MemberMapper")
public interface MemberMapper {

	// 회원가입 작성
	public int join(MemberVO member) throws Exception;
	
	// 로그인
	public List<MemberVO> login(@Param("id") String id, @Param("pwd") String pwd);
	
	// 자동로그인 체크한 경우 사용자 테이블에 세션과 유효시간을 저장
	public void keepLogin(String id, String sessionId, Date next);
	
	// 이전에 로그인한 적 있는지, 유효시간이 넘지 않은 세션을 가지고 있는지 확인
	public MemberVO checkUserWithSessionKey(String sessionId);
	
	// 유저 정보 수정
	public void selfuseredit(MemberVO member);
	
	// 회원 탈퇴
	public void selfuserout (@Param("id") String id);
}
