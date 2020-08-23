package com.cricket.service;

import java.util.List;

import com.cricket.model.Scenario;
import com.cricket.model.State;

public interface ScenarioService {

	List<Scenario> list();

	Scenario get(long id);
}
