package com.min.edu.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ILeaveDao {
	
	public List<Map<String, Object>> leaveList();
	
	public List<Map<String, Object>> leaveListByEmpId(String empId);
	
}