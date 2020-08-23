package com.cricket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cricket.dao.ScenarioDao;
import com.cricket.model.Scenario;
import com.cricket.model.State;

@Service
@Transactional(readOnly = true)
public class ScenarioServiceImp implements ScenarioService {

   @Autowired
   private ScenarioDao scenarioDao;

   @Override
   public List<Scenario> list() {
      return scenarioDao.list();
   }
   
   @Override
   public Scenario get(long id) {
      return scenarioDao.get(id);
   }


}
