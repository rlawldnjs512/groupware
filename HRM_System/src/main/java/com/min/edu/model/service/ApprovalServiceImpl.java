package com.min.edu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	// 2025 03 13 기안서 입력 및 결재선 입력
	@Override
	@Transactional
	public int insertDocument(Map<String, Object> docMap, Map<String, Object> appMap) {
		 int n = dao.insertDocument(docMap);
		 System.out.println("입력된 docMap.get(\"doc_id\") :" + docMap.get("doc_id"));
		 appMap.put("doc_id", docMap.get("doc_id"));
		 System.out.println("입력된 appMap.get(\"doc_id\") :" + appMap.get("doc_id"));
		 int m = dao.insertApproval(appMap);
		 return (n+m) >0 ? 1 : 0;
	}
	
	@Override
	@Transactional
	public int insertDocumentLeave(Map<String, Object> docMap, Map<String, Object> appMap, LeaveDto leaveDto)
	{
		 int n = dao.insertDocument(docMap);
		 appMap.put("doc_id", docMap.get("doc_id"));
		 leaveDto.setDoc_id(Integer.parseInt((String)docMap.get("doc_id")));
		 int m = dao.insertApproval(appMap);
		 int o = dao.insertSaveLeave(leaveDto);
		 
		 return (n+m+o) >0 ? 1 : 0;
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
  
	@Override
	public LeaveDto continuePreviewLeave(int doc_id) {
		return dao.continuePreviewLeave(doc_id);
	}

	@Override
	public SignDto selectSignOne(String emp_id) {
		return dao.selectSignOne(emp_id);
	}

	@Override
	 public List<ApprovalDto> getApprovalList(String emp_id){
		return dao.getApprovalList(emp_id);
	}

	@Override
	public DocumentDto getApprovalDetail(String doc_id) {
		return dao.getApprovalDetail(doc_id);
	}

	@Override
	public List<ApprovalDto> geteApproval(String doc_id) {
		return dao.geteApproval(doc_id);
	}
	
	@Override
	 public int updateApprovalStatus (Map<String, Object>map) {
		 return dao.updateApprovalStatus(map);
	 }

	@Override
	public int updateApprovalReject(Map<String, Object> map) {
		return dao.updateApprovalReject(map);
	}
}








