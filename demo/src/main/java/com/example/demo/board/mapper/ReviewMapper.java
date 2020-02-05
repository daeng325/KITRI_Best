package com.example.demo.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.board.domain.ReviewVO;

@Repository("com.example.demo.board.mapper.ReviewMapper")
public interface ReviewMapper {
	// Create
	public int upload(ReviewVO reviewVO) throws Exception;
	
	// Read
	public List<ReviewVO> read();
	
	// Update
	public int update(@Param("id") String id) throws Exception;
	
	// Delete
	public int delete(@Param("id") String id) throws Exception;	
		
	// Search
	public List<ReviewVO> search(@Param("name") String name);
	
	// review detail
	public ReviewVO printDetailReview(@Param("id") String id);
	
	public byte[] imagePrint(String id);
}