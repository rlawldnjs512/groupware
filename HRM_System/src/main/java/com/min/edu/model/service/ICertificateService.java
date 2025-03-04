package com.min.edu.model.service;

import java.util.List;
import java.util.Map;

import com.min.edu.dto.CertificateDto;

public interface ICertificateService {

	public List<CertificateDto> selectCertTypeUser(Map<String, Object> map);
	
	public int insertCert(CertificateDto dto);
	
	public int updateCertAccept(CertificateDto dto);
	
	public List<CertificateDto> selectCertDown(String certnum);
	
	public int updateDownload(CertificateDto dto);
	
	public int deleteCert(CertificateDto dto);
	
	public String selectCertDate(Map<String, Object> map);
	
	public List<CertificateDto> selectCertEmpAdmin(String empid);
	
	public List<CertificateDto> selectCertTypeAdmin(String type);
	
}
