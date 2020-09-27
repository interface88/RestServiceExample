package com.cricket.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class AbstractHibernateDao<T extends Serializable> {
    private Class<T> clazz;

    @Autowired
    SessionFactory sessionFactory;

    public void setClazz(Class< T > clazzToSet){
       this.clazz = clazzToSet;
    }

    public T findOne(long id){
      return getCurrentSession().get(clazz, id);
    }

    public List findAll() {
        return getCurrentSession().createQuery("from " + clazz.getName()).list();
    }

    public T create(T entity) {
        getCurrentSession().saveOrUpdate(entity);
        return entity;
    }

    @SuppressWarnings("unchecked")
	public T update(T entity) {
        return (T) getCurrentSession().merge(entity);
    }

    public void delete(T entity) {
        getCurrentSession().delete(entity);
    }

    public void deleteById(long entityId) {
        T entity = findOne(entityId);
        delete(entity);
    }

    public int deleteQuery(String query,Long uuid) {
    	return getCurrentSession().createQuery(query).setParameter("uuid",uuid).executeUpdate();
    }
    
    public int deleteQuery(String query,String uuids) {
    	
    	return getCurrentSession().createQuery(query).setParameter("uuid",uuids).executeUpdate();
    }
    
    public int deleteSQLQuery(String query,String uuids) {
    	return getCurrentSession().createSQLQuery(query).executeUpdate();
    }
    protected Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }
}
