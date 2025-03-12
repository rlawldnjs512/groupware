package com.min.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.min.edu.dto.DocumentDto;
import com.min.edu.dto.EmployeeDto;
import com.min.edu.model.service.IApprovalService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ApprovalFormController {
	
	private final IApprovalService approvalService;


	@GetMapping(value = "/vacationForm.do")
	public String vacation_form(Model model, HttpSession session) {
		
		EmployeeDto loginVo = (EmployeeDto) session.getAttribute("loginVo");
		String ename = loginVo.getName();
		
		return "vacationApproval";
	}
	
	@GetMapping(value = "/vacationSave.do")
	public String vacation_save(Model model, HttpSession session,
			@RequestParam("title") String title,
			@RequestParam("content") String content) {
		
		EmployeeDto loginVo = (EmployeeDto) session.getAttribute("loginVo");

		String ename = loginVo.getName();
		
		DocumentDto vacationVo = DocumentDto.builder()
							.name(ename)
							.doc_type("휴가")
							.title(title)
							.content(content)
							.build();
		
		int result = approvalService.insertSaveDoc(vacationVo);
		
		String doc_num = approvalService.getDocNum(ename);
		
		vacationVo.setDoc_num(doc_num);
		session.setAttribute("doc_num", doc_num);
		
		return "redirect:/vacationApproval";
	}
	
	@PostMapping(value = "/submitVacation.do")
	public String submitVacation(@RequestParam List<String> lineEmp_id) {
		System.out.println(lineEmp_id);
		
		return "redirect:/approval";
	}
	
	
	@GetMapping(value = "/tripForm.do")
	public String trip_form() {
		return "tripApproval";
	}
	
	@GetMapping(value = "/reportForm.do")
	public String report_form() {
		return "reportApproval";
	}
	
	@GetMapping(value = "/tree.do")
	public String tree() {
		return "tree";
	}
	
	public String getMethodName(@RequestParam String param) {
		return new String();
	}
	
}
