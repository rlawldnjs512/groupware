package com.min.edu.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.min.edu.dto.ApprovalDto;
import com.min.edu.dto.DocumentDto;
import com.min.edu.dto.SignDto;
import com.min.edu.model.mapper.IApprovalDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ApprovalServiceImpl implements IApprovalService {
	
	private IApprovalDao dao;
	
	@Override
	public int insertSign(SignDto dto) {
		return dao.insertSign(dto);
	}

	@Override
	public int deleteSign(SignDto name) {
		return dao.deleteSign(name);
	}

	@Override
	public int deleteSaveDoc(DocumentDto dto) {
		return dao.deleteSaveDoc(dto);
	}

	@Override
	public List<DocumentDto> selectPreviewDoc(DocumentDto dto) {
		return dao.selectPreviewDoc(dto);
	}

}
