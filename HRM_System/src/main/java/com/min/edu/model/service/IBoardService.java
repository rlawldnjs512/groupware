package com.min.edu.model.service;

import java.util.List;

import com.min.edu.dto.FileUpDto;
import com.min.edu.dto.FreeboardDto;
import com.min.edu.dto.NoticeboardDto;

public interface IBoardService {

	public int insertNotice(NoticeboardDto dto);
	
	public int updateNotice(NoticeboardDto dto);
	
	public int deleteNotice(int notId);
	
	public int deleteNoticeDead();
	
	public List<NoticeboardDto> selectNotice();
	
	public int insertFree(FreeboardDto dto);
	
	public int updateFree(FreeboardDto dto);
	
	public int deleteFree(FreeboardDto dto);
	
	public int insertFreeReply(FreeboardDto dto1);
	public int updateReply(FreeboardDto dto2);
	public boolean reply(FreeboardDto dto2);
	
	public int updateFreeReply(FreeboardDto dto);
	
	public int deleteFreeReply(FreeboardDto dto);
	
	public List<FreeboardDto> selectFree();
	
	public List<FileUpDto> selectNoticeFile();
	
	public List<FileUpDto> selectFreeFile();
	
}
