package com.cricket.service;

import java.util.List;

import com.cricket.model.BatsmanMatchDtls;

public interface BatsmanDtlsService {
	List<BatsmanMatchDtls> getInningsData(Long matchUuid);

	BatsmanMatchDtls getInningsBatsmanData(Long matchUuid, Long playerUuid);
}
