package com.min.edu.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.min.edu.dto.RoomDto;
import com.min.edu.model.mapper.IReservationDao;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j

public class ReservationController {
	
	@Autowired
	private IReservationDao dao;
	
	@GetMapping(value = "/reservation.do")
	public String searchReservation(Model model, @RequestParam(required = false) String nowDate) {
		System.out.println(nowDate);
		if(nowDate == null) {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			nowDate = sdf.format(date);
			System.out.println(nowDate);
		}

		
		List<RoomDto> lists = dao.selectReservation(nowDate);
		model.addAttribute("lists",lists);
		return "reservation";
	}
	
	


}
