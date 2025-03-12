package com.min.edu;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.min.edu.model.service.ILeaveService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class Leave_JUnitTest {

	@Autowired
	private ILeaveService leaveService;
	
	@Test
	void leaveListByEmpId_Test() {
		
		String empId = "20240002";
		
		List<Map<String, Object>> list = leaveService.leaveListByEmpId(empId, "2025-02-27", "2025-02-28");
		
		System.out.println(list);
	}

}
