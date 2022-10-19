package com.woo.infra.modules.sportsGroup;

import java.util.List;


public interface SportsGroupService {
	
	public List<SportsGroup> selectList() throws Exception;
	
	public SportsGroup selectOne(SportsGroupVo vo) throws Exception;
	
	public int insert(SportsGroup dto) throws Exception;
	
	public List<SportsGroup> sports(SportsGroup dto) throws Exception;
	
	public List<SportsGroup> MyselectList(SportsGroup sgdto)throws Exception;
	
}
