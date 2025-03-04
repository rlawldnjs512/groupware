package com.min.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.min.edu.model.service.IApprovalService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ApprovalController {

	private final IApprovalService service;
	
	@GetMapping(value = "/approval.do")
	public String approval_move() {
		return "approval";
	}
	
	@GetMapping(value = "/approval_mine.do")
	public String approval_mine() {
		return "approval_mine";
	}
	
	@GetMapping(value = "/approval_store.do")
	public String approval_store() {
		return "approval_store";
	}
	
}
