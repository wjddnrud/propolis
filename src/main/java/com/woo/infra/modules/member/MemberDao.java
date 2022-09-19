package com.woo.infra.modules.member;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.woo.infra.modules.member.MemberMapper";
	
	public List<Member> selectList(){ return sqlSession.selectList(namespace + ".selectList",""); }
	
	public List<Member> search(MemberVo vo){ return sqlSession.selectList(namespace + ".search", vo); }
	
	public Member selectOne(MemberVo vo) { 
		
		Member selectOne = sqlSession.selectOne(namespace + ".selectOne", vo);
		
		System.out.println("dao.selectOne : " + selectOne);
		
		return selectOne;
		
	}
	
	public int update(Member dto) {
		
		int update = sqlSession.update(namespace + ".update", dto);
		
		return update;
	}
	
	
}
