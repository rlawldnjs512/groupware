package com.min.edu;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.min.edu.model.service.IAttendanceService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class Attendance_JUnitTest {

	@Autowired
	private IAttendanceService service;
	
	@Test
	void selectClockOut_Test() {
		String empId = "20180048";
		String clockOut = service.selectClockOut(empId);
		
		log.info("퇴근시간 조회 : {}", clockOut);
		
		assertNotEquals(0, clockOut);
	}
	

}
