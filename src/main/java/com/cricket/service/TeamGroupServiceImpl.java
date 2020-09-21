package com.cricket.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cricket.dao.IGenericDao;
import com.cricket.model.TeamGroup;

@Service
@Transactional
public class TeamGroupServiceImpl implements TeamGroupService{

	IGenericDao<TeamGroup> dao;

	@Autowired
	public void setDao(IGenericDao<TeamGroup> daoToSet) {
		dao = daoToSet;
		dao.setClazz(TeamGroup.class);
	}

	@Override
	public TeamGroup getByUuid(Long uuid) {
		return dao.findOne(uuid);
	}

	@Override
	public void save(TeamGroup teamGroup) {
		dao.create(teamGroup);
	}

	@Override
	public void update(TeamGroup teamGroup) {
		dao.create(teamGroup);
	}

	@Override
	public List<TeamGroup> getList(Map<String, String> paramList) {
		return dao.findAll();
	}
}
