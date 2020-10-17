package com.cricket.dao;

import org.springframework.stereotype.Repository;

import com.cricket.model.Scorebook;

@Repository
public class ScoreBookDaoImp extends GenericHibernateDao<Scorebook> implements ScoreBookDao  {

}
