package com.min.edu.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EmployeeDto {

	private String emp_id; //테이블이랑 맞춰줘야함 
	private int dept_id;
	private String name;
	private String password;
	private String position;
	private String birth;
	private String phone;
	private String tel;
	private String email;
	private String hire_date;
	private String retire_date;
	private String login_Auth;

	private String r_state;
	private String dept_name;

	private String role;
	
	// 추가
	private List<CertificateDto> certificateDto;

}
