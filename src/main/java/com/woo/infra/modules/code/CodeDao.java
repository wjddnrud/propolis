package com.woo.infra.modules.code;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.woo.infra.common.util.BaseVo;


@Repository
public class CodeDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.woo.infra.modules.code.CodeMapper";
	
	public List<Code> selectList(CodeVo vo){ 

		System.out.println("dao in vo.getRowNumToShow : " + vo.getRowNumToShow());
		System.out.println("dao in vo.getStartRnumForMysql : " + vo.getStartRnumForMysql());
		
		List<Code> selectList = sqlSession.selectList(namespace + ".selectList",vo);
		System.out.println("dao selectList : " + selectList);
		
		System.out.println("dao out vo.getRowNumToShow : " + vo.getRowNumToShow());
		System.out.println("dao out vo.getStartRnumForMysql : " + vo.getStartRnumForMysql());
		
		
		return selectList;
	}
	
	public List<Code> search(CodeVo vo) { return sqlSession.selectList(namespace + ".search", vo); }
	
	public int insert(Code dto) {
		
//		이 부분 왜 public 다음에 int로 리턴 받아야 하는지 질문하기
		
		int CodeInsert = sqlSession.insert(namespace + ".insert", dto);
		
		return CodeInsert;
		
	}
	
	public List<Code> ccg_name(Code dto) { 
		
		List<Code> ccg_name = sqlSession.selectList(namespace + ".ccg_name", dto);
	  
		return ccg_name; 
	}
	
	public Code selectOne(CodeVo vo) { 
		
		Code selectOne = sqlSession.selectOne(namespace + ".selectOne", vo);
		
		System.out.println("dao selectOne : " + selectOne);
		
		return selectOne;  
				
	}
	
	public int selectOneCount(BaseVo vo) { return sqlSession.selectOne(namespace + ".selectOneCount", vo);}
	
	public int update(Code dto) { return sqlSession.update(namespace + ".update", dto);}
	
//	for cache
	public List<Code> selectListCachedCodeArrayList(){ return sqlSession.selectList(namespace + ".selectListCachedCodeArrayList"); }
	
}
