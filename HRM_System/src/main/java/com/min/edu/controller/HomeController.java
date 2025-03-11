package com.min.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.min.edu.dto.EmpPageDto;
import com.min.edu.dto.EmployeeDto;
import com.min.edu.dto.FreeboardDto;
import com.min.edu.dto.NoticeboardDto;
import com.min.edu.model.service.IAttendanceService;
import com.min.edu.model.service.IBoardService;
import com.min.edu.model.service.IEmployeeService;
import com.min.edu.model.service.IVacationService;

import jakarta.servlet.http.HttpServletRequest;
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
	
	private final IBoardService boardService;
	
	@GetMapping(value = "/homeList.do")
	public String homeList(Model model, HttpServletResponse response, HttpSession session,
							HttpServletRequest req) {
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
 		
 		// ----------------- 게시판 시작 -------------------
 		
 	// 현재 페이지 가져오기 (기본값: 1)
 	    String pageParam = req.getParameter("page");
 	    int selectPage = (pageParam == null) ? 1 : Integer.parseInt(pageParam);

 	    // EmpPageDto 생성 및 설정
 	    EmpPageDto pageDto = new EmpPageDto();
 	    pageDto.setTotalCount(boardService.countNoticePage()); // 전체 공지사항 개수
 	    pageDto.setCountList(5); // 한 페이지에 표시될 글 개수
 	    pageDto.setCountPage(5); // 한 번에 표시될 페이지 개수
 	    pageDto.setTotalPage(pageDto.getTotalCount()); // 전체 페이지 수 계산
 	    pageDto.setPage(selectPage); // 현재 페이지 설정
 	    pageDto.setStagePage(pageDto.getPage()); // 페이지 그룹 시작 번호 계산
 	    pageDto.setEndPage(); // 페이지 그룹 끝 번호 계산

 	    // 페이징을 위한 first, last 설정
 	    int first = (pageDto.getPage() - 1) * pageDto.getCountList() + 1;
 	    int last = pageDto.getPage() * pageDto.getCountList();

 	    // Map을 사용하여 first, last 값을 담아 전달
 	    Map<String, Object> map = new HashMap<>();
 	    map.put("first", first);
 	    map.put("last", last);

 	    List<NoticeboardDto> noticeLists = boardService.selectNoticePage(map);
 	    model.addAttribute("noticeLists", noticeLists);

 	    List<FreeboardDto> freeLists = boardService.selectFreePage(map);
 	    model.addAttribute("freeLists", freeLists);

 	    model.addAttribute("page", pageDto);
		
		return "homeList";
	}
	
	
	
}








