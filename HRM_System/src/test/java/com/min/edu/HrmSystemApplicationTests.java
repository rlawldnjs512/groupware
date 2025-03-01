package com.min.edu;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
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

	
//	@Autowired
//	private IEmployeeDao dao;
	
	@Autowired
	private IEmployeeService service;
	
	@Test
	void contextLoads() {
			
			EmployeeDto employeeDto
			= service.getLogin(new HashMap<String, Object>(){{
				put("emp_id", "20220001");
				put("password", "SS54492214");	
			}});
			
			System.out.println(employeeDto);
		}
	
	@Test
	public void test() {
		
//		String empId = service.findById("20240002");
//		assertEquals("20240002", empId); //사원번호로 사원확인
//		System.out.println(empId);	
//		
//		int n = service.modifyPw(new HashMap<String, Object>(){{
//			put("empId","20240002");
//			put("password","AT60201765");
//		}});
		
		//assertNotNull(n);
		
//		String chk = service.checkAd("A");
//		assertNotNull(chk);
//		System.out.println(chk);
		
//		List<EmployeeDto> list = service.userSelectAll();
//		assertNotEquals(0, list.size());
//		System.out.println(list);
		
//		EmployeeDto dto = service.getOneUser("20240002");
//		System.out.println(dto);
		
		List<EmployeeDto> list = service.getEmployeeByDept(2);	
		System.out.println(list);
		
		
		EmployeeDto dto = EmployeeDto.builder()
						  .dept_id(3)
						  .name("김사람")
						  .position("대리")
						  .birth("20021205")
						  .phone("010-3456-7813")
						  .tel("890")
						  .email("aa156@test.com")
						  .hire_date("2023-03-04")
						  .build();
		int n = service.insertEmployee(dto);
		System.out.println(dto);
		assertEquals(1, n);
		
		
		
		 
//        EmployeeDto dto = EmployeeDto.builder()
//                .emp_id("20220001")
//                .dept_id(2)
//                .name("이맹구")
//                .position("사원")
//                .birth("19900501")
//                .phone("010-1234-5678")
//                .tel("5678")
//                .email("test11@test.com")
//                .build();
//
// 
//
//        int result = service.updateUser(dto);
//
//        assertEquals(1, result); 
        

    }
		
		
		
		
		
		
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	



	


