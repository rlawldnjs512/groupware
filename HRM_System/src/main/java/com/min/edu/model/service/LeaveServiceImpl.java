package com.min.edu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.min.edu.model.mapper.ILeaveDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class LeaveServiceImpl implements ILeaveService {

	private final ILeaveDao leaveDao;
	
	@Override
	public List<Map<String, Object>> leaveList() {
		return leaveDao.leaveList();
	}

	@Override
	public List<Map<String, Object>> leaveListByEmpId(String empId) {
		return leaveDao.leaveListByEmpId(empId);
	}

}
