package com.woo.infra.modules.sportsGroup;

import java.util.List;

public interface SportsGroupService {
	
	public List<SportsGroup> selectList() throws Exception;
	
	public SportsGroup selectOne(SportsGroupVo vo) throws Exception;

}
