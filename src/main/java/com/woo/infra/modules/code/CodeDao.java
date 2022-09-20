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
	
	public List<Code> selectList(){ 
		return sqlSession.selectList(namespace + ".selectList", ""); 
	}
	
	public int insert(Code dto) {
		int result = sqlSession.insert(namespace + ".insert", dto);
		return result;
	}
	
	public List<Code> search(CodeVo vo) { return sqlSession.selectList(namespace + ".search", vo);}
	
//	for cache
	public List<Code> selectListCachedCodeArrayList(){ return sqlSession.selectList(namespace + ".selectListCachedCodeArrayList"); }
}
