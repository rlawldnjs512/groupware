package com.min.edu.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.min.edu.dto.EmployeeDto;
import com.min.edu.dto.FreeboardDto;
import com.min.edu.dto.NoticeboardDto;
import com.min.edu.model.service.IBoardService;
import com.min.edu.model.service.ICertificateService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BlogController {

	private final IBoardService service;
	
	@GetMapping(value = "/notice.do")
	public String noticeBlog(Model model, HttpSession session) {

		List<NoticeboardDto> lists = service.selectNotice();
		System.out.println("Lists size: " + lists.size());
		model.addAttribute("lists", lists);

		return "notice";
	}
	
	@GetMapping(value = "/newNotice.do")
	public String noticeBlog_new() {
		return "newNotice";
	}
	
	@PostMapping(value = "/submitNotice.do")
	public String noticeBlog_insert(Model model, HttpSession session,
									RedirectAttributes redirectAttributes,
									@RequestParam("title") String title,
									@RequestParam("content") String content,
									@RequestParam("expired") String expired) {
		
		EmployeeDto loginVo = (EmployeeDto) session.getAttribute("loginVo");

		if (loginVo == null) {
			redirectAttributes.addFlashAttribute("errorMessage", "로그인이 필요합니다.");
			return "redirect:/login";
		}
		
		NoticeboardDto dto = NoticeboardDto.builder()
							.title(title)
							.content(content)
							.expired(expired)
							.build();
		
		int result = service.insertNotice(dto);
		
		
		
		
		return "redirect:/notice.do";
	}
	
//	-------------- 공지사항 end --------------
	
	
//	-------------- 커뮤니티 end --------------
	
	
	@GetMapping(value = "/free.do")
	public String freeBlog_move(Model model, HttpSession session) {
		
		List<FreeboardDto> lists = service.selectFree();
		System.out.println("Lists size: " + lists.size());
		model.addAttribute("lists", lists);
		
		return "free";
	}
	
	@GetMapping(value = "/newFree.do")
	public String FreeBlog_new() {
		return "newFree";
	}
	
	@PostMapping(value = "/newFree.do")
	public String FreeBlog_insert() {
		return "redirect:/free.do";
	}
	
}
