package com.woo.infra.modules.code;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CodeDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.woo.infra.modules.code.CodeMapper";
	
	public List<Code> selectList(){ return sqlSession.selectList(namespace + ".selectList",""); }
	
	public List<Code> search(CodeVo vo) { return sqlSession.selectList(namespace + ".search", vo); }
	
	public int insert(Code dto) {
		
//		이 부분 왜 public 다음에 int로 리턴 받아야 하는지 질문하기
		
		int CodeInsert = sqlSession.insert(namespace + ".insert", dto);
		
		return CodeInsert;
		
	}
	
	public Code selectOne(CodeVo vo) { return sqlSession.selectOne(namespace + ".selectOne", vo); }
	
	public int update(Code dto) { return sqlSession.update(namespace + ".update", dto);}
	
//	for cache
	public List<Code> selectListCachedCodeArrayList(){ return sqlSession.selectList(namespace + ".selectListCachedCodeArrayList"); }
	
}
