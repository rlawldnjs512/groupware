package com.min.edu.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.min.edu.dto.ApprovalDto;
import com.min.edu.dto.DocumentDto;
import com.min.edu.dto.EmployeeDto;
import com.min.edu.dto.FileUpDto;
import com.min.edu.dto.LeaveDto;
import com.min.edu.dto.SignDto;
import com.min.edu.dto.TripDto;
import com.min.edu.model.mapper.IEmployeeDao;
import com.min.edu.model.service.IApprovalService;
import com.min.edu.model.service.IEmployeeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ApprovalFormController {
	
	private final IApprovalService approvalService;


	// 휴가 결재하기--------------------------------------------------
	@GetMapping(value = "/vacationForm.do")
	public String vacation_form(Model model, HttpSession session) {
		
		EmployeeDto loginVo = (EmployeeDto) session.getAttribute("loginVo");
		String ename = loginVo.getName();
		
		return "vacationApproval";
	}
	
	@PostMapping(value = "/TempLeave.do")
	public String vacation_temp(Model model, HttpSession session,
								@RequestParam("title") String title,
								@RequestParam("content") String content,
								@RequestParam("leave_start") String leave_start,
								@RequestParam("leave_end") String leave_end,
								@RequestParam("type") String type,
								HttpServletRequest request) throws ParseException {
		
		EmployeeDto loginVo = (EmployeeDto) session.getAttribute("loginVo");
		String name = loginVo.getName();
		
		DocumentDto dto = DocumentDto.builder()
				.name(name)
				.doc_type("휴가")
				.title(title)
				.content(content)
				.build();
	
		int resultTemp = approvalService.insertSaveDoc(dto);
		int doc_id = approvalService.getDocId();
		
		// SimpleDateFormat을 사용하여 문자열을 Date로 변환
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = sdf.parse(leave_start);
        Date endDate = sdf.parse(leave_end);

        // 두 날짜의 차이 계산 (밀리초 기준)
        long diffInMillies = endDate.getTime() - startDate.getTime();
        int leave_days = (int) TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
		
		LeaveDto leaveDto = LeaveDto.builder()
				.doc_id(doc_id)
				.leave_start(leave_start)
				.leave_end(leave_end)
				.type(type)
				.leave_days(leave_days)
				.build();
		
		int resultLeave = approvalService.insertSaveLeave(leaveDto);
		
		session.setAttribute("doc_id", doc_id);		
		
		return "redirect:/approval.do";
		
	}
	
	@PostMapping(value = "/submitVacation.do")
	public String submitVacation(@RequestParam List<String> lineEmp_id) {
		System.out.println(lineEmp_id);
		
		return "redirect:/approval";
	}
	

	
	
	
	// 출장 결재하기--------------------------------------------------
	@GetMapping(value = "/tripForm.do")
	public String trip_form() {
		return "tripApproval";
	}
	
	@PostMapping(value = "/TempTrip.do")
	public String trip_temp(Model model, HttpSession session,
							@RequestParam("title") String title,
							@RequestParam("content") String content,
							@RequestParam("trip_start") String trip_start,
							@RequestParam("trip_end") String trip_end,
							@RequestParam("destination") String destination,
							HttpServletRequest request) {
		
		EmployeeDto loginVo = (EmployeeDto) session.getAttribute("loginVo");
		String name = loginVo.getName();
		
		DocumentDto dto = DocumentDto.builder()
				.name(name)
				.doc_type("출장")
				.title(title)
				.content(content)
				.build();
	
		int resultTemp = approvalService.insertSaveDoc(dto);
		int doc_id = approvalService.getDocId();
		
		TripDto tripDto = TripDto.builder()
				.doc_id(doc_id)
				.trip_start(trip_start)
				.trip_end(trip_end)
				.destination(destination)
				.build();
		
		int resultTrip = approvalService.insertSaveTrip(tripDto);
		
		session.setAttribute("doc_id", doc_id);		
		
		return "redirect:/approval.do";
	}
	
	// 보고서 결재하기--------------------------------------------------
	
	@GetMapping(value = "/reportForm.do")
	public String report_form() {
		return "reportApproval";
	}
	
	@PostMapping(value = "/TempReport.do")
	public String report_temp(Model model, HttpSession session,
								@RequestParam("title") String title,
								@RequestParam("content") String content,
								@RequestParam(value = "file", required = false) MultipartFile file,
								HttpServletRequest request) {
		
		EmployeeDto loginVo = (EmployeeDto) session.getAttribute("loginVo");
		String name = loginVo.getName();
		
		DocumentDto dto = DocumentDto.builder()
					.name(name)
					.doc_type("보고서")
					.title(title)
					.content(content)
					.build();
		
		int resultTemp = approvalService.insertSaveDoc(dto);
		int doc_id = approvalService.getDocId();
		
		if(file != null && !file.isEmpty()) {
			try {
				
				String uploadDir = request.getSession().getServletContext().getRealPath("fileup");
	            File uploadFolder = new File(uploadDir);
	            
	            if(!uploadFolder.exists()) {
	            	uploadFolder.mkdirs();
	            }
	            
	            String origin_name = file.getOriginalFilename();
	            String store_name = System.currentTimeMillis() + "_" + origin_name;
	            String file_path = uploadDir + File.separator + store_name;

	            File dest = new File(file_path);
	            file.transferTo(dest);

	            int size = (int) file.getSize();
	            
	            int resultTempFile = approvalService.insertTempFile(FileUpDto.builder()
					            		.doc_id(doc_id)
					            		.origin_name(origin_name)
					            		.store_name(store_name)
					            		.size(size)
					            		.file_path(file_path)
					            		.build());
	            
	            approvalService.updateTempFileExist(doc_id);
	            
	            model.addAttribute("origin_name", origin_name);
	            model.addAttribute("store_name", store_name);
	            model.addAttribute("file_path", file_path);
	            
			} catch (Exception e) {
				return "approval";
			}
		}
		
		session.setAttribute("doc_id", doc_id);		
		
		return "approval";
	}
	
	@PostMapping(value = "/approvalReport.do")
	public String report_approval(Model model,
								  HttpSession session,
								  HttpServletRequest request,
								  @RequestParam("title") String title,
								  @RequestParam("content") String content,
								  @RequestParam(value = "file", required = false) MultipartFile file) {
		
		
		
		return "redirect:/approval.do";
	}
	
	// 결재선--------------------------------------------------
	@GetMapping(value = "/tree.do")
	public String tree() {
		return "tree";
	}
	
	public String getMethodName(@RequestParam String param) {
		return new String();
	}
	
}
