package com.cricket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cricket.dao.BatsmanMatchDtlsDao;
import com.cricket.model.BatsmanMatchDtls;

@Service
@Transactional
public class BatsmanDtlsServiceImpl implements BatsmanDtlsService {

	@Autowired
	BatsmanMatchDtlsDao batsmanMatchDtlsDao;

	@Override
	public List<BatsmanMatchDtls> getInningsData(Long matchUuid) {
		return batsmanMatchDtlsDao.getInningsData(matchUuid);
	}

	@Override
	public BatsmanMatchDtls getInningsBatsmanData(Long matchUuid, Long playerUuid) {
		return batsmanMatchDtlsDao.getInningsBatsmanData(matchUuid, playerUuid);
	}

}
