package com.test.edu;

import static org.junit.jupiter.api.Assertions.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;

import com.min.edu.dto.CertificateDto;
import com.min.edu.dto.EmployeeDto;
import com.min.edu.model.mapper.IApprovalDao;
import com.min.edu.model.mapper.ICertificateDao;


@SpringBootTest
@ContextConfiguration
class QueryTest_JUnitTest {

	

	
	@Autowired
	private ICertificateDao dao;
	
	@Autowired
	private IApprovalDao dao2;
	
// 증명서 관리 쿼리 테스트 ------------------------------------------------
	
	@Test
	public void selectCertTypeUser_test() {
	    Map<String, Object> map = new HashMap<String, Object>();
		map.put("emp_id", "20240002");
		map.put("type", "퇴직");
		List<CertificateDto> dto = dao.selectCertTypeUser(map);
		assertNotNull(dto);
	}
	
//	@Test
	public void insertCert_test() {
		CertificateDto dto = new CertificateDto().builder()
							.name("홍길동")
							.type("경력")
							.reason("경력증명서입니다.")
							.build();

		int n = dao.insertCert(dto);
	    assertEquals(1, n);
	}

//	@Test
	public void updateCertAccept() {
		CertificateDto dto = new CertificateDto().builder()
							.name("홍길동")
							.cert_status("N")
							.build();
		
		int n = dao.updateCertAccept(dto);
		assertNotEquals(1, n);
	}
	
//	@Test
	public void selectCertDown() {
		List<CertificateDto> lists = dao.selectCertDown();
		assertNotNull(lists);
	}
	 
//	@Test
	public void deleteCert() {
		CertificateDto dto = new CertificateDto().builder()
					.name("홍길동")
					.cert_num("CERT_2025_42")
					.build();
		
		int n = dao.deleteCert(dto);
		assertEquals(1, n);
							
	}
	
//	@Test
	public void selectCertDate() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "홍길동");
		map.put("cert_num", "EMP_2025_39");
		
		System.out.println("Name: " + map.get("name"));
		System.out.println("Cert Num: " + map.get("cert_num"));
		
		String certdate = dao.selectCertDate(map);
		System.out.println(certdate);
	}
	
//	@Test
	public void selectCertEmpAdmin() {
		List<CertificateDto> dto = dao.selectCertEmpAdmin("20250021");
		
		System.out.println(dto);
		assertNotNull(dto);		
	}
	
//	@Test
	public void selectCertTypeAdmin() {
		List<CertificateDto> dto = dao.selectCertTypeAdmin("경력");
		
		System.out.println(dto);
		assertNotNull(dto);
	}
	
// 전자결재 서명/임시저장/미리보기 쿼리 테스트 ------------------------------------------------
	
	
	
	
	

}
