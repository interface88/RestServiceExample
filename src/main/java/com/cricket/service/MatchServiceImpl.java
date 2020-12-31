package com.cricket.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cricket.dao.IGenericDao;
import com.cricket.model.Match;

@Service
@Transactional
public class MatchServiceImpl implements MatchService {

	IGenericDao<Match> dao;

	@Autowired
	public void setDao(IGenericDao<Match> daoToSet) {
		dao = daoToSet;
		dao.setClazz(Match.class);
	}

	@Override
	public Match getByUuid(Long uuid) {
		return dao.findOne(uuid);
	}

	@Override
	public void save(Match match) {
		dao.create(match);
	}

	@Override
	public void update(Match match) {
		dao.create(match);
	}

	@Override
	public List<Match> getList(Map<String, String> paramList) {
		return dao.findAll(paramList);
	}

	@Override
	public int deleteByIds(List<String> matchs) {
		int rowsDeleted = 0;
		String strUuids = String.join(",", matchs);
		// TODO Auto-generated method stub
		rowsDeleted = dao.deleteSQLQuery("delete from csn_match where uuid not in ("+strUuids+")",strUuids);

		return rowsDeleted;
	}

	@Override
	public void updateInning(Long uuid) {
		Match match = getByUuid(uuid);
		match.setCurrentInning(2);
		dao.create(match);
	}

	@Override
	public void endTheMatch(Match match) {
		dao.create(match);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("match_uuid", match.getUuid());
		dao.executeByNameQuery("sp_upd_match_dtls",paramMap);
	}
}
