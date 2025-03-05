package com.min.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.min.edu.dto.CertificateDto;
import com.min.edu.dto.EmpPageDto;
import com.min.edu.dto.EmployeeDto;
import com.min.edu.model.service.ICertificateService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CertificationController {

	private final ICertificateService service;
	
//	@GetMapping(value = "/mypage.do")
//	public String mypage_cert_move() {
//		return "mypage";
//	}
	
	@GetMapping(value = "/certification.do")
	public String cert_move(HttpSession session, Model model,
							HttpServletRequest req) {
	    String cert_num = (String) session.getAttribute("cert_num");

	    if (cert_num != null) {
	        System.out.println("cert_num from session: " + cert_num);  // 👉 디버깅 출력
	    } else {
	        System.out.println("cert_num is null in session!");
	    }

	    model.addAttribute("cert_num", cert_num);  // JSP로 전달

	    return "certification"; 
	}
	
	@GetMapping(value = "/select.do")
	public String certSelect(Model model, HttpSession session, @RequestParam("type") String type,
	                         HttpServletRequest req) {
	    EmployeeDto loginVo = (EmployeeDto) session.getAttribute("loginVo");

	    if (loginVo != null) {
	        String emp_id = loginVo.getEmp_id();
	        System.out.println("empId from session: " + emp_id);

	        Map<String, Object> map = new HashMap<String, Object>();
	        map.put("emp_id", emp_id);
	        map.put("type", type);

	        // 페이지 정보 가져오기 (기본값: 1)
	        String pageParam = req.getParameter("page");
	        if (pageParam == null) {
	            pageParam = "1";
	        }
	        int selectPage = Integer.parseInt(pageParam);

	        // EmpPageDto 생성하여 페이지 관련 정보 설정
	        EmpPageDto d = new EmpPageDto();
	        
	        // 전체 데이터 개수 가져오기 (selectCertTypeUser가 아닌 전체 데이터 카운트)
	        int totalCount = service.countCert(map);  // 전체 데이터의 갯수
	        d.setTotalCount(totalCount);  // 전체 글의 갯수
	        d.setCountList(2);  // 한 페이지에 표시될 글 갯수
	        d.setCountPage(5);  // 화면에 표시될 페이지 그룹 갯수

	        // 전체 페이지 수 계산 (전체 데이터 수 / 페이지 크기)
	        d.setTotalPage(d.getTotalCount());  

	        d.setPage(selectPage);  // 현재 페이지 설정
	        d.setStagePage(d.getPage());  // 현재 페이지 그룹의 시작 번호 계산
	        d.setEndPage();  // 현재 페이지 그룹의 끝 번호 계산

	        // 페이징 처리를 위한 first, last 값 계산
	        int first = (d.getPage() - 1) * d.getCountList() + 1;  // 시작 번호
	        int last = d.getPage() * d.getCountList();             // 끝 번호
	        map.put("first", first);
	        map.put("last", last);

	        // selectCertTypeUser로 해당 페이지에 해당하는 데이터 가져오기
	        List<CertificateDto> lists = service.selectCertTypeUserPage(map);  
	        System.out.println("Lists size: " + (lists == null ? 0 : lists.size()));  // 리스트의 크기 출력
	        System.out.println("first:"+first);
	        System.out.println("last:"+last);
	        
	        // 모델에 데이터 추가
	        model.addAttribute("lists", lists);
	        model.addAttribute("page", d);

	    } else {
	        model.addAttribute("error", "로그인이 필요합니다.");
	    }

	    return "certification";
	}

	@PostMapping(value = "/pdf.do")
	public String pdf(@RequestParam("certificateType") String certificateType, 
	                  @RequestParam("reason") String reason,
	                  HttpSession session, RedirectAttributes redirectAttributes) {
	    
	    EmployeeDto loginVo = (EmployeeDto) session.getAttribute("loginVo");
	    
	    if (loginVo == null) {
	        redirectAttributes.addFlashAttribute("errorMessage", "로그인이 필요합니다.");
	        return "redirect:/login"; 
	    }

	    String ename = loginVo.getName();

	    CertificateDto certificateVo = CertificateDto.builder()
	            .name(ename)
	            .type(certificateType)
	            .reason(reason)
	            .build();

	    int result = service.insertCert(certificateVo);
	    
	    if (result <= 0) {
	        redirectAttributes.addFlashAttribute("errorMessage", "증명서 신청에 실패했습니다.");
	        return "redirect:/certification"; 
	    }

	    String cert_num = service.getCertNum(ename);
	    if (cert_num == null) {
	        redirectAttributes.addFlashAttribute("errorMessage", "발급번호를 가져오는 데 실패했습니다.");
	        return "redirect:/certification";
	    }

	    certificateVo.setCert_num(cert_num);

	    System.out.println("Saving cert_num in session: " + cert_num);
	    session.setAttribute("cert_num", cert_num);

	    return "redirect:/certification.do";
	}
	
	@PostMapping("/updateDownload")
	public ResponseEntity<String> updateDownloadStatus(@RequestParam("certNum") String cert_num) {
	    try {
	        service.updateDownload(cert_num);
	        return ResponseEntity.ok("다운로드 상태가 업데이트되었습니다.");
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버 오류");
	    }
	}

	
	
}
