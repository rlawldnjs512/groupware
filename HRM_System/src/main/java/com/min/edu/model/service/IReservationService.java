package com.min.edu.model.service;

import java.util.List;
import java.util.Map;

import com.min.edu.dto.RoomDto;

public interface IReservationService {

	public List<RoomDto> selectReservation(String currDay);
	
	public List<RoomDto> myReservation();
	
	public int deleteReservation(Map<String, Object> map);
	
	public int insertReservation(Map<String, Object> map);
	
}
