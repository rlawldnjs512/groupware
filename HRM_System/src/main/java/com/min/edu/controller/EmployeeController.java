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

@Controller
@Slf4j
@RequiredArgsConstructor
public class EmployeeController {

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










