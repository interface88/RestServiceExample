package com.cricket.dao;

import java.util.List;

import com.cricket.model.Scenario;
import com.cricket.model.State;

public interface ScenarioDao {

	List<Scenario> list();
	
	Scenario get(long id);
}
