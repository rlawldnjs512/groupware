package com.min.edu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.dto.FileUpDto;
import com.min.edu.dto.FreeboardDto;
import com.min.edu.dto.NoticeboardDto;
import com.min.edu.model.mapper.IBoardDao;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements IBoardService {

	@Autowired
	private IBoardDao dao;
	
	@Override
    public int insertNotice(NoticeboardDto dto) {
        return dao.insertNotice(dto);
    }
    @Override
    public int insertFile(FileUpDto dto) {
        return dao.insertFile(dto);
    }
    @Override
	public int getNotId() {
		return dao.getNotId();
	}
    @Override
	public int updateFileExist(int notId) {
		return dao.updateFileExist(notId);
	}

	@Override
	public int updateNotice(NoticeboardDto dto) {
		return dao.updateNotice(dto);
	}

	@Override
	public int deleteNotice(int notId) {
		return dao.deleteNotice(notId);
	}
	@Override
	public int deletefile(int notId) {
		return dao.deletefile(notId);
	}


	@Override
	public int deleteNoticeDead() {
		return dao.deleteNoticeDead();
	}

	@Override
	public List<NoticeboardDto> selectNotice() {
		return dao.selectNotice();
	}

	@Override
	public int insertFree(FreeboardDto dto) {
		return dao.insertFree(dto);
	}
	@Override
	public int insertFileFree(FileUpDto dto) {
		return dao.insertFileFree(dto);
	}
	@Override
	public int getFreeId() {
		return dao.getFreeId();
	}
	@Override
	public int updateFreeFileExist(int freeId) {
		return dao.updateFreeFileExist(freeId);
	}

	@Override
	public int updateFree(FreeboardDto dto) {
		return dao.updateFree(dto);
	}

	@Override
	public int deleteFree(FreeboardDto dto) {
		return dao.deleteFree(dto);
	}
	@Override
	public int deleteFreeFile(int freeId) {
		return dao.deleteFreeFile(freeId);
	}

	@Override
	public int insertFreeReply(FreeboardDto dto) {
	    return dao.insertFreeReply(dto);
	}

	@Override
	public int updateReply(FreeboardDto dto) {
	    return dao.updateReply(dto);
	}

	@Transactional
    @Override
    public boolean reply(FreeboardDto dto) {
        int updateCount = dao.updateReply(dto); // STEP 증가
        int insertCount = dao.insertFreeReply(dto); // 답글 추가
        
        return (updateCount + insertCount) > 0;
    }

	@Override
	public int updateFreeReply(FreeboardDto dto) {
		return dao.updateFreeReply(dto);
	}

	@Override
	public int deleteFreeReply(FreeboardDto dto) {
		return dao.deleteFreeReply(dto);
	}

	@Override
	public List<FreeboardDto> selectFree() {
		return dao.selectFree();
	}

	@Override
	public FileUpDto selectNoticeFile(int notId) {
		return dao.selectNoticeFile(notId);
	}

	@Override
	public FileUpDto selectFreeFile(int freeId) {
		return dao.selectFreeFile(freeId);
	}

	@Override
	public NoticeboardDto getNoticeById(int notId) {
		return dao.getNoticeById(notId);
	}

	@Override
	public int countNoticePage() {
		return dao.countNoticePage();
	}

	@Override
	public List<NoticeboardDto> selectNoticePage(Map<String, Object> map) {
		return dao.selectNoticePage(map);
	}

	@Override
	public FreeboardDto getFreeById(int freeId) {
		return dao.getFreeById(freeId);
	}

	@Override
	public int countFreePage() {
		return dao.countFreePage();
	}

	@Override
	public List<FreeboardDto> selectFreePage(Map<String, Object> map) {
		return dao.selectFreePage(map);
	}
}
