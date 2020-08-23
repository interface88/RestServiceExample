package com.cricket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cricket.dao.ReportDao;
import com.cricket.vo.ReportVO;

@Service
@Transactional(readOnly = true)
public class ReportServiceImp implements ReportService {

	@Autowired
	private ReportDao reportDao;

	@Override
	public List<ReportVO> getStateWiseReportList() {
		return reportDao.getStateWiseReportList();

	}

	@Override
	public List<ReportVO> getCityWiseReportList() {
		return reportDao.getCityWiseReportList();
	}

	@Override
	public List<ReportVO> getProductTypeWise() {
		return reportDao.getProductTypeWise();
	}

	@Override
	public List<ReportVO> getProductWise() {
		return reportDao.getProductWise();
	}

	@Override
	public List<ReportVO> getScenaioWise() {
		return reportDao.getScenaioWise();
	}

}
