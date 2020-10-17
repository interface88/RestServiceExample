package com.cricket.dao;

import java.util.List;

import com.cricket.model.BatsmanMatchDtls;

public interface BatsmanMatchDtlsDao extends IGenericDao<BatsmanMatchDtls> {

	List<BatsmanMatchDtls> getInningsData(Long matchUuid);

	BatsmanMatchDtls getInningsBatsmanData(Long matchUuid, Long playerUuid);

}
