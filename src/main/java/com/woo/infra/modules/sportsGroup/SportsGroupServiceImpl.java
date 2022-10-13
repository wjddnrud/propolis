package com.woo.infra.modules.sportsGroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class SportsGroupServiceImpl implements SportsGroupService{
	
	@Autowired
	SportsGroupDao dao;

	@Override
	public List<SportsGroup> selectList() throws Exception {
		
		return dao.selectList();
	}

	@Override
	public SportsGroup selectOne(SportsGroupVo vo) throws Exception {
		
		SportsGroup selectOne = dao.selectOne(vo);
		
		System.out.println("selectOne dao : " + selectOne);
		
		return selectOne;
	}

	@Override
	public int insert(SportsGroup dto) throws Exception {
		int insert = dao.insert(dto);
		return insert;
	}

	@Override
	public int sports(SportsGroup dto) throws Exception {
		
		int sports = dao.sports(dto);
		
		return sports;
	}
	
	
	
	
	
	
	
	

}
