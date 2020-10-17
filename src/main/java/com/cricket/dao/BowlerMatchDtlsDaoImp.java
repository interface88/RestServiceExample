package com.cricket.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.cricket.model.BowlerMatchDtls;

@SuppressWarnings("unchecked")
@Repository
public class BowlerMatchDtlsDaoImp extends GenericHibernateDao<BowlerMatchDtls> implements BowlerMatchDtlsDao  {

	@Override
	public List<BowlerMatchDtls> getInningsData(Long matchUuid) {
		String hql = "FROM BowlerMatchDtls E WHERE E.matchUuid = :matchUuid" ;

		List<BowlerMatchDtls> bowlerMatchDtls = getCurrentSession().createQuery(hql)
			.setParameter("matchUuid", matchUuid).list();

		return bowlerMatchDtls;
	}

	@Override
	public BowlerMatchDtls getInningsBowlerDtls(Long matchUuid, Long playerUuid) {
		Criteria criteria = getCurrentSession().createCriteria(BowlerMatchDtls.class);
        criteria.add(Restrictions.eq("matchUuid", matchUuid));
        criteria.add(Restrictions.eq("playerUuid", playerUuid));
        BowlerMatchDtls bowlerMatchDtl = (BowlerMatchDtls) criteria.uniqueResult();
		return bowlerMatchDtl;
	}




}
