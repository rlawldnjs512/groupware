package com.min.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CertificationController {

	@GetMapping(value = "/cert.do")
	public String cert_move() {
		
		return "certification";
	}
	
	
	
}
