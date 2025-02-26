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
public class FileUpDto {

	private int file_id;
	private String doc_id;
	private String table_name;
	private String origin_name;
	private String store_name;
	private int size;
	private String regdate;
	private String delflag;
	private String file_path;

}
