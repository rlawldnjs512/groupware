package com.min.edu.model.service;

import java.util.List;

import com.min.edu.dto.ApprovalDto;
import com.min.edu.dto.DocumentDto;
import com.min.edu.dto.SignDto;

public interface IApprovalService {

	public int insertSign(SignDto dto);
	
	public int deleteSign(SignDto name);
	
	public int deleteSaveDoc(DocumentDto dto);
	
	public List<DocumentDto> selectPreviewDoc(DocumentDto dto);
	
}
