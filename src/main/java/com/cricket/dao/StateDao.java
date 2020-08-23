package com.cricket.dao;

import java.util.List;

import com.cricket.model.State;

public interface StateDao {

   long save(State state);

   State get(long id);

   List<State> list(String stateName);

   void update(long id, State state);

   void delete(long id);

}
