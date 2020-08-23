package com.cricket.dao;

import java.util.List;

import com.cricket.vo.ReportVO;

public interface ReportDao {

	List<ReportVO> getStateWiseReportList();
	List<ReportVO> getCityWiseReportList();
	List<ReportVO> getProductTypeWise();
	List<ReportVO> getProductWise();
	List<ReportVO> getScenaioWise();
}
