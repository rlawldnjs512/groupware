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
public class FreeboardDto {

	private int free_id;
	private String emp_id;
	private String title;
	private String content;
	private String regdate;
	private String reply_id;
	private int ref;
	private int step;
	private int depth;
	private String delflag;
	private String file_id;
	
	// 추가
	private String name;

}
