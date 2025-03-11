package com.min.edu.model.service;

import java.util.List;
import java.util.Map;

import com.min.edu.dto.FileUpDto;
import com.min.edu.dto.FreeboardDto;
import com.min.edu.dto.NoticeboardDto;

public interface IBoardService {

	public int insertNotice(NoticeboardDto dto);
	public int insertFile(FileUpDto dto);
	public int getNotId();
	public int updateFileExist(int notId);
	
	public int updateNotice(NoticeboardDto dto);
	
	public int deleteNotice(int notId);
	public int deletefile(int notId);
	
	public int deleteNoticeDead();
	
	public List<NoticeboardDto> selectNotice();
	
	public int insertFree(FreeboardDto dto);
	public int insertFileFree(FileUpDto dto);
	public int getFreeId();
	public int updateFreeFileExist(int freeId);
	
	public int updateFree(FreeboardDto dto);
	
	public int deleteFree(FreeboardDto dto);
	public int deleteFreeFile(int freeId);
	
	public int insertFreeReply(FreeboardDto dto1);
	public int updateReply(FreeboardDto dto2);
	public boolean reply(FreeboardDto dto2);
	
	public int updateFreeReply(FreeboardDto dto);
	
	public int deleteFreeReply(FreeboardDto dto);
	
	public List<FreeboardDto> selectFree();
	
	public FileUpDto selectNoticeFile(int notId);
	
	public FileUpDto selectFreeFile(int freeId);
	
	
	public NoticeboardDto getNoticeById(int notId);
	
	public int countNoticePage();
	public List<NoticeboardDto> selectNoticePage(Map<String, Object> map);
	
	
	public FreeboardDto getFreeById(int freeId);
	
	public int countFreePage();
	public List<FreeboardDto> selectFreePage(Map<String, Object> map);
}
