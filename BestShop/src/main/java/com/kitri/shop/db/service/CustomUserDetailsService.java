package com.kitri.shop.db.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kitri.shop.db.domain.SecurityMember;
import com.kitri.shop.db.repository.MemberRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired
	MemberRepository memRepo;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		return
				memRepo.findById(id)
				.filter(m -> m != null)
				.map(m -> new SecurityMember(m)).get();
	}

}