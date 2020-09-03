package com.cricket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cricket.dao.IGenericDao;
import com.cricket.model.BowlingStyle;


@Service
@Transactional(readOnly = true)
public class BowlingStyleServiceImpl implements BowlingStyleService{

	IGenericDao<BowlingStyle> dao;
	
	@Autowired
	   public void setDao(IGenericDao<BowlingStyle> daoToSet) {
	      dao = daoToSet;
	      dao.setClazz(BowlingStyle.class);
	   }
	
	@Override
	public List<BowlingStyle> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

}
