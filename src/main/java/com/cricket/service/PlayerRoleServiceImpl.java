package com.cricket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cricket.dao.IGenericDao;
import com.cricket.model.PlayerRole;

@Service
@Transactional(readOnly = true)
public class PlayerRoleServiceImpl implements PlayerRoleService{

	IGenericDao<PlayerRole> dao;
	
	@Autowired
	   public void setDao(IGenericDao<PlayerRole> daoToSet) {
	      dao = daoToSet;
	      dao.setClazz(PlayerRole.class);
	   }
	
	@Override
	public List<PlayerRole> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}
	
}
