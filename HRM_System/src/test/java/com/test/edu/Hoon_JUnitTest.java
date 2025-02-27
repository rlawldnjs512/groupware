package com.test.edu;

import static org.junit.jupiter.api.Assertions.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

import com.min.edu.HrmSystemApplication;
import com.min.edu.dto.RoomDto;
import com.min.edu.model.mapper.IReservationDao;

@SpringBootTest
@ContextConfiguration(classes = HrmSystemApplication.class)
class Hoon_JUnitTest {

	@Autowired
	IReservationDao dao;
	
	@Test
	public void selectReservation() {
		List<RoomDto> list = dao.selectReservation("2025-02-27");
		System.out.println(list);
		
	}
	
//	@Test
	public void myReservation() {
		List<RoomDto> list = dao.myReservation();
		System.out.println(list);
	}
	
//	@Test
	public void deleteReservation() {
		Map<String, Object> map = new HashMap<String, Object>(){{
			put("reserv_id", "10");
			put("emp_id", "20250005");
		}};
		
		int cnt = dao.deleteReservation(map);
		System.out.println(cnt);
		
	}
	
//	@Test
	public void insertReservation() {
		Map<String, Object> map = new HashMap<String, Object>(){{
			put("room_id", "R01");
			put("emp_id", "20250005");
			put("rev_date", "2025-02-27");
			put("slot", "3");
		}};
		
		int cnt = dao.insertReservation(map);
		System.out.println(cnt);
		
	}

}









