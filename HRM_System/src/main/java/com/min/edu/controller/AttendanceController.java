package com.min.edu.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.min.edu.dto.AttendanceDto;
import com.min.edu.dto.EmployeeDto;
import com.min.edu.model.service.IAttendanceService;
import com.min.edu.model.service.IVacationService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AttendanceController {

	private final IAttendanceService attendanceService;
	private final IVacationService vacationService;
	
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
	public String updateAttendance(HttpSession session, Model model) {
		log.info("퇴근 버튼 클릭");
		
		EmployeeDto loginVo = (EmployeeDto)session.getAttribute("loginVo");
		
		if (loginVo == null) {
			log.info("로그인 정보 없음.");
			return "redirect:/loginForm";
		}
		
		String empId = loginVo.getEmp_id();
		
		// 퇴근시간 저장 (현재시간)
		int result = attendanceService.updateAttendance(empId);
		if(result > 0) {
			log.info("퇴근 기록 저장 완료");
		} else {
			log.info("퇴근 기록 저장 실패");
		}
		
		// 방금 저장한 퇴근 시간 가져오기
		String checkInDateStr = attendanceService.selectClockOut(empId);
		
		// 근무시간 계산 메소드 실행
		calAttendance(empId);
		
		// 보상시간 계산 메소드 실행
		calculateExtraTime(empId, checkInDateStr);
		
		// 보상시간 조회 & model에 전달하여 JSP에서 사용할 수 있도록 함
		int extraTime = vacationService.selectExtraTime(empId);
		model.addAttribute("extraTime", extraTime);
		
		return "redirect:attendanceListByEmpId";
	}
	
	// 근무시간 계산 메소드
	private void calAttendance(String empId) {
		int result = attendanceService.calAttendance(empId);
		
		if(result > 0) {
			log.info("근무 시간 계산 완료");
		} else {
			log.info("근무 시간 계산 실패");
		}
	}
	
	// 보상시간 계산 메소드
	private void calculateExtraTime(String empId, String checkInDateStr) {
		log.info("보상시간 계산 시작");
		
		// 기준 퇴근 시간 (18시)
		Calendar cal = new GregorianCalendar();
		String checkOutDateStr = String.format("%d%02d%02d180000",
			cal.get(Calendar.YEAR),
			cal.get(Calendar.MONTH) + 1,
			cal.get(Calendar.DATE)
		);
		
		// Date로 변환할 Format
		SimpleDateFormat dbFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat customFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		
		try {
			Date checkInDate = dbFormat.parse(checkInDateStr);
			Date checkOutDate = customFormat.parse(checkOutDateStr);
			
			// 차이값을 시간 단위로 변경
			int diffHour = (int)(checkInDate.getTime() - checkOutDate.getTime())/(60*60*1000); // 60초*60분*밀리세컨드
			log.info("퇴근 시간 차이 : {}", diffHour);
			
			// 보상시간 로직
			if(checkInDate.after(checkOutDate)) { // 야근 및 정상근무
				Map<String, Object> ExtraTimeMap = new HashMap<>();
				ExtraTimeMap.put("extraTime", diffHour);
				ExtraTimeMap.put("empId", empId);
				
				Map<String, Object> AttendtypeMap = new HashMap<>();
				AttendtypeMap.put("attendType", "정상근무");
				AttendtypeMap.put("empId", empId);
				
				vacationService.updateExtraTime(ExtraTimeMap);
				attendanceService.updateAttendtype(AttendtypeMap);
			} else { // 18시보다 일찍 퇴근했을 때
				
				diffHour--;
				int bonus = vacationService.selectExtraTime(empId);
				log.info("보유한 보상시간 : {}", bonus);
				
				if((-1)*diffHour <= bonus) { // 보상시간을 사용할 수 있을 때
					log.info("사용한 보상시간 : {}", diffHour);
					
					Map<String, Object> extraTimeMap = new HashMap<>();
					extraTimeMap.put("empId", empId);
					extraTimeMap.put("extraTime", diffHour);
					
					vacationService.updateExtraTime(extraTimeMap);
					
					Map<String, Object> useExtraTimeMap = new HashMap<>();
					useExtraTimeMap.put("empId", empId);
					useExtraTimeMap.put("useExtraTime", (-1)*diffHour);
					
					attendanceService.updateUseExtraTime(useExtraTimeMap);
					
					int useBonus = vacationService.selectExtraTime(empId);
					log.info("남은 보상시간 : {}", useBonus);
					
					Map<String, Object> attendtypeMap = new HashMap<>();
					attendtypeMap.put("attendType", "정상근무");
					attendtypeMap.put("empId", empId);
					
					attendanceService.updateAttendtype(attendtypeMap);
				} else {
					log.info("보유한 보상시간 부족, 조퇴처리");
					
					Map<String, Object> attendtypeMap = new HashMap<>();
					attendtypeMap.put("attendType", "조퇴");
					attendtypeMap.put("empId", empId);
					
					attendanceService.updateAttendtype(attendtypeMap);
				}
			}
			
		} catch (ParseException e) {
			log.error("날짜 변환 오류", e);
		}
	}
	
	
}
