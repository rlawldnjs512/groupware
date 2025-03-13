package com.min.edu.controller;

import java.sql.Clob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.rowset.serial.SerialClob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.min.edu.dto.ApprovalDto;
import com.min.edu.dto.DocumentDto;
import com.min.edu.dto.EmployeeDto;
import com.min.edu.dto.FileUpDto;
import com.min.edu.dto.LeaveDto;
import com.min.edu.dto.SignDto;
import com.min.edu.dto.TripDto;
import com.min.edu.model.service.IApprovalService;
import com.min.edu.model.service.ILeaveService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ApprovalController {

	private final IApprovalService service;
	
	private final ILeaveService leaveService;
	
	@GetMapping(value = "/approval.do")
	public String approval_move() {
		return "approval";
	}
	
	// 결재문서 결재 대기함------------------------------------------------------------
	@GetMapping(value = "/approval_pending.do")
	public String approval_pending() {
		return "approval_pending";
	}
	
	// 결재문서 결재 수신함------------------------------------------------------------
	@GetMapping(value = "/approval_receive.do")
	public String approval_receive() {
		return "approval_receive";
	}
	
	// 결재문서 내 결재함------------------------------------------------------------
	@GetMapping(value = "/approval_mine.do")
	public String approval_mine() {
		return "approval_mine";
	}
	
	// 결재문서 임시 저장함------------------------------------------------------------
	@GetMapping(value = "/temp_store.do")
	public String approval_store(Model model,
								HttpSession session,
								HttpServletRequest request) {
		
		EmployeeDto loginVo = (EmployeeDto) session.getAttribute("loginVo");
		String name = loginVo.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		
		List<ApprovalDto> lists = service.selectPreviewDoc(map);
		
		model.addAttribute("lists",lists);
		
		return "temp_store";
	}
	
	@GetMapping(value = "/continueTemp.do")
	public String temp_Reportcontinue(@RequestParam("doc_id") int docId, 
									  @RequestParam("doc_type") String doc_type,
									  Model model, 
									  HttpSession session) {
		
		EmployeeDto loginVo = (EmployeeDto) session.getAttribute("loginVo");
		String name = loginVo.getName();
		String empId = loginVo.getEmp_id();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("doc_id", docId);
		
		// 공통 문서 
		List<ApprovalDto> reportDto = service.continuePreviewDoc(map);
		System.out.println(reportDto);
		
		// 출장
		TripDto tripDto = service.continuePrviewTrip(docId);
		System.out.println(tripDto);
		
		// 휴가
//		List<Map<String, Object>> leaveDto = leaveService.leaveListByEmpId(empId);
//		System.out.println(leaveDto);
		
		model.addAttribute("reportDto",reportDto);
		model.addAttribute("tripDto",tripDto);
//		model.addAttribute("leaveDto",leaveDto);
		
		if(doc_type.trim().equals("보고서")) {
			return "continueReport";
		} else if(doc_type.trim().equals("출장")) {
			return "continueTrip";
		} else {
			return "continueLeave";
		}
	}
	
	@GetMapping(value = "/deleteTemp.do")
	public String temp_delete(@RequestParam("doc_id") int docId, 
							  @RequestParam("doc_type") String doc_type,
							  Model model, 
							  HttpSession session) {
		
		EmployeeDto loginVo = (EmployeeDto) session.getAttribute("loginVo");
		String name = loginVo.getName();
		
		DocumentDto dto = DocumentDto.builder()
					.doc_id(docId)
					.name(name)
					.build();
		
		if(doc_type.trim().equals("출장")) {
			int resultTrip = service.deleteSaveTrip(docId);
			int resultDoc = service.deleteSaveDoc(dto);
		} else if(doc_type.trim().equals("휴가")) {
			int resultLeave = service.deleteSaveLeave(docId);
			int resultDoc = service.deleteSaveDoc(dto);
		} else if(doc_type.trim().equals("보고서")) {
			int resultDoc = service.deleteSaveDoc(dto);
		}
		
		return "redirect:/temp_store.do";
	}
	
	// 결재문서 부서 문서함------------------------------------------------------------
	@GetMapping(value = "/dept_store.do")
	public String dept_store() {
		return "dept_store";
	}
	
	// 서명------------------------------------------------------------
	@GetMapping(value = "/signature_manage.do")
	public String signature_manage() {
		return "signature_manage";
	}
	
	@PostMapping(value = "/mySignature.do")
	@ResponseBody
	public Map<String, String> my_signature(@RequestBody Map<String, String> requestData,
							   RedirectAttributes attributes,
							   Model model, HttpSession session) {
		
		String base64Sig = requestData.get("sign");
		
		EmployeeDto loginVo = (EmployeeDto) session.getAttribute("loginVo");
		
		Map<String, String> response = new HashMap<>();
		
		if(loginVo != null) {
			String empId = loginVo.getEmp_id();
			String empName = loginVo.getName();
		
			SignDto dto = new SignDto().builder()
					.sign(base64Sig)
					.name(empName)
					.emp_id(empId) 
					.build();
			
			int signSave = service.insertSign(dto);
			
			
			model.addAttribute("signSaved",base64Sig); 
			session.setAttribute("signSaved", base64Sig);
			System.out.println("signSaved : " + base64Sig);

			response.put("redirect", "/signature_manage.do");
			
		} else {
			response.put("message", "로그인이 필요합니다.");
		}
		
		return response;
	}
	
	@GetMapping(value = "/select_signature.do")
	public String select_signature(Model model, HttpSession session) {
		
		SignDto signSaved = (SignDto)session.getAttribute("signSaved");
		
		if(signSaved != null) {
			System.out.println("signSaved : " + signSaved);
			model.addAttribute("signSaved",signSaved);
		}
		
		List<SignDto> lists = service.selectSign();
		
		model.addAttribute("lists",lists);
		
				
		return "redirect:/signature_manage";
	}
	
	@PostMapping(value = "/deleteSignature.do")
	@ResponseBody
	public Map<String, String> delete_Signature(HttpSession session,
							@RequestBody Map<String, String> requestData) {

		EmployeeDto loginVo = (EmployeeDto) session.getAttribute("loginVo");

		Map<String, String> response = new HashMap<>();
		
	    if (loginVo != null) {
	    	
	        int result = service.deleteSign(loginVo.getName());

	        session.removeAttribute("signSaved");
	        
	        response.put("redirect", "/signature_manage.do");
	        
	    } else {
	    	response.put("message", "로그인이 필요합니다.");
	    }
	    
	    return response;
	}

	
	
}
