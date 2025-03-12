package com.min.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.min.edu.dto.EmployeeDto;
import com.min.edu.dto.VacationDto;
import com.min.edu.model.service.ILeaveService;
import com.min.edu.model.service.IVacationService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class VacationController {

	private final IVacationService vacationService;
	private final ILeaveService leaveService;

//	@GetMapping(value = "/vacation")
//	public String vacationList(Model model) {
//		log.info("사원들의 연차목록 조회");
//		List<VacationDto> lists = vacationService.vacationList();
//		model.addAttribute("lists", lists);
//		return "vacation";
//	}
	
	@GetMapping(value = "/vacation")
	public String vacationListByEmpId(HttpSession session, Model model) {
		
		EmployeeDto loginVo = (EmployeeDto)session.getAttribute("loginVo");
		String empId = loginVo.getEmp_id();
		
		Map<String, Object> vacationMap = vacationService.vacationListByEmpId(empId);
		List<Map<String, Object>> leaveList = leaveService.leaveListByEmpId(empId);
		
		model.addAttribute("vacationMap", vacationMap);
		model.addAttribute("leaveList", leaveList);
		
		
//		List<Map<String, Object>> vacationList = vacationService.vacationListByEmpId(empId);
//		if(!vacationList.isEmpty()) {
//			Map<String, Object> vacationInfo = vacationList.get(0);
//			model.addAttribute("vacationInfo", vacationInfo);
//		}
		
		return "vacation";
	}
	
	

	@PostMapping(value = "/insertVacation") 
	public String insertVacation(@RequestParam("leaveId") String leaveId,
								 @RequestParam("empId") String empId,
								 @RequestParam("startDate") String startDate,
								 @RequestParam("endDate") String endDate,
								 @RequestParam("leaveTotal") String leaveTotal,
								 @RequestParam("leaveUse") String leaveUse,
								 @RequestParam("leaveRemain") String leaveRemain) {
		
		log.info("{} 사원에게 연차 부여", empId);
		
		Map<String, Object> map = new HashMap<>();
		map.put("leaveId", leaveId);
		map.put("empId", empId);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		// String -> double 변환
		map.put("leaveTotal", Double.parseDouble(leaveTotal));
		map.put("leaveUse", Double.parseDouble(leaveUse));
		map.put("leaveRemain", Double.parseDouble(leaveRemain));
		
		vacationService.insertVacation(map);
		
		return "redirect:/vacationList"; 
	}
	 

}
