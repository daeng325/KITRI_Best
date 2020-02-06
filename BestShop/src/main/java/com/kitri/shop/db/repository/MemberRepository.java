package com.kitri.shop.db.repository;

import org.springframework.data.repository.CrudRepository;

import com.kitri.shop.db.domain.Member;

public interface MemberRepository extends CrudRepository<Member, String>{

}
