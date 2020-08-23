package com.cricket.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cricket.common.Util;
import com.cricket.vo.ReportVO;

@Repository
public class ReportDaoImp implements ReportDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ReportVO> getStateWiseReportList() {
		
		Session session = sessionFactory.getCurrentSession();
		String sql = 
				" SELECT s.STATE_NAME, c.CITY_NAME, p.PRODUCT_TYPE, p.PRODUCT_NAME, p.PRODUCT_NO  , " +
				" (SELECT COUNT(1) FROM product_city pc1 WHERE pc1.CITY_ID = c.ID) AS TOTAL_PRODUCT , " +
				" (SELECT COUNT(1) FROM customer_product cp INNER JOIN customer cust ON cust.ZIPFILE = cp.ZIP_FILE " +
				" WHERE cust.CITY_ID = c.ID AND cp.PRODUCT_ID = p.ID) AS TOTAL_INTEREST  " +
				" FROM product_city pc INNER JOIN city c ON pc.CITY_ID = c.ID " +
				" INNER JOIN state s ON s.ID = c.STATE_ID " +
				" inner join product p on p.ID = pc.PRODUCT_ID";
		Query<Object[]> query = session.createSQLQuery(sql);
		List<Object[]>  rows = query.list();

		List<ReportVO> reportVOList = new ArrayList<ReportVO>();
		for(Object[] row : rows)
		{
			ReportVO reportVO = new ReportVO();
			reportVO.setState(Util.convertToString(row[0], ""));
			reportVO.setCity(Util.convertToString(row[1], ""));
			reportVO.setProductType(Util.convertToString(row[2], ""));
			reportVO.setProduct(Util.convertToString(row[3], ""));
			reportVO.setSku(Util.convertToString(row[4], ""));
			reportVO.setTotalProduct(Util.convertToInt(row[5], 0));
			reportVO.setTotalInterest(Util.convertToInt(row[6], 0));
			reportVOList.add(reportVO);
		    
		}
		return reportVOList;
	}

	@Override
	public List<ReportVO> getCityWiseReportList() {
		Session session = sessionFactory.getCurrentSession();
		String sql = 
				" SELECT c.CITY_NAME, p.PRODUCT_TYPE, p.PRODUCT_NAME, p.PRODUCT_NO , "  + 
				" (SELECT COUNT(1) FROM product_city pc1 WHERE pc1.CITY_ID = c.ID) AS TOTAL_PRODUCT , "  +
				" (SELECT COUNT(1) FROM customer_product cp INNER JOIN customer cust ON cust.ZIPFILE = cp.ZIP_FILE "  +
				" WHERE cust.CITY_ID = c.ID AND cp.PRODUCT_ID = p.ID) AS TOTAL_INTEREST  "  +
				" FROM product_city pc INNER JOIN city c ON pc.CITY_ID = c.ID "  +
				" inner join product p on p.ID = pc.PRODUCT_ID";
		Query<Object[]> query = session.createSQLQuery(sql);
		List<Object[]>  rows = query.list();

		List<ReportVO> reportVOList = new ArrayList<ReportVO>();
		for(Object[] row : rows)
		{
			ReportVO reportVO = new ReportVO();
			reportVO.setCity(Util.convertToString(row[0], ""));
			reportVO.setProductType(Util.convertToString(row[1], ""));
			reportVO.setProduct(Util.convertToString(row[2], ""));
			reportVO.setSku(Util.convertToString(row[3], ""));
			reportVO.setTotalProduct(Util.convertToInt(row[4], 0));
			reportVO.setTotalInterest(Util.convertToInt(row[5], 0));
			reportVOList.add(reportVO);
		    
		}
		return reportVOList;
	}

	@Override
	public List<ReportVO> getProductTypeWise() {
		Session session = sessionFactory.getCurrentSession();
		String sql = 
				" SELECT s.STATE_NAME, c.CITY_NAME, p.PRODUCT_TYPE, p.PRODUCT_NAME, p.PRODUCT_NO  , " +
				" (SELECT COUNT(1) FROM customer_product cp INNER JOIN customer cust ON cust.ZIPFILE = cp.ZIP_FILE " +
				" WHERE cust.CITY_ID = c.ID AND cp.PRODUCT_ID = p.ID) AS TOTAL_INTEREST  " +
				" FROM product_city pc INNER JOIN city c ON pc.CITY_ID = c.ID " +
				" INNER JOIN state s ON s.ID = c.STATE_ID " +
				" inner join product p on p.ID = pc.PRODUCT_ID";
		Query<Object[]> query = session.createSQLQuery(sql);
		List<Object[]>  rows = query.list();

		List<ReportVO> reportVOList = new ArrayList<ReportVO>();
		for(Object[] row : rows)
		{
			ReportVO reportVO = new ReportVO();
			reportVO.setState(Util.convertToString(row[0], ""));
			reportVO.setCity(Util.convertToString(row[1], ""));
			reportVO.setProductType(Util.convertToString(row[2], ""));
			reportVO.setProduct(Util.convertToString(row[3], ""));
			reportVO.setSku(Util.convertToString(row[4], ""));
			reportVO.setTotalInterest(Util.convertToInt(row[5], 0));
			reportVOList.add(reportVO);
		    
		}
		return reportVOList;
	}

	@Override
	public List<ReportVO> getProductWise() {
		Session session = sessionFactory.getCurrentSession();
		String sql = 
				" SELECT s.STATE_NAME, c.CITY_NAME, p.PRODUCT_TYPE, p.PRODUCT_NAME, p.PRODUCT_NO  , " +
				" (SELECT COUNT(1) FROM customer_product cp INNER JOIN customer cust ON cust.ZIPFILE = cp.ZIP_FILE " +
				" INNER JOIN city ct ON cust.CITY_ID = ct.ID " +
				" WHERE cp.PRODUCT_ID = p.ID AND ct.STATE_ID = s.ID) AS TOTAL_INTEREST  " +
				" FROM product_city pc INNER JOIN city c ON pc.CITY_ID = c.ID " +
				" INNER JOIN state s ON s.ID = c.STATE_ID " +
				" inner join product p on p.ID = pc.PRODUCT_ID";
		Query<Object[]> query = session.createSQLQuery(sql);
		List<Object[]>  rows = query.list();

		List<ReportVO> reportVOList = new ArrayList<ReportVO>();
		for(Object[] row : rows)
		{
			ReportVO reportVO = new ReportVO();
			reportVO.setState(Util.convertToString(row[0], ""));
			reportVO.setCity(Util.convertToString(row[1], ""));
			reportVO.setProductType(Util.convertToString(row[2], ""));
			reportVO.setProduct(Util.convertToString(row[3], ""));
			reportVO.setSku(Util.convertToString(row[4], ""));
			reportVO.setTotalInterest(Util.convertToInt(row[5], 0));
			reportVOList.add(reportVO);
		    
		}
		return reportVOList;
	}

	@Override
	public List<ReportVO> getScenaioWise() {
		Session session = sessionFactory.getCurrentSession();
		/*
		
		String sql = 
				" SELECT sc.NAME, s.STATE_NAME, c.CITY_NAME, p.PRODUCT_TYPE, p.PRODUCT_NAME, p.PRODUCT_NO  , " +
				" (SELECT COUNT(1) FROM product_city pc1 WHERE pc1.CITY_ID = c.ID) AS TOTAL_PRODUCT , " +
				" (SELECT COUNT(1) FROM customer_product cp INNER JOIN customer cust ON cust.ZIPFILE = cp.ZIP_FILE " +
				" WHERE cp.PRODUCT_ID = p.ID) AS TOTAL_INTEREST  " +
				" FROM product_city pc INNER JOIN city c ON pc.CITY_ID = c.ID " +
				" inner join product p on p.ID = pc.PRODUCT_ID  " +
				" INNER JOIN state s ON s.ID = c.STATE_ID " +
				" inner join product_scenario ps on ps.PRODUCT_ID = p.ID " +
				" LEFT join scenario sc on sc.ID = ps.SCENARIO_ID";
		*/
		String sql = 	
		" SELECT sc.NAME, pc.STATE_NAME,  p.PRODUCT_TYPE, p.PRODUCT_NAME, p.PRODUCT_NO , " + 
		" (SELECT COUNT(1) FROM customer_product cp INNER JOIN customer cust ON cust.ZIPFILE = cp.ZIP_FILE " + 
		" WHERE cp.PRODUCT_ID = p.ID AND sc.ID = cp.SCENARIO_ID) AS TOTAL_INTEREST  " + 
		" FROM (select s.STATE_NAME, pc.PRODUCT_ID from product_city pc " + 
		" inner join  city c on pc.CITY_ID =c.ID  " + 
		" inner join state s on s.ID = c.STATE_ID " + 
		" GROUP by s.STATE_NAME, pc.PRODUCT_ID) pc  " + 
		" inner join product p on p.ID = pc.PRODUCT_ID  " + 
		" inner join product_scenario ps on ps.PRODUCT_ID = p.ID " + 
		" INNER join scenario sc on sc.ID = ps.SCENARIO_ID";
		
		Query<Object[]> query = session.createSQLQuery(sql);
		List<Object[]>  rows = query.list();

		List<ReportVO> reportVOList = new ArrayList<ReportVO>();
		for(Object[] row : rows)
		{
			ReportVO reportVO = new ReportVO();
			reportVO.setScenario(Util.convertToString(row[0], ""));
			reportVO.setState(Util.convertToString(row[1], ""));
			reportVO.setProductType(Util.convertToString(row[2], ""));
			reportVO.setProduct(Util.convertToString(row[3], ""));
			reportVO.setSku(Util.convertToString(row[4], ""));
			reportVO.setTotalInterest(Util.convertToInt(row[5], 0));
			reportVOList.add(reportVO);
		    
		}
		return reportVOList;
	}


}
