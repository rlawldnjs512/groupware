package com.min.edu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.repository.query.Param;

import com.min.edu.dto.ApprovalDto;
import com.min.edu.dto.DocumentDto;
import com.min.edu.dto.FileUpDto;
import com.min.edu.dto.LeaveDto;
import com.min.edu.dto.SignDto;
import com.min.edu.dto.TripDto;

public interface IApprovalService {

	public int insertSign(SignDto dto);
	
	public List<SignDto> selectSign();
	
	public int deleteSign(String name);
	
	// 결재문서 임시저장
	public int insertSaveDoc(DocumentDto dto);
	public int insertTempFile(FileUpDto dto);
	public int getDocId();
	public int updateTempFileExist(int docId);
	// + 출장 추가
	public int insertSaveTrip(TripDto dto);
	// + 휴가 추가
	public int insertSaveLeave(LeaveDto dto);
	// 문서형식만 조회하기
	String getDocType(@Param("doc_id") int doc_id);
	// 출장 조회하기
	public TripDto continuePrviewTrip(int doc_id);
	// 휴가 조회하기
	public LeaveDto continuePreviewLeave(int doc_id);
	
//	사용자는 결재를 상신할 수 있다.
	public int insertApprovalDoc(DocumentDto dto);
	// + 임시 저장한 문서 상신할 때
	public int insertTempDoc(int doc_id);
	
	public int deleteSaveDoc(DocumentDto dto);
	// + 출장삭제
	public int deleteSaveTrip(int doc_id);
	// + 휴가삭제
	public int deleteSaveLeave(int doc_id);
	
	public List<ApprovalDto> selectPreviewDoc(Map<String, Object> map);
	
	public List<ApprovalDto> continuePreviewDoc(Map<String, Object> map);

	String getDocNum(@Param("name") String name);
	
	public List<Map<String, Object>> selectTree();
	
	public int insertDocument(Map<String, Object> map);
	
	public int insertApproval(Map<String, Object> map);


}
