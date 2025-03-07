package com.min.edu.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.min.edu.dto.EmployeeDto;
import com.min.edu.model.service.IAttendanceService;
import com.min.edu.model.service.IEmployeeService;
import com.min.edu.model.service.IVacationService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class HomeController {
	
	private final IEmployeeService employeeService;
	private final IAttendanceService attendanceService;
	private final IVacationService vacationService;

	@GetMapping(value = "/homeList.do")
	public String homeList(Model model, HttpServletResponse response, HttpSession session) {
		log.info("EmployeeController homeList GET 요청");

		// 캐시 삭제 코드 작성
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Expires", "0");
		
		// 세션에서 로그인 정보 가져오기
	    EmployeeDto loginVo = (EmployeeDto)session.getAttribute("loginVo");
	    String empId = loginVo.getEmp_id();
	    String empName = loginVo.getName();
	    String deptName = employeeService.selectDeptName(empId);
	    String profileImg = employeeService.selectProfileImg(empId);
	    
	    model.addAttribute("empName", empName);
	    model.addAttribute("deptName", deptName);
	    model.addAttribute("profileImg", profileImg);
	    
	    // 출근 여부 확인
	    boolean isClockedIn = attendanceService.checkAttendance(empId);
	    model.addAttribute("isClockedIn", isClockedIn);
	    
	    // 보상시간 조회
 		int extraTime = vacationService.selectExtraTime(empId);
 		model.addAttribute("extraTime", extraTime);
 		
 		// 지각여부 조회
 		String attendType = attendanceService.selectAttendtype(empId);
 		model.addAttribute("attendType", attendType);
 		
 		// 출퇴근 시간 출력
 		Map<String, String> clockTimes = attendanceService.printClock(empId);
 		String clockIn = clockTimes.get("clockIn");
 		String clockOut = clockTimes.get("clockOut");
 		model.addAttribute("clockIn", clockIn);
 		model.addAttribute("clockOut", clockOut);
 		
 		// 근무 진행률
 		if(clockIn != null) {
 			int progress = (int)attendanceService.calProgress(empId, clockIn);
 	 		model.addAttribute("progress", progress);
 		}

		return "homeList";
	}
}








