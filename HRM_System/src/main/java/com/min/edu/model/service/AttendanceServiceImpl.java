package com.min.edu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.min.edu.dto.AttendanceDto;
import com.min.edu.model.mapper.IAttendanceDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class AttendanceServiceImpl implements IAttendanceService {

	private final IAttendanceDao dao;
	
	@Override
	public List<AttendanceDto> attendanceList() {
		log.info("AttendanceServiceImpl {}", "attendanceList");
		return dao.attendanceList();
	}
	
	public List<AttendanceDto> attendanceListByEmpId(String empId){
		log.info("AttendanceServiceImpl {}", "attendanceListByEmpId");
		return dao.attendanceListByEmpId(empId);
	}

	@Override
	public int insertAttendance(String empId) {
		log.info("AttendanceServiceImpl {}", "insertAttendance");
		return dao.insertAttendance(empId);
	}

	@Override
	public int updateAttendance(String empId) {
		log.info("AttendanceServiceImpl {}", "updateAttendance");
		return dao.updateAttendance(empId);
	}

	@Override
	public int calAttendance(String empId) {
		log.info("AttendanceServiceImpl {}", "calAttendance");
		return dao.calAttendance(empId);
	}

	@Override
	public int updateAttendtype(Map<String, Object> map) {
		log.info("AttendanceServiceImpl {}", "updateAttendtype");
		return dao.updateAttendtype(map);
	}

}
