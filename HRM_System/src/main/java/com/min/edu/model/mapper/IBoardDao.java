package com.min.edu.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.min.edu.dto.FileUpDto;
import com.min.edu.dto.FreeboardDto;
import com.min.edu.dto.NoticeboardDto;

@Mapper
public interface IBoardDao {

//	관리자는 공지사항 게시글을 등록할 수 있다.
	public int insertNotice(NoticeboardDto dto);
	
//	관리자는 공지사항 게시글을 수정할 수 있다.
	public int updateNotice(NoticeboardDto dto);
	
//	관리자는 공지사항 게시글을 삭제할 수 있다.
	public int deleteNotice(int notId);
	
//	기한이 지난 게시글은 자동으로 삭제된다.
	public int deleteNoticeDead();
	
//	공지사항 게시글을 조회할 수 있다.
	public List<NoticeboardDto> selectNotice();
	
//	사용자와 관리자는 자유게시글을 등록할 수 있다.
	public int insertFree(FreeboardDto dto);
	
//	사용자와 관리자는 자신이 등록한 자유게시글만 수정할 수 있다.
	public int updateFree(FreeboardDto dto);
	
//	사용자와 관리자는 자신이 등록한 자유게시글만 삭제할 수 있다.
	public int deleteFree(FreeboardDto dto);
	
//	사용자와 관리자는 등록된 자유게시글에 답글을 달 수 있다.
	public int insertFreeReply(FreeboardDto dto1);
	public int updateReply(FreeboardDto dto2);
	
//	사용자와 관리자는 자신이 등록한 답글을 수정할 수 있다.
	public int updateFreeReply(FreeboardDto dto);
	
//	사용자와 관리자는 자신이 등록한 답글을 삭제할 수 있다.
	public int deleteFreeReply(FreeboardDto dto);
	
//	자유게시판을 조회할 수 있다.
	public List<FreeboardDto> selectFree();
	
//	사용자는 공지사항 게시글에 등록된 첨부파일을 여러 번 다운로드할 수 있다.
	public List<FileUpDto> selectNoticeFile();
	
//	사용자와 관리자는 자유게시글에 등록된 첨부파일을 여러 번 다운로드할 수 있다.
	public List<FileUpDto> selectFreeFile();



}
