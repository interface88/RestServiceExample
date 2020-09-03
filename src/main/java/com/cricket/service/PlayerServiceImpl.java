package com.cricket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cricket.dao.IGenericDao;
import com.cricket.model.Player;

@Service
@Transactional
public class PlayerServiceImpl implements PlayerService{

	IGenericDao<Player> dao;
	
	@Autowired
	   public void setDao(IGenericDao<Player> daoToSet) {
	      dao = daoToSet;
	      dao.setClazz(Player.class);
	   }
	@Override
	public void save(Player player) {
		dao.create(player);
	}

	@Override
	public void update(Player player) {
		dao.create(player);
	}
}
