package com.min.edu.controller;

import java.io.IOException;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.min.edu.dto.EmployeeDto;
import com.min.edu.model.service.IEmployeeService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class LoginController {
	  private final IEmployeeService service;
	    
	   

	    // ------ 로그인 폼 -----
	    @GetMapping(value = "/")
	    public String loginForm() {
	        log.info("EmployeeController loginForm 로그인화면 이동");
	        return "loginForm";
	    }

	    // ------ 로그인 -----
	    @PostMapping(value = "/login.do")
	    public String login(@RequestParam Map<String, Object> map, HttpSession session, HttpServletResponse response) throws IOException {
	        log.info("EmployeeController login 로그인 : {}", map);

	        response.setContentType("text/html; charset=UTF-8;");

	        EmployeeDto loginVo = service.getLogin(map);
	        log.info("로그인 정보 : {}", loginVo);

	        if (loginVo != null) {
	            session.setAttribute("loginVo", loginVo);
	            session.setMaxInactiveInterval(60 * 10 * 5); // session 유효기간 설정 (5분)
	            log.info("{} 님 반갑습니다.", loginVo.getName());
	            response.getWriter().print("<script>alert('" + loginVo.getName() + "님 반갑습니다'); location.href='./homeList.do';</script>");
	        } else {
	            response.getWriter().print("<script>alert('로그인 정보가 없습니다.'); location.href='./loginform.do';</script>");
	        }
	        return null;
	    }
	    
	    
	    @GetMapping(value = "/logout.do")
		public String logout(HttpSession session, Model model) {
	    	
	    	  log.info("LoginController logout.do 요청");
	    	 EmployeeDto sessionVo = (EmployeeDto)session.getAttribute("loginVo");
	    	    
	    	    if(sessionVo != null) {
	    	        log.info("HttpSession은 삭제되기 전까지 유지된다. : {}", sessionVo);
	    	    } else {
	    	        log.info("세션에서 loginVo를 찾을 수 없습니다.");
	    	    }

	    	    session.removeAttribute("loginVo");
	    	    
	    	    // 세션에서 loginVo를 제거한 후 다시 가져옴 (null 확인)
	    	    EmployeeDto removedVo = (EmployeeDto)session.getAttribute("loginVo");
	    	    log.info("HttpSession에서 loginVo 제거 후 확인: {}", removedVo);  // null
			
			
			//return "redirect:/homeList.do"; //** 세션 지워지는 것 확인
			return "redirect:/";
			
			

	    }
}
