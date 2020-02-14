package com.kitri.shop.db.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.kitri.shop.db.domain.Review;

public interface ReviewRepository extends CrudRepository<Review, Long>{

	@Query("SELECT r FROM Review r")
	List<Review> selectAllReviews();
	
	@Query("SELECT r FROM Review r WHERE o_id = ?1")
	Review selectReviewByOid(long oid);

	@Query("SELECT r FROM Review r WHERE id = ?1")
	Review selectReviewByRid(Long id);
	
}
