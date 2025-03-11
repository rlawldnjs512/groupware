package com.min.edu.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.min.edu.dto.ApprovalDto;
import com.min.edu.dto.DocumentDto;
import com.min.edu.dto.SignDto;

@Mapper
public interface IApprovalDao {

//	사용자별로 한개의 서명만 등록할 수 있다.
	public int insertSign(SignDto dto);
	
	public List<SignDto> selectSign();
	
//	사용자는 자신의 서명을 삭제할 수 있다.
	public int deleteSign(String name);
	
//	사용자는 작성중인 결재문서를 임시저장할 수 있다.
	public int insertSaveDoc(DocumentDto dto);
	
//	사용자는 임시저장한 문서를 삭제할 수 있다.
	public int deleteSaveDoc(DocumentDto dto);
	
//	사용자는 작성한 결재문서를 결재하기 전에 미리보기를 할 수 있다.
	public List<ApprovalDto> selectPreviewDoc(Map<String, Object> map);
	

	String getDocNum(@Param("name") String name);

	public List<Map<String, Object>> selectTree();



}
