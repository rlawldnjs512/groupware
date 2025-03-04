package com.min.edu.model.service;

import java.util.List;
import java.util.Map;

import com.min.edu.dto.EmployeeDto;

public interface IEmpPageService {

	/**
	 *요청된 범위에 해당하는 글의 리스트를 조회 함 
	 */
	public List<EmployeeDto> selectAllUser(Map<String, Object> map);
	
	/**
	 * 전체글의 갯수를 조회하면 페이지 연산에 사용
	 */
	public int countUser();

}
