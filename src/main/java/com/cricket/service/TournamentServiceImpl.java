package com.cricket.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cricket.dao.IGenericDao;
import com.cricket.model.Tournament;

@Service
@Transactional
public class TournamentServiceImpl implements TournamentService{

	IGenericDao<Tournament> dao;

	@Autowired
	public void setDao(IGenericDao<Tournament> daoToSet) {
		dao = daoToSet;
		dao.setClazz(Tournament.class);
	}

	@Override
	public Tournament getByUuid(Long uuid) {
		return dao.findOne(uuid);
	}

	@Override
	public void save(Tournament tournament) {
		dao.create(tournament);
	}

	@Override
	public void update(Tournament tournament) {
		dao.create(tournament);
	}

	@Override
	public List<Tournament> getList(Map<String, String> paramList) {
		return dao.findAll();
	}
}
