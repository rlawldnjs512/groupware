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
		return dao.getLogin(map); // 로그인 시 비밀번호 비교는 평문 그대로 사용
	}

	@Override
	public String findById(String emp_id) {
		log.info("EmployeeServiceImpl {}", "findById");
		return dao.findById(emp_id);
	}

	@Override
	public int modifyPw(Map<String, Object> map) {
		log.info("EmployeeServiceImpl {}", "modifyPw");
		return dao.modifyPw(map);
	}

	@Override
	public String checkAd(String role) {
		log.info("EmployeeServiceImpl {}", "checkAd");
		return dao.checkAd(role);
	}

	@Override
	public List<EmployeeDto> userSelectAll() {
		log.info("EmployeeServiceImpl {}", "userSelectAll");
		return dao.userSelectAll();
	}

	@Override
	public EmployeeDto getOneUser(String emp_id) {
		log.info("EmployeeServiceImpl {}", "getOneUser");
		return dao.getOneUser(emp_id);
	}

	@Override
	public List<EmployeeDto> sortDept(String dept_name) {
		log.info("EmployeeServiceImpl {}", "getEmployeeByNameOrDept");
		return dao.sortDept(dept_name);
	}

	@Override
	public List<EmployeeDto> sortName(String name) {
		log.info("EmployeeServiceImpl {}", "sortName");
		return dao.sortName(name);
	}

	@Override
	public int insertEmployee(EmployeeDto dto) {
		log.info("EmployeeServiceImpl {}", "insertEmployee");
		return dao.insertEmployee(dto);
	}

	@Override
	public int updateUser(EmployeeDto dto) {
		log.info("EmployeeServiceImpl {}", "updateUser");
		return dao.updateUser(dto);
	}

	@Override
	public int modifyUserInfo(EmployeeDto dto) {
		log.info("EmployeeServiceImpl {}", "modifyUserInfo");
		return dao.modifyUserInfo(dto);
	}

	@Override
	public EmployeeDto getOne(String emp_id) {
		log.info("EmployeeServiceImpl {}", "getOne");
		return dao.getOne(emp_id);
	}

	@Override
	public int updateProfile(Map<String, Object> map) {
		log.info("EmployeeServiceImpl {}", "uploadProfile");
		return dao.updateProfile(map);
	}

	@Override

	public boolean isAdmin(String emp_id) {
		// 매퍼에서 관리자인지 확인
		String result = dao.checkAd(emp_id);
		return result != null; // 결과가 null이 아니면 관리자임
	}

	

	@Override
	public List<EmployeeDto> selectAllUser(Map<String, Object> map) {
		log.info("EmployeeServiceImpl {}", "selectAllUser");
		log.info("전달된 파라미터", map);
		return dao.selectAllUser(map);
	}

		@Override
		public int countUser()
		{
			log.info("게시글 전체 글 갯수");
			return dao.countUser();
		}
}