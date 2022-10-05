package com.woo.infra.modules.community;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository

public class CommunityDao {
	
	@Inject
	@Resource(name = "sqlSession")

	private SqlSession sqlSession;
	
	private static String namespace = "com.woo.infra.modules.community.CommunityMapper";
	
	public List<Community> selectList() {
		
		List<Community> selectList = sqlSession.selectList(namespace + ".selectList", "");
		
		return selectList;
	}
	
	public int insert(Community dto) {
		
		
		int insert = sqlSession.insert(namespace + ".insert", dto);
		
		System.out.println("dao insert : " + insert);
		
		return insert;
	}
	
	

}
