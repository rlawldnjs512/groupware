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
	        
	        model.addAttribute("emailExists", true); 
	        model.addAttribute("authKey",authKey);
	        model.addAttribute("alertMessage", "메일을 확인해 주세요");
	        model.addAttribute("alertType", "success"); 
	    } catch (MessagingException e) {
	        
	    	 model.addAttribute("alertMessage", "오류");
		     model.addAttribute("alertType", "error"); 
	    }
	    
	    return "forgot";
	}

	}

    




