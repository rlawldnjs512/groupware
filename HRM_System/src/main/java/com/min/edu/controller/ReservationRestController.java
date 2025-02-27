package com.min.edu.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.min.edu.dto.ReservationDto;
import com.min.edu.dto.RoomDto;
import com.min.edu.model.mapper.IReservationDao;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ReservationRestController {

	@Autowired
	private IReservationDao dao;
	
	@PostMapping("/insertReserv.do")
	public ResponseEntity<Map<String, Boolean>> insertReservation(@RequestBody Map<String, Object> requestReq) {
		System.out.println(requestReq);
        
         dao.insertReservation(requestReq);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("isc", Boolean.TRUE);
        return ResponseEntity.ok(map);
    }
	
}
