package com.cricket.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.cricket.model.TeamGroup;
import com.cricket.model.Tournament;

public interface TeamGroupService {

	TeamGroup getByUuid(Long uuid);
	void save(TeamGroup teamGroup);
	void update(TeamGroup teamGroup);
	List<TeamGroup> getList(Map<String, String> paramList);
	int deleteByIds(List<String> teamGroups);
}
