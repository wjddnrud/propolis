package com.woo.infra.modules.community;

import java.util.List;

public interface CommunityService {
	
	public List<Community> selectList() throws Exception;
	
	public int insert(Community dto) throws Exception;
}
