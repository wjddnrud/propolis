package com.woo.infra.modules.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommunityServiceImpl implements CommunityService{
	

	@Autowired
	CommunityDao dao;
	
	@Override
	public List<Community> selectList() throws Exception {
		return dao.selectList();
	}
}
