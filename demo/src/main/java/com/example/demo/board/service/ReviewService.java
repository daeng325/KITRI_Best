package com.example.demo.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.example.demo.board.domain.ReviewVO;
import com.example.demo.board.mapper.ReviewMapper;

@Service("com.example.demo.board.service.ReviewService")
public class ReviewService {
	@Resource(name="com.example.demo.board.mapper.ReviewMapper")
	ReviewMapper reviewMapper;
	
	public int reviewInsert(ReviewVO reviewVO) throws Exception {
		return reviewMapper.upload(reviewVO);
	}
	
	public List<ReviewVO> readAllReview(){
		return reviewMapper.read();
	}
	
	// Update
	public int updateReview(String id) throws Exception{
		return reviewMapper.update(id);
	}
	
	// Delete
	public int deleteReview(String id) throws Exception{
		return reviewMapper.delete(id);
	}
		
	// Search
	public List<ReviewVO> searchReview(String name){
		return reviewMapper.search(name);
	}
	
	public ReviewVO printDetailReview(String id) {
		return reviewMapper.printDetailReview(id);
	}
	
	public byte[] imagePrint(String id) {
		return reviewMapper.imagePrint(id);
	}
}
