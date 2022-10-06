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
	
	public Community selectOne(CommunityVo vo) {
		
		System.out.println("dao : " + vo.getShSeq());
		
		Community selectOne = sqlSession.selectOne(namespace + ".selectOne", vo);
		System.out.println("dao selectOne : " + selectOne);
		
		return selectOne;
	}

	
	public int update(Community dto) { return sqlSession.update(namespace + ".update", dto); }
	public int uelete(Community dto) { return sqlSession.update(namespace + ".uelete", dto); }
	public int delete(CommunityVo vo) { return sqlSession.delete(namespace + ".delete", vo); }
	
	

}
