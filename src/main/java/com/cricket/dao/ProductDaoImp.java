package com.cricket.dao;

import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cricket.model.Product;
import com.cricket.model.User;

@Repository
public class ProductDaoImp implements ProductDao {

   @Autowired
   private SessionFactory sessionFactory;

   @Override
   public long save(Product product) {
      sessionFactory.getCurrentSession().save(product);
      return product.getId();
   }

   @Override
   public Product get(long id) {
      return sessionFactory.getCurrentSession().get(Product.class, id);
   }

   @Override
   public List<Product> list() {
      Session session = sessionFactory.getCurrentSession();
      
      CriteriaBuilder cb = session.getCriteriaBuilder();
      CriteriaQuery<Product> cq = cb.createQuery(Product.class);
      Root<Product> root = cq.from(Product.class);
      cq.select(root);
      Query<Product> query = session.createQuery(cq);
      return query.getResultList();
   }

   @Override
   public void update(long id, Product product) {
      Session session = sessionFactory.getCurrentSession();
      session.merge(product);
      session.flush();
   }

   @Override
   public void delete(long id) {
      Session session = sessionFactory.getCurrentSession();
      Product product = session.byId(Product.class).load(id);
      session.delete(product);
   }

	@Override
	public List<Product> list(Map<String, String> paramList) {

		Session session = sessionFactory.getCurrentSession();
		String cityName = paramList.get("cityName");
		String productType = paramList.get("productType");
		/*
		String hql = "from com.cricket.model.Product as product where product.cityList.cityName = :cityName ";
		Query query = session.createQuery(hql);
		List<Product>  productList = query.list();
		return productList;
		*/
		String sql = " SELECT p.* FROM product as p INNER JOIN product_city as pc ON pc.PRODUCT_ID = p.ID " +
				" INNER JOIN city as c ON pc.CITY_ID = c.ID " +
				" WHERE UPPER(c.CITY_NAME) = UPPER(:cityName) ";
		if(productType != null){
			sql = sql + " and UPPER(p.PRODUCT_TYPE) =  UPPER(:productType)";
		}
		
		Query query = session.createSQLQuery(sql).addEntity(Product.class);
		query.setParameter("cityName", cityName);
		if(productType != null){
			query.setParameter("productType", productType);
		}
		List<Product> rows = query.list();
		return rows;
	}

}
