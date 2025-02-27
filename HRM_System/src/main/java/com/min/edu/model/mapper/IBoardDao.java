package com.min.edu.model.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IBoardDao {

//	관리자는 공지사항 게시글을 등록할 수 있다.
	public void insertNotice();
	
//	관리자는 공지사항 게시글을 삭제할 수 있다.
	public void deleteNotice();
	
//	기한이 지난 게시글은 자동으로 삭제된다.
	public void deleteNoticeDead();
	
//	사용자와 관리자는 자유게시글을 등록할 수 있다.
	public void insertFree();
	
//	사용자와 관리자는 자신이 등록한 자유게시글만 수정할 수 있다.
	public void updateFree();
	
//	사용자와 관리자는 자신이 등록한 자유게시글만 삭제할 수 있다.
	public void deleteFree();
	
//	사용자와 관리자는 등록된 자유게시글에 답글을 달 수 있다.
	public void insertFreeReply();
	public void updateReply();
	
//	사용자와 관리자는 자신이 등록한 답글을 수정할 수 있다.
	public void updateFreeReply();
	
//	사용자와 관리자는 자신이 등록한 답글을 삭제할 수 있다.
	public void deleteFreeReply();
	
//	사용자는 공지사항 게시글에 등록된 첨부파일을 여러 번 다운로드할 수 있다.
	public void selectNoticeFile();
	
//	사용자와 관리자는 자유게시글에 등록된 첨부파일을 여러 번 다운로드할 수 있다.
	public void selectFreeFile();




	


	





}
