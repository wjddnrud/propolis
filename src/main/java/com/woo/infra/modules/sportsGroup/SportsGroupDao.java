package com.woo.infra.modules.sportsGroup;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository

public class SportsGroupDao {

	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.woo.infra.modules.sportsGroup.SportsGroupMapper";
	
	public List<SportsGroup> selectList() {
		
		return sqlSession.selectList(namespace + ".selectList", "");
	}
	
	public SportsGroup selectOne(SportsGroupVo vo) {
		
		SportsGroup selectOne = sqlSession.selectOne(namespace + ".selectOne", vo);
		
		return selectOne;
	}
	
	public int insert(SportsGroup dto) {
		
		return sqlSession.insert(namespace + ".insert", dto);
	}
	
}
