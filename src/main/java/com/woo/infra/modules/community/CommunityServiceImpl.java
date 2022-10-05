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

	@Override
	public int insert(Community dto) throws Exception {

		/*
		 * if(dto.getWriter() == null) dto.getWriter("writer");
		 */
		
		int insert = dao.insert(dto);
		System.out.println("service insert : " + insert);
		
		return insert;
	}
	
	
}
