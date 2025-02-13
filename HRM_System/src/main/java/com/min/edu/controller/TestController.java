package com.min.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
/*
 * Test Controller
 */
public class TestController {

   @GetMapping(value = "/")
   public String test() {
      log.info("TestController : test.jsp 호출하기");
      return "test";
   }
   
}
