package com.kitri.shop;

import java.util.Arrays;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.kitri.shop.db.dto.Member;
import com.kitri.shop.db.dto.MemberRole;
import com.kitri.shop.db.repository.MemberRepository;

import lombok.extern.java.Log;

@RunWith(SpringRunner.class)
@SpringBootTest
@Log
public class MemberRepositoryTest {
	@Autowired
	MemberRepository memberRepository;
	
	@Test
	public void insertTest() {
		for(int i=0; i<10; i++) {
			Member member = new Member();
			member.setId("user" + i);
			member.setPwd("pw" + i);
			member.setEmail("hihi@" + i);
			MemberRole role = new MemberRole();
			if(i <= 8) {
				role.setRoleName("BASIC");
			}else if(i <= 9) {
				role.setRoleName("MANAGER");
			}else {
				role.setRoleName("ADMIN");
			}
			member.setRoles(Arrays.asList(role));
			memberRepository.save(member);
		}
	}
	
//	@Test
//	public void testMember() {
//		Optional<Member> result = Optional.ofNullable(memberRepository.findById("user1"));
//		result.ifPresent(member -> log.info("member " + member));
//	}
}
