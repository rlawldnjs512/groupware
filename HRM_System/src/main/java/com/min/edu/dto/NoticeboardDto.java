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
public class NoticeboardDto {

	private int not_id;
	private String emp_id;
	private String title;
	private String content;
	private String regdate;
	private String delflag;
	private String file_id;
	private String expired;
	
	private String name;
	
}
