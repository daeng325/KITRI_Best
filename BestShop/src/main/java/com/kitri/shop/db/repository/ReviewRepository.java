package com.kitri.shop.db.repository;

import org.springframework.data.repository.CrudRepository;

import com.kitri.shop.db.domain.Review;

public interface ReviewRepository extends CrudRepository<Review, Long>{

}
