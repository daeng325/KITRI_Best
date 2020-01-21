package com.kitri.shop.repository;

import org.springframework.data.repository.CrudRepository;

import com.kitri.shop.db.dto.Member;

public interface MemberRepository extends CrudRepository<Member, String>{

}
