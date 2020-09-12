package com.cricket.service;

import java.util.List;
import java.util.Map;

import com.cricket.model.Player;

public interface PlayerService {

	Player getByUuid(Long uuid);
	void save(Player player);
	void update(Player player);
	List<Player> getList(Map<String, String> paramList);
}
