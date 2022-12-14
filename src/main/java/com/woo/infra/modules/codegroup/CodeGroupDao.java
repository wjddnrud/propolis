package com.woo.infra.modules.codegroup;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.woo.infra.common.util.BaseVo;



@Repository
public class CodeGroupDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	@Inject
	@Resource(name = "sqlSessionOracle")
	private SqlSession sqlSessionOracle;
	
	private static String namespace = "com.woo.infra.modules.codegroup.CodeGroupMapper";
	

	
//	public List<CodeGroup> selectList(CodeGroupVo vo){ return sqlSession.selectList(namespace + ".selectList", vo); }
	
	public List<CodeGroup> selectList(CodeGroupVo vo){
//		List<CodeGroup> list = sqlSession.selectList(namespace + ".selectList", vo);
		List<CodeGroup> list = sqlSession.selectList("com.woo.infra.modules.codegroup.CodeGroupMapper.selectList",vo);
		return list;
	}
	
	public List<CodeGroup> search(CodeGroupVo vo){ return sqlSession.selectList(namespace + ".search", vo); }
	
	public int insert(CodeGroup dto) {
		int insert = sqlSession.insert(namespace + ".insert", dto);
		System.out.println("dao insert : " + insert);
		return insert;
	}
	
	public CodeGroup selectOne(CodeGroupVo vo) {
		CodeGroup selectOne = sqlSession.selectOne(namespace + ".selectOne", vo);
		System.out.println("dao selectOne : " + selectOne);
		return selectOne;
	}
	
	public int update(CodeGroup dto) { return sqlSession.update(namespace + ".update", dto); }
	public int uelete(CodeGroup dto) { return sqlSession.update(namespace + ".uelete", dto); }
	public int delete(CodeGroupVo vo) { return sqlSession.delete(namespace + ".delete", vo); }
	
	public List<CodeGroup> selectListWithoutPaging() { return sqlSession.selectList(namespace + ".selectListWithoutPaging", ""); }
	
	public int selectOneCount(BaseVo vo) { return sqlSession.selectOne(namespace + ".selectOneCount", vo); }
	
	
	
	
	
}

