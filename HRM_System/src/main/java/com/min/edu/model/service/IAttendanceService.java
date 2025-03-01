package com.min.edu.model.service;

import java.util.List;
import java.util.Map;

import com.min.edu.dto.AttendanceDto;

public interface IAttendanceService {

	public List<AttendanceDto> attendanceList();
	
	public List<AttendanceDto> attendanceListByEmpId(String empId);
	
	public int insertAttendance(String empId);
	
	public int updateAttendance(String empId);
	
	public int calAttendance(String empId);
	
	public int updateAttendtype(Map<String, Object> map);
}
