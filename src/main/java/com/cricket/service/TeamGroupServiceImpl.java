package com.cricket.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

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

	public int deleteByIds(List<String> teamGroups) {
		int rowsDeleted = 0;
		String strUuids = String.join(",", teamGroups);
		// TODO Auto-generated method stub
		rowsDeleted = dao.deleteSQLQuery("delete from csn_team_group where uuid not in ("+strUuids+")",strUuids);
		
		return rowsDeleted;
	}
}
