package com.min.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.min.edu.model.service.ICertificateService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BlogController {

	@GetMapping(value = "/blog.do")
	public String blog_move() {
		return "blog";
	}
	
	@GetMapping(value = "/notice.do")
	public String noticeBlog_move() {
		return "notice";
	}
	
	
	
	@GetMapping(value = "/free.do")
	public String freeBlog_move() {
		return "free";
	}
	
}
