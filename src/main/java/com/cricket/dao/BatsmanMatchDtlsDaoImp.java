package com.cricket.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.cricket.model.BatsmanMatchDtls;

@SuppressWarnings("unchecked")
@Repository
public class BatsmanMatchDtlsDaoImp extends GenericHibernateDao<BatsmanMatchDtls> implements BatsmanMatchDtlsDao  {

	@Override
	public List<BatsmanMatchDtls> getInningsData(Long matchUuid) {
		String hql = "FROM BatsmanMatchDtls E WHERE E.matchUuid = :matchUuid" ;

		List<BatsmanMatchDtls> batsmanMatchDtls = getCurrentSession().createQuery(hql)
			.setParameter("matchUuid", matchUuid).list();

		return batsmanMatchDtls;
	}

	@Override
	public BatsmanMatchDtls getInningsBatsmanData(Long matchUuid, Long playerUuid) {

		Criteria criteria = getCurrentSession().createCriteria(BatsmanMatchDtls.class);
        criteria.add(Restrictions.eq("matchUuid", matchUuid));
        criteria.add(Restrictions.eq("playerUuid", playerUuid));
        BatsmanMatchDtls batsmanMatchDtl = (BatsmanMatchDtls) criteria.uniqueResult();
		return batsmanMatchDtl;
	}
}
