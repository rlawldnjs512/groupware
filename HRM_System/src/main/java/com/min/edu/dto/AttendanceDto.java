package com.min.edu.dto;

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
public class AttendanceDto {

	private int attend_id;
	private String emp_id;
	private String attend_date;
	private int clockin;
	private int clockout;
	private int total_time;

}
