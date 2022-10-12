package com.woo.infra.modules.community;

import java.util.List;

public interface CommunityService {
	
	public List<Community> selectList() throws Exception;
	
	public int insert(Community dto) throws Exception;
	
	public Community selectOne(CommunityVo vo) throws Exception;
	
	public int update(Community dto) throws Exception;
	
	public int ulete(Community dto) throws Exception;
	
	public int delete(CommunityVo vo) throws Exception;

	public Community selectCommunityImg(Community dto) throws Exception;
	
}