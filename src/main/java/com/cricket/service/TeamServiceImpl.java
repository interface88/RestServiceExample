package com.cricket.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cricket.dao.IGenericDao;
import com.cricket.model.Team;

@Service
@Transactional
public class TeamServiceImpl implements TeamService {

	IGenericDao<Team> dao;

	@Autowired
	public void setDao(IGenericDao<Team> daoToSet) {
		dao = daoToSet;
		dao.setClazz(Team.class);
	}

	@Override
	public Team getByUuid(Long uuid) {
		return dao.findOne(uuid);
	}

	@Override
	public void save(Team team) {
		dao.create(team);
	}

	@Override
	public void update(Team team) {
		dao.create(team);
	}

	@Override
	public List<Team> getList(Map<String, String> paramList) {
		return dao.findAll();
	}
}
