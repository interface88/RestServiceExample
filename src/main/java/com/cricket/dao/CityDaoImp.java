package com.cricket.dao;

import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cricket.model.City;

@Repository
public class CityDaoImp implements CityDao {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  public long save(City city) {
    sessionFactory.getCurrentSession().save(city);
    return city.getId();
  }

  @Override
  public City get(long id) {
    return sessionFactory.getCurrentSession().get(City.class, id);
  }

  @Override
  public List<City> list() {
    Session session = sessionFactory.getCurrentSession();

    CriteriaBuilder cb = session.getCriteriaBuilder();
    CriteriaQuery<City> cq = cb.createQuery(City.class);
    Root<City> root = cq.from(City.class);
    cq.select(root);
    Query<City> query = session.createQuery(cq);
    return query.getResultList();
  }

  @Override
  public void update(long id, City city) {
    Session session = sessionFactory.getCurrentSession();
    City city2 = session.byId(City.class).load(id);
    city2.setCityName(city.getCityName());
    city2.setState(city.getState());
    session.flush();
  }

  @Override
  public void delete(long id) {
    Session session = sessionFactory.getCurrentSession();
    session.createQuery("delete from com.cricket.model.City where id =:id")
        .setParameter("id", id).executeUpdate();
    /*
     * City city = session.byId(City.class).load(id); session.delete(city);
     */
  }

  @Override
  public City cityName(String cityName) {
    Session session = sessionFactory.getCurrentSession();
    Query query =
        session.createQuery("from com.cricket.model.City where cityName = :cityName")
            .setParameter("cityName", cityName);
    City city = (City) query.uniqueResult();
    return city;
  }

}
