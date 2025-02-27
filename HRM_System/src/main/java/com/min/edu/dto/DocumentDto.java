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
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DocumentDto {

	private int doc_id;
	private String emp_id;
	private String doc_type;
	private String title;
	private String content;
	private String create_date;
	private String doc_status;
	private String doc_date;
	private int file_id;
	private String doc_num;
	
	private String name;

}
