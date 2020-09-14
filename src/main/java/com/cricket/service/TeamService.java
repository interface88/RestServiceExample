package com.cricket.service;

import java.util.List;
import java.util.Map;

import com.cricket.model.Team;

public interface TeamService {

	Team getByUuid(Long uuid);
	void save(Team team);
	void update(Team team);
	List<Team> getList(Map<String, String> paramList);
}
