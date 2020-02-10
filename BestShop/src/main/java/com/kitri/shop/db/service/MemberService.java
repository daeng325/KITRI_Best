package com.kitri.shop.db.service;

import java.util.Arrays;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kitri.shop.db.domain.Member;
import com.kitri.shop.db.domain.MemberRole;
import com.kitri.shop.db.domain.SecurityMember;
import com.kitri.shop.db.repository.MemberRepository;

@Service
public class MemberService {
	@Autowired
	MemberRepository memRepo;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	public Optional<Member> findByUid(String uid) throws Exception{
		return memRepo.findById(uid);
	}
	
	public boolean checkPwd(String id, String pre_pwd) throws Exception{
		if(passwordEncoder.matches(pre_pwd, memRepo.checkPassword(id))) {
			return true;
		}
		return false;
	}
	
	public boolean insertMember(Member member) throws Exception{
		boolean isValidPassword = verifyPwd(member.getPwd());
		
		if( isValidPassword ) {
			MemberRole role = new MemberRole();
			member.setPwd(passwordEncoder.encode(member.getPwd()));
			role.setRoleName("BASIC");
			member.setRoles(Arrays.asList(role));
			memRepo.save(member);
			return true;
		} else {
			return false;
		}
	}
	
	public boolean verifyPwd(String password) {
		/*
		 * 하나 이상의 알파벳
		 * 하나 이상의 숫자
		 * 하나 이상의 특수문자
		 * 8글자 이상
		 */
		String passwordPolicy = "((?=.*[a-z])(?=.*[0-9])(?=.*[^a-zA-Z0-9가-힣]).{8,})";
		Pattern pattern = Pattern.compile(passwordPolicy);
		Matcher matcher = pattern.matcher(password);
		return matcher.matches();
	}
	
	public boolean verifyPhone(String phone) {
		return true;
	}
	
	public void updateMember(Member member) throws Exception{
		member.setPwd(passwordEncoder.encode(member.getPwd()));
    	memRepo.updateMember(member);
	}
	
	public String deleteMember(SecurityMember secMember, String pwd) throws Exception{
		if(passwordEncoder.matches(pwd, memRepo.checkPassword(secMember.getUsername()))) {
			memRepo.deleteById(secMember.getUsername());
			return "Deleted";
		}
		else {
			return "Wrong Password";
		}
	}
}
