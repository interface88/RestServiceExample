package com.cricket.service;

import java.util.List;

import com.cricket.model.BowlerMatchDtls;

public interface BowlerDtlsService {
	List<BowlerMatchDtls> getInningsData(Long matchUuid);

	BowlerMatchDtls getInningsBowlerDtls(Long matchUuid, Long playerUuid);
}
