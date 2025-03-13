package com.min.edu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.dto.ApprovalDto;
import com.min.edu.dto.DocumentDto;
import com.min.edu.dto.FileUpDto;
import com.min.edu.dto.LeaveDto;
import com.min.edu.dto.SignDto;
import com.min.edu.dto.TripDto;
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
	public int deleteSign(String name) {
		return dao.deleteSign(name);
	}
	
	@Override
	public int insertSaveDoc(DocumentDto dto) {
		return dao.insertSaveDoc(dto);
	}
	@Override
	public int insertTempFile(FileUpDto dto) {
		return dao.insertTempFile(dto);
	}
	@Override
	public int getDocId() {
		return dao.getDocId();
	}
	@Override
	public int updateTempFileExist(int docId) {
		return dao.updateTempFileExist(docId);
	}
	@Override
	public int insertSaveTrip(TripDto dto) {
		return dao.insertSaveTrip(dto);
	}
	@Override
	public int insertSaveLeave(LeaveDto dto) {
		return dao.insertSaveLeave(dto);
	}
	@Override
	public String getDocType(int doc_id) {
		return dao.getDocType(doc_id);
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
	public List<SignDto> selectSign() {
		return dao.selectSign();
	}

	@Override
	public String getDocNum(String name) {
		return dao.getDocNum(name);
	}

	@Override
	public List<Map<String, Object>> selectTree() {
		return dao.selectTree();
	}

	@Override
	public int insertDocument(Map<String, Object> map) {
		return dao.insertDocument(map);
	}

	@Override
	public int insertApproval(Map<String, Object> map) {
		return dao.insertApproval(map);
	}

	@Override
	public List<ApprovalDto> continuePreviewDoc(Map<String, Object> map) {
		return dao.continuePreviewDoc(map);
	}

	@Override
	public TripDto continuePrviewTrip(int doc_id) {
		return dao.continuePrviewTrip(doc_id);
	}

	@Override
	public int insertApprovalDoc(DocumentDto dto) {
		return dao.insertApprovalDoc(dto);
	}

	@Override
	public int insertTempDoc(int doc_id) {
		return dao.insertTempDoc(doc_id);
	}

	@Override
	public int deleteSaveTrip(int doc_id) {
		return dao.deleteSaveTrip(doc_id);
	}

	@Override
	public int deleteSaveLeave(int doc_id) {
		return dao.deleteSaveLeave(doc_id);
	}

}
