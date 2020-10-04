package com.cricket.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cricket.dao.IGenericDao;
import com.cricket.model.Scorebook;

@Service
@Transactional(readOnly = true)
public class ScorebookServiceImpl implements ScorebookService{

	IGenericDao<Scorebook> dao;

	@Autowired
	   public void setDao(IGenericDao<Scorebook> daoToSet) {
	      dao = daoToSet;
	      dao.setClazz(Scorebook.class);
	   }

	@Override
	public void save(Scorebook scorebook) {
		dao.create(scorebook);
	}

}
