package com.cricket.service;

import java.util.List;
import java.util.Map;

import com.cricket.model.Tournament;

public interface TournamentService {

	Tournament getByUuid(Long uuid);
	void save(Tournament tournament);
	void update(Tournament Tournament);
	List<Tournament> getList(Map<String, String> paramList);
}
