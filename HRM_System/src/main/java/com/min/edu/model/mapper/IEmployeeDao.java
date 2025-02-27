package com.min.edu.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.min.edu.dto.EmployeeDto;

@Mapper
public interface IEmployeeDao {
	
	// 로그인 처리
    public EmployeeDto getLogin(Map<String, Object> map);
    //사원번호로 사원확인
    public String findById(String empId);
    //비밀번호 재설정
    public int modifyPw(Map<String, Object>map);
    //관리자 확인
    public String checkAd(String role);
    //전체사원조회
    public List<EmployeeDto> userSelectAll();
    //사원상세조회
    public EmployeeDto getOneUser(String empId);
    //이름|부서 별 사원조회
    public List<EmployeeDto> getEmployeeByDept(int deptId);
   
    //사원등록-관리자
    public int insertEmployee(EmployeeDto dto);
    //사원수정-관리자
    public int updateUser(EmployeeDto dto);
    //정보수정-마이페이지
    public int modifyUserInfo(EmployeeDto dto);
    //정보조회-마이페이지
    public EmployeeDto getOne(String empId);


 
}
