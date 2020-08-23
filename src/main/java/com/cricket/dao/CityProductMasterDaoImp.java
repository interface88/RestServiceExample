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

import com.cricket.model.CityProductMaster;

@Repository
public class CityProductMasterDaoImp implements CityProductMasterDao {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  public long save(CityProductMaster cityProductMaster) {
    sessionFactory.getCurrentSession().save(cityProductMaster);
    return cityProductMaster.getId();
  }

  @Override
  public List<CityProductMaster> list(long id) {
    Session session = sessionFactory.getCurrentSession();


    String sql =
        " SELECT cp.* FROM product_city as cp INNER JOIN city as c ON CITY_ID = cp.CITY_ID "
            + "INNER JOIN state as s ON s.ID = c.STATE_ID " + "WHERE s.ID = :sid";


    Query query = session.createSQLQuery(sql).addEntity(CityProductMaster.class);
    query.setParameter("sid", id);

    List<CityProductMaster> rows = query.list();
    return rows;
  }

  @Override
  public List<CityProductMaster> list() {
    Session session = sessionFactory.getCurrentSession();

    CriteriaBuilder cb = session.getCriteriaBuilder();
    CriteriaQuery<CityProductMaster> cq = cb.createQuery(CityProductMaster.class);
    Root<CityProductMaster> root = cq.from(CityProductMaster.class);
    cq.select(root);
    Query<CityProductMaster> query = session.createQuery(cq);
    return query.getResultList();
  }


  @Override
  public void update(long id, CityProductMaster cityProductMaster) {
    Session session = sessionFactory.getCurrentSession();
    CityProductMaster cityProductMaster2 = session.byId(CityProductMaster.class).load(id);
    cityProductMaster2.setCity(cityProductMaster.getCity());
    cityProductMaster2.setProduct(cityProductMaster.getProduct());
    session.flush();
  }

  @Override
  public void delete(long id) {
    Session session = sessionFactory.getCurrentSession();
    CityProductMaster cityProductMaster = session.byId(CityProductMaster.class).load(id);
    session.delete(cityProductMaster);
  }

}
