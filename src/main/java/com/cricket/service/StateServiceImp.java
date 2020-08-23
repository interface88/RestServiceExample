package com.cricket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cricket.dao.StateDao;
import com.cricket.model.State;

@Service
@Transactional(readOnly = true)
public class StateServiceImp implements StateService {

   @Autowired
   private StateDao stateDao;

   @Transactional
   @Override
   public long save(State state) {
      return stateDao.save(state);
   }

   @Override
   public State get(long id) {
      return stateDao.get(id);
   }

   @Override
   public List<State> list(String stateName) {
      return stateDao.list(stateName);
   }

   @Transactional
   @Override
   public void update(long id, State state) {
      stateDao.update(id, state);
   }

   @Transactional
   @Override
   public void delete(long id) {
      stateDao.delete(id);
   }

}
