package com.example.demo.board.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.example.demo.board.service.ReviewService;

@Controller
public class ReviewController {
	@Resource
	ReviewService reviewService;

}
