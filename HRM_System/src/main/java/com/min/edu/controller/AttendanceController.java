package com.min.edu.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.min.edu.dto.AttendanceDto;
import com.min.edu.dto.EmployeeDto;
import com.min.edu.model.service.IAttendanceService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AttendanceController {

	private final IAttendanceService attendanceService;
	
	@GetMapping(value = "/attendanceListByEmpId")
	public String attendanceListByEmpId(HttpSession session, Model model) {
		EmployeeDto loginVo = (EmployeeDto)session.getAttribute("loginVo");
		
		if (loginVo == null) {
			log.info("로그인 정보 없음.");
			return "redirect:/loginForm";
		}
		
		String empId = loginVo.getEmp_id();
		List<AttendanceDto> lists = attendanceService.attendanceListByEmpId(empId);
		
		log.info("조회된 데이터 : {}", lists);
		
		model.addAttribute("lists", lists);
		
		return "attendanceListByEmpId";
	}
	
	@PostMapping(value = "/insertAttendance")
	public String insertAttendance(HttpSession session) {
		log.info("출근 버튼 클릭");
		
		EmployeeDto loginVo = (EmployeeDto)session.getAttribute("loginVo");
		
		if (loginVo == null) {
			log.info("로그인 정보 없음.");
			return "redirect:/loginForm";
		}
		
		String empId = loginVo.getEmp_id();
		
		int result = attendanceService.insertAttendance(empId);
		
		if(result > 0) {
			log.info("출근 기록 저장 완료");
		} else {
			log.info("출근 기록 저장 실패");
		}
		
		return "redirect:attendanceListByEmpId";
	}
	
	@PostMapping(value = "/updateAttendance")
	public String updateAttendance(HttpSession session) {
		log.info("퇴근 버튼 클릭");
		
		EmployeeDto loginVo = (EmployeeDto)session.getAttribute("loginVo");
		
		if (loginVo == null) {
			log.info("로그인 정보 없음.");
			return "redirect:/loginForm";
		}
		
		String empId = loginVo.getEmp_id();
		
		int result = attendanceService.updateAttendance(empId);
		
		if(result > 0) {
			log.info("퇴근 기록 저장 완료");
		} else {
			log.info("퇴근 기록 저장 실패");
		}
		
		return "redirect:attendanceListByEmpId";
	}
	
	// 배치 프로그램을 통해 하루에 한번씩 자동으로 계산되도록 만들 수 있을까?
	@PostMapping(value = "/calAttendance")
	public String calAttendance(HttpSession session) {
		log.info("근무 시간 계산");
		
		EmployeeDto loginVo = (EmployeeDto)session.getAttribute("loginVo");
		
		if (loginVo == null) {
			log.info("로그인 정보 없음.");
			return "redirect:/loginForm";
		}
		
		String empId = loginVo.getEmp_id();
		
		int result = attendanceService.calAttendance(empId);
		
		if(result > 0) {
			log.info("근무 시간 계산 완료");
		} else {
			log.info("근무 시간 계산 실패");
		}
		
		return "redirect:attendanceListByEmpId";
	}
	
}
