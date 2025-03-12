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

import com.min.edu.dto.EmployeeDto;
import com.min.edu.dto.SignDto;
import com.min.edu.model.service.IApprovalService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ApprovalController {

	private final IApprovalService service;
	
	@GetMapping(value = "/approval.do")
	public String approval_move() {
		return "approval";
	}
	
	@GetMapping(value = "/approval_pending.do")
	public String approval_pending() {
		return "approval_pending";
	}
	
	@GetMapping(value = "/approval_receive.do")
	public String approval_receive() {
		return "approval_receive";
	}
	
	@GetMapping(value = "/approval_mine.do")
	public String approval_mine() {
		return "approval_mine";
	}
	
	@GetMapping(value = "/temp_store.do")
	public String approval_store() {
		return "temp_store";
	}
	
	@GetMapping(value = "/dept_store.do")
	public String dept_store() {
		return "dept_store";
	}
	
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
