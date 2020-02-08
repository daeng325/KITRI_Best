package com.kitri.shop.db.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.kitri.shop.db.domain.Member;

public interface MemberRepository extends CrudRepository<Member, String> {

	@Modifying(clearAutomatically = true)
	@Transactional
	@Query("UPDATE Member SET name = :#{#member.name}, age = :#{#member.age}, "
			+ "phone = :#{#member.phone}, address = :#{#member.address}, email = :#{#member.email},"
			+ "pwd = :#{#member.pwd}, likeit = :#{#member.likeit}, agree = :#{#member.agree}, agree2 = :#{#member.agree2}"
			+ " WHERE id = :#{#member.id}")
	public int updateMember(@Param("member") Member member);
}
