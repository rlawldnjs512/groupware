package com.min.edu.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.min.edu.dto.AttendanceDto;
import com.min.edu.dto.EmployeeDto;
import com.min.edu.dto.VacationDto;
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
		
		// 보상시간 조회
		int extraTime = vacationService.selectExtraTime(empId);
		
		model.addAttribute("lists", lists);
		model.addAttribute("extraTime", extraTime); // 조회된 보상시간 값
		
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
		
		// 출근시간 입력
		int result = attendanceService.insertAttendance(empId);
		
		if(result > 0) {
			log.info("출근 기록 저장 완료");
		} else {
			log.info("출근 기록 저장 실패");
		}
		
		// 방금 저장한 출근시간 가져오기
		String checkInDateStr = attendanceService.selectClockIn(empId);
		
		// 기준 출근 시간 (09시)
		Calendar cal = new GregorianCalendar();
		String checkOutDateStr = String.format("%d%02d%02d090000",
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
			
			if(checkInDate.after(checkOutDate)) { // 지각
				Map<String, Object> AttendtypeMap = new HashMap<>();
				AttendtypeMap.put("attendType", "지각");
				AttendtypeMap.put("empId", empId);
				
				attendanceService.updateAttendtype(AttendtypeMap);
			}
			
		} catch (ParseException e) {
			log.error("날짜 변환 오류", e);
		}
		
		return "redirect:attendanceListByEmpId";
	}
	
	@PostMapping(value = "/updateAttendance")
	public ResponseEntity<Map<String, Object>> updateAttendance(HttpSession session,
															    @RequestBody Map<String, String> infoAtten) {
		log.info("퇴근 버튼 클릭");
		log.info("퇴근 정보 확인 {}", infoAtten);
		
		EmployeeDto loginVo = (EmployeeDto)session.getAttribute("loginVo");
		String empId = loginVo.getEmp_id();
		
		// infoAtten 에서 exitHour와 useBonusTime 값을 가져오기
		String exitHour = infoAtten.get("exitHour");
		String useBonusTime = infoAtten.get("useBonusTime");
		
		// 퇴근시간 저장 (현재시간)
		int result = attendanceService.updateAttendance(empId);
		if(result > 0) {
			log.info("퇴근 기록 저장 완료");
		} else {
			log.info("퇴근 기록 저장 실패");
		}
		
		// 방금 저장한 퇴근 시간 가져오기
		String checkInDateStr = attendanceService.selectClockOut(empId);
		
		// 근무형태 가져오기 (지각인지 판단여부)
		String checkLate = attendanceService.selectAttendtype(empId);
		
		if(checkLate == null) {
			if(exitHour == "N") {
				if(useBonusTime == "Y") { // 보상시간 사용하여 퇴근
					calAttendance(empId);
					calculateExtraTime(empId, checkInDateStr);
				} else { // 조퇴
					calAttendance(empId);
					
					Map<String, Object> attendtypeMap = new HashMap<>();
					attendtypeMap.put("attendType", "조퇴");
					attendtypeMap.put("empId", empId);
					
					attendanceService.updateAttendtype(attendtypeMap);
				}
			} else { // 정상퇴근
				calAttendance(empId);
				calculateExtraTime(empId, checkInDateStr);
			}
		} else {
			calAttendance(empId);
		}
		
		Map<String, Object> response = new HashMap<String, Object>();
		response.put("isc", Boolean.TRUE);
		
		return ResponseEntity.ok(response);
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
