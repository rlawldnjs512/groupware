package com.min.edu.controller;

import com.min.edu.model.service.MailSendService;

import jakarta.mail.MessagingException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MailController {
	
	@Autowired
	private MailSendService mailSendService;

	@PostMapping(value = "/sendEmail.do")
	public String sendEmail(@RequestParam("email") String email, Model model) {
	    try {
	        // 인증 메일 전송
	        String authKey = mailSendService.sendAuthMail(email);
	        
	        model.addAttribute("emailExists", true);  // 인증번호 필드 보이도록 설정
	        model.addAttribute("authKey",authKey);
	        model.addAttribute("alertMessage", "메일을 확인해 주세요");
	        model.addAttribute("alertType", "success"); // 알림의 타입
	    } catch (MessagingException e) {
	        // 이메일 전송 실패 시 알림 메시지와 페이지 이동
	    	 model.addAttribute("alertMessage", "오류");
		     model.addAttribute("alertType", "error"); // 알림의 타입
	    }
	    
	    return "forgot";
	}

	}

    




