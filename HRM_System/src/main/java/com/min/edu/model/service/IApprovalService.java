package com.min.edu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.repository.query.Param;

import com.min.edu.dto.ApprovalDto;
import com.min.edu.dto.DocumentDto;
import com.min.edu.dto.SignDto;

public interface IApprovalService {

	public int insertSign(SignDto dto);
	
	public List<SignDto> selectSign();
	
	public int deleteSign(String name);
	
	public int insertSaveDoc(DocumentDto dto);
	
	public int deleteSaveDoc(DocumentDto dto);
	
	public List<ApprovalDto> selectPreviewDoc(Map<String, Object> map);

	String getDocNum(@Param("name") String name);
	
	public List<Map<String, Object>> selectTree();
	
	public int insertDocument(Map<String, Object> map);
	
	public int insertApproval(Map<String, Object> map);


}
