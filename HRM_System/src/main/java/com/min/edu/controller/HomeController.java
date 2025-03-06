package com.min.edu.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.min.edu.dto.EmployeeDto;
import com.min.edu.model.service.IAttendanceService;
import com.min.edu.model.service.IVacationService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class HomeController {
	
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
	    EmployeeDto loginVo = (EmployeeDto) session.getAttribute("loginVo");
	    String empId = loginVo.getEmp_id();
	    
	    // 출근 여부 확인
	    boolean isClockedIn = attendanceService.checkAttendance(empId);
	    model.addAttribute("isClockedIn", isClockedIn);
	    
	    // 보상시간 조회
 		int extraTime = vacationService.selectExtraTime(empId);
 		model.addAttribute("extraTime", extraTime);
 		
 		// 출근시간 및 퇴근시간 조회
 		String clockIn = attendanceService.selectClockIn(empId);
 		String clockOut = attendanceService.selectClockOut(empId);
 		
 		SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 		SimpleDateFormat outputFormat = new SimpleDateFormat("HH:mm:ss");
 		
 		try {
 		    if (clockIn != null) {
 		        Date clockInDate = inputFormat.parse(clockIn);
 		        clockIn = outputFormat.format(clockInDate); // 시간 부분만 남김
 		    }

 		    if (clockOut != null) {
 		        Date clockOutDate = inputFormat.parse(clockOut);
 		        clockOut = outputFormat.format(clockOutDate); // 시간 부분만 남김
 		    }
 		} catch (ParseException e) {
 		    e.printStackTrace();
 		    clockIn = null;
 		    clockOut = null;
 		}
 		
 		model.addAttribute("clockIn", clockIn);
 		model.addAttribute("clockOut", clockOut);
	    
	    log.info("출근 여부 확인 : {}", isClockedIn);

		return "homeList";
	}
}








