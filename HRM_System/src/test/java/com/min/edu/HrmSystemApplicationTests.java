package com.min.edu;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.HashMap;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.min.edu.dto.EmployeeDto;
import com.min.edu.model.mapper.IEmployeeDao;
import com.min.edu.model.service.IEmployeeService;

@SpringBootTest
class HrmSystemApplicationTests {

	@Autowired
	private IEmployeeService employeeService;
	
//	@Autowired
//	private IEmployeeDao dao;
	
	@Autowired
	private IEmployeeService service;
	
	@Test
	void contextLoads() {
		
			EmployeeDto employeeDto
			= employeeService.getLogin(new HashMap<String, Object>(){{
				put("emp_id", "20220001");
				put("password", "SS54492214");	
			}});
			
			System.out.println(employeeDto);
		}
	
	//@Test
	public void test() {
//		String empId = service.findById("20240002");
//		assertEquals("20240002", empId); //사원번호로 사원확인
//		System.out.println(empId);	
		
//		int n = service.modifyPw(new HashMap<String, Object>(){{
//			put("empId","20240002");
//			put("password","AT60201765");
//		}});
//		
//		assertNotNull(n);
		
//		String chk = service.checkAd("A");
//		assertNotNull(chk);
//		System.out.println(chk);
		
		
		
			
	}
	
	
	
	
	
	
	
	
	
	
	
	}



	


