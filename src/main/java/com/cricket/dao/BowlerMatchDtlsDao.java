package com.cricket.dao;

import java.util.List;

import com.cricket.model.BowlerMatchDtls;

public interface BowlerMatchDtlsDao extends IGenericDao<BowlerMatchDtls> {

	List<BowlerMatchDtls> getInningsData(Long matchUuid);

	BowlerMatchDtls getInningsBowlerDtls(Long matchUuid, Long playerUuid);

}
