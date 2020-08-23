package com.cricket.dao;

import java.math.BigInteger;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cricket.model.Customer;

@Repository
public class CustomerDaoImp implements CustomerDao {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  public long save(Customer customer) {
    sessionFactory.getCurrentSession().save(customer);
    return customer.getId();
  }

  @Override
  public Customer get(long id) {
    return sessionFactory.getCurrentSession().get(Customer.class, id);
  }

  @Override
  public List<Customer> list() {
    Session session = sessionFactory.getCurrentSession();

    CriteriaBuilder cb = session.getCriteriaBuilder();
    CriteriaQuery<Customer> cq = cb.createQuery(Customer.class);
    Root<Customer> root = cq.from(Customer.class);
    cq.select(root);
    Query<Customer> query = session.createQuery(cq);
    return query.getResultList();
  }

  @Override
  public List<Customer> listByParam(String startDate, String endDate) {
    Session session = sessionFactory.getCurrentSession();

    String sql =
        " SELECT * FROM customer c WHERE c.CREATED_DATE BETWEEN STR_TO_DATE(:startDate,'%d-%m-%Y') "
            + " AND STR_TO_DATE(:endDate,'%d-%m-%Y')";

    Query query = session.createSQLQuery(sql).addEntity(Customer.class);
    query.setParameter("startDate", startDate);
    query.setParameter("endDate", endDate);
    List<Customer> rows = query.list();
    return rows;
    // STR_TO_DATE(yourdatefield, '%m/%d/%Y')
  }

  @Override
  public void update(long id, Customer customer) {
    Session session = sessionFactory.getCurrentSession();
    Customer customer2 = session.byId(Customer.class).load(id);
    customer2.setCustomerName(customer.getCustomerName());
    customer2.setEmail(customer.getEmail());
    customer2.setPhone(customer.getPhone());
    customer2.setCity(customer.getCity());
    session.flush();
  }

  @Override
  public void delete(long id) {
    Session session = sessionFactory.getCurrentSession();
    Customer customer = session.byId(Customer.class).load(id);
    session.delete(customer);
  }

  @Override
  public void addProduct(String zipFile, Long productId, Long scenarioId) {
    Session session = sessionFactory.getCurrentSession();
    String queryString =
        "SELECT Count(1) FROM customer_product where ZIP_FILE = :zipFile and PRODUCT_ID = :productId AND SCENARIO_ID = :scenarioId";
    Query countQuery = session.createNativeQuery(queryString);
    countQuery.setParameter("zipFile", zipFile);
    countQuery.setParameter("productId", productId);
    countQuery.setParameter("scenarioId", scenarioId);
    BigInteger cnt = (BigInteger) countQuery.getSingleResult();
    if (cnt.equals(BigInteger.ZERO)) {
      Query query =
          session
              .createSQLQuery("INSERT INTO customer_product (ZIP_FILE, PRODUCT_ID, SCENARIO_ID) VALUES (:zipFile,:productId,:scenarioId)");
      query.setParameter("zipFile", zipFile);
      query.setParameter("productId", productId);
      query.setParameter("scenarioId", scenarioId);
      query.executeUpdate();
    }
    /*
     * String queryString1 =
     * "SELECT Count(1) FROM customer_scenario where ZIP_FILE = :zipFile and SCENARIO_ID = :scenarioId "
     * ; Query countQuery1 = session.createNativeQuery(queryString1);
     * countQuery1.setParameter("zipFile", zipFile); countQuery1.setParameter("scenarioId",
     * scenarioId); BigInteger count = (BigInteger) countQuery1.getSingleResult();
     * if(cnt.equals(BigInteger.ZERO)){ Query query1 = session.createSQLQuery(
     * "INSERT INTO `customer_scenario` (`ZIP_FILE`, `SCENARIO_ID`) VALUES (:zipFile,:scenarioId)");
     * query1.setParameter("zipFile", zipFile); query1.setParameter("scenarioId", scenarioId);
     * query1.executeUpdate(); }
     */

  }

  @Override
  public List<String> getInterestedProductList(Long customerId) {
    Session session = sessionFactory.getCurrentSession();
    String queryString =
        "SELECT p.PRODUCT_NAME FROM customer_product cp INNER JOIN product p ON cp.PRODUCT_ID = p.ID "
            + " INNER JOIN customer c ON cp.ZIP_FILE = c.ZIPFILE WHERE c.ID = :customerId ";
    Query query = session.createNativeQuery(queryString);
    query.setParameter("customerId", customerId);
    List<String> productNameList = query.list();
    return productNameList;
  }

  @Override
  public List<String> getInterestedScenarioList(Long customerId) {
    Session session = sessionFactory.getCurrentSession();
    String queryString =
        "SELECT p.NAME FROM customer_product cp INNER JOIN scenario p ON cp.SCENARIO_ID = p.ID "
            + " INNER JOIN customer c ON cp.ZIP_FILE = c.ZIPFILE WHERE c.ID = :customerId ";
    Query query = session.createNativeQuery(queryString);
    query.setParameter("customerId", customerId);
    List<String> scenarioNameList = query.list();
    return scenarioNameList;
  }

}
