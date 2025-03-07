package com.min.edu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.dto.ApprovalDto;
import com.min.edu.dto.DocumentDto;
import com.min.edu.dto.SignDto;
import com.min.edu.model.mapper.IApprovalDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ApprovalServiceImpl implements IApprovalService {
	
	@Autowired
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
	public int insertSaveDoc(DocumentDto dto) {
		return dao.insertSaveDoc(dto);
	}

	@Override
	public int deleteSaveDoc(DocumentDto dto) {
		return dao.deleteSaveDoc(dto);
	}

	@Override
	public List<ApprovalDto> selectPreviewDoc(Map<String, Object> map) {
		return dao.selectPreviewDoc(map);
	}

	@Override
	public List<Map<String, Object>> selectTree(Map<String, Object> map) {
		return dao.selectTree(map);
	}


}
