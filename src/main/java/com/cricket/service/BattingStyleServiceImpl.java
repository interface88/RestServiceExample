package com.cricket.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cricket.dao.IGenericDao;
import com.cricket.model.BattingStyle;

@Service
@Transactional(readOnly = true)
public class BattingStyleServiceImpl implements BattingStyleService{

	IGenericDao<BattingStyle> dao;
	
	@Autowired
	   public void setDao(IGenericDao<BattingStyle> daoToSet) {
	      dao = daoToSet;
	      dao.setClazz(BattingStyle.class);
	   }
	
	@Override
	public List<BattingStyle> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}
	
}
