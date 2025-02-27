package com.min.edu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.min.edu.dto.EmployeeDto;
import com.min.edu.model.mapper.IEmployeeDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmployeeServiceImpl implements IEmployeeService {

	private final IEmployeeDao dao;  

    @Override
    public EmployeeDto getLogin(Map<String, Object> map) {
        log.info("EmployeeServiceImpl {}", "getLogin");
        return dao.getLogin(map);  // 로그인 시 비밀번호 비교는 평문 그대로 사용
    }

	@Override
	public String findById(String empId) {
		log.info("EmployeeServiceImpl {}", "findById");
		return dao.findById(empId);
	}

	@Override
	public int modifyPw(Map<String, Object> map) {
		log.info("EmployeeServiceImpl {}", "modifyPw");
		return dao.modifyPw(map);
	}

	@Override
	public String checkAd(String role) {
		log.info("EmployeeServiceImpl {}","checkAd");
		return dao.checkAd(role);
	}

	@Override
	public List<EmployeeDto> userSelectAll() {
		log.info("EmployeeServiceImpl {}","userSelectAll");
		return dao.userSelectAll();
	}

	@Override
	public EmployeeDto getOneUser(String empId) {
		log.info("EmployeeServiceImpl {}","getOneUser");
		return dao.getOneUser(empId);
	}

	@Override
	public List<EmployeeDto> getEmployeeByNameOrDept(Map<String, Object> map) {
		log.info("EmployeeServiceImpl {}","getOneUser");
		return dao.getEmployeeByNameOrDept(map);
	}

	@Override
	public int insertEmployee(EmployeeDto dto) {
		log.info("EmployeeServiceImpl {}","insertEmployee");
		return dao.insertEmployee(dto);
	}

	@Override
	public int updateUser(EmployeeDto dto) {
		log.info("EmployeeServiceImpl {}","updateUser");
		return dao.updateUser(dto);
	}

	@Override
	public int modifyUserInfo(EmployeeDto dto) {
		log.info("EmployeeServiceImpl {}","modifyUserInfo");
		return dao.modifyUserInfo(dto);
	}

	@Override
	public EmployeeDto getOne(String empId) {
		log.info("EmployeeServiceImpl {}","getOne");
		return dao.getOne(empId);
	}

}

