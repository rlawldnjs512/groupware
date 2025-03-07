package com.min.edu.model.service;

import java.util.List;
import java.util.Map;

import com.min.edu.dto.ApprovalDto;
import com.min.edu.dto.DocumentDto;
import com.min.edu.dto.SignDto;

public interface IApprovalService {

	public int insertSign(SignDto dto);
	
	public int deleteSign(SignDto name);
	
	public int insertSaveDoc(DocumentDto dto);
	
	public int deleteSaveDoc(DocumentDto dto);
	
	public List<ApprovalDto> selectPreviewDoc(Map<String, Object> map);
	
	public List<Map<String, Object>> selectTree(Map<String, Object> map);
}
