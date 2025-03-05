package com.min.edu.controller;

import com.min.edu.model.service.SimpleMailMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MailController {
	
	@Autowired
	private SimpleMailMessageService mailService;

//	// 이메일 전송 처리 메소드
//	@PostMapping("/sendEmail.do")
//	public String sendEmailTest(@RequestParam("email") String email,
//	                            @RequestParam("emailDomain") String emailDomain,
//	                            Model model) {
//	    // 이메일 도메인 결합
//	    String fullEmail = email + "@" + emailDomain;
//	    
//	    try {
//	        // 이메일 전송
//	        mailService.sendEmail(fullEmail);
//	        model.addAttribute("message", "이메일을 전송했습니다. 이메일을 확인하세요.");
//	    } catch (Exception e) {
//	        model.addAttribute("message", "이메일 전송 실패: " + e.getMessage());
//	    }
//	    
//	    return "result";  // 결과를 보여줄 JSP 페이지 (결과 페이지로 이동)
//	}
}
