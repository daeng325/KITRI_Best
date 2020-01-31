package com.example.demo.board.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.board.service.ReviewService;

@Controller
@RequestMapping(value="/review")
public class ReviewController {
	@Resource
	ReviewService reviewService;

	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public String viewUploadProduct() {
		return "reviewuploadform";
	}
}
