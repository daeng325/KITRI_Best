package com.kitri.shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.kitri.shop.db.dto.Member;

public interface MemberRepository extends CrudRepository<Member, String>{

	@Query(value="select * from members where id = ?1 and pwd = ?2", nativeQuery=true)	
	public Member checkIdPwd(String id, String pwd);
}
