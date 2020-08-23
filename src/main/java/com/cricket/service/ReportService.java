package com.cricket.service;

import java.util.List;

import com.cricket.vo.ReportVO;

public interface ReportService {

	List<ReportVO> getStateWiseReportList();
	List<ReportVO> getCityWiseReportList();
	List<ReportVO> getProductTypeWise();
	List<ReportVO> getProductWise();
	List<ReportVO> getScenaioWise();
	
}
