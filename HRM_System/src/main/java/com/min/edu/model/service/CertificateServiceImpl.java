package com.min.edu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.min.edu.dto.CertificateDto;
import com.min.edu.model.mapper.ICertificateDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CertificateServiceImpl implements ICertificateService {

	private ICertificateDao dao;

	@Override
	public List<CertificateDto> selectCertTypeUser(Map<String, Object> map) {
		return dao.selectCertTypeUser(map);
	}

	@Override
	public int insertCert(CertificateDto dto) {
		return dao.insertCert(dto);
	}

	@Override
	public int updateCertAccept(CertificateDto dto) {
		return dao.updateCertAccept(dto);
	}

	@Override
	public List<CertificateDto> selectCertDown(String certnum) {
		return dao.selectCertDown(certnum);
	}
	
	@Override
	public int updateDownload(CertificateDto dto) {
		return dao.updateDownload(dto);
	}

	@Override
	public int deleteCert(CertificateDto dto) {
		return dao.deleteCert(dto);
	}

	@Override
	public String selectCertDate(Map<String, Object> map) {
		return dao.selectCertDate(map);
	}

	@Override
	public List<CertificateDto> selectCertEmpAdmin(String empid) {
		return dao.selectCertEmpAdmin(empid);
	}

	@Override
	public List<CertificateDto> selectCertTypeAdmin(String type) {
		return dao.selectCertTypeAdmin(type);
	}
	
}
