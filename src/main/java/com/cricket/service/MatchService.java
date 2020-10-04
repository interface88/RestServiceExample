package com.cricket.service;

import java.util.List;
import java.util.Map;

import com.cricket.model.Match;

public interface MatchService {

	Match getByUuid(Long uuid);
	void save(Match team);
	void update(Match team);
	List<Match> getList(Map<String, String> paramList);
	int deleteByIds(List<String> teamGroups);
}
