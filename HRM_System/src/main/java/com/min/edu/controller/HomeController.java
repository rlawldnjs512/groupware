package com.min.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class HomeController {

	@GetMapping(value = "/homeList.do")
	public String homeList(Model model, HttpServletResponse response) {
		log.info("EmployeeController homeList GET 요청");

		// 캐시 삭제 코드 작성
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Expires", "0");

		return "homeList";
	}
}








