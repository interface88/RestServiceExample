package com.cricket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cricket.dao.BowlerMatchDtlsDao;
import com.cricket.model.BowlerMatchDtls;

@Service
@Transactional
public class BowlerDtlsServiceImpl implements BowlerDtlsService {

	@Autowired
	BowlerMatchDtlsDao bowlerMatchDtlsDao ;

	@Override
	public List<BowlerMatchDtls> getInningsData(Long matchUuid) {
		return bowlerMatchDtlsDao.getInningsData(matchUuid);
	}

	@Override
	public BowlerMatchDtls getInningsBowlerDtls(Long matchUuid, Long playerUuid) {
		return bowlerMatchDtlsDao.getInningsBowlerDtls(matchUuid, playerUuid);
	}

}
