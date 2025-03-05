package com.min.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.min.edu.dto.CertificateDto;
import com.min.edu.dto.EmployeeDto;
import com.min.edu.model.service.ICertificateService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CertificationController {

	private final ICertificateService service;
	
//	@GetMapping(value = "/mypage.do")
//	public String mypage_cert_move() {
//		return "mypage";
//	}
	
	@GetMapping(value = "/certification.do")
	public String cert_move() {
		return "certification";
	}
	
	@PostMapping(value = "/select.do")
	public String certSelect(Model model, HttpSession session, @RequestParam("type") String type) {
	    EmployeeDto loginVo = (EmployeeDto) session.getAttribute("loginVo");

	    if (loginVo != null) {
	        String emp_id = loginVo.getEmp_id();
	        System.out.println("empId from session: " + emp_id);

	        Map<String, Object> map = new HashMap<String, Object>();
	        map.put("emp_id", emp_id);
	        map.put("type", type);

	        // selectCertTypeUser 결과 확인
	        List<CertificateDto> lists = service.selectCertTypeUser(map);
	        System.out.println("Lists size: " + (lists == null ? 0 : lists.size()));  // 리스트의 크기 출력
	        
	        model.addAttribute("lists", lists);
	    } else {
	        model.addAttribute("error", "로그인이 필요합니다.");
	    }

	    return "certification";
	}
	
	@GetMapping(value = "/pdf.do")
	public String pdf() {
		return "pdf_Home";
	}

	
	
	
}
