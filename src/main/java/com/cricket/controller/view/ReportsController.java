package com.cricket.controller.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cricket.service.ReportService;
import com.cricket.vo.ReportVO;

@Controller
@RequestMapping("/mvc/report")
public class ReportsController {
	
	@Autowired
	private ReportService reportService; 

	@RequestMapping(value = "/stateWise", method = RequestMethod.GET)
	public String save(Model model) {
		List<ReportVO> reportVOList  = reportService.getStateWiseReportList();
		model.addAttribute("reportVOList", reportVOList);
		return "report/stateWise";
	}
	
	@RequestMapping(value = "/cityWise", method = RequestMethod.GET)
	public String cityWise(Model model) {
		List<ReportVO> reportVOList  = reportService.getCityWiseReportList();
		model.addAttribute("reportVOList", reportVOList);
		return "report/cityWise";
	}
	
	@RequestMapping(value = "/productTypeWise", method = RequestMethod.GET)
	public String productTypeWise(Model model) {
		List<ReportVO> reportVOList  = reportService.getProductTypeWise();
		model.addAttribute("reportVOList", reportVOList);
		return "report/productTypeWise";
	}
	@RequestMapping(value = "/productWise", method = RequestMethod.GET)
	public String productWise(Model model) {
		List<ReportVO> reportVOList  = reportService.getProductWise();
		model.addAttribute("reportVOList", reportVOList);
		return "report/productWise";
	}
	
	@RequestMapping(value = "/scenarioWise", method = RequestMethod.GET)
	public String scenarioWise(Model model) {
		List<ReportVO> reportVOList  = reportService.getScenaioWise();
		model.addAttribute("reportVOList", reportVOList);
		return "report/scenarioWise";
	}
	
}