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
//		System.out.println("dao selectOne : " + selectOne);
		
		return selectOne;
	}
	
	public int insert(SportsGroup dto) {
		
		int insert = sqlSession.insert(namespace + ".insert", dto);
		
		return insert;
	}
	
	public int selectLastSeq() throws Exception{ return sqlSession.selectOne(namespace + ".selectLastSeq", "");}
	
	public int groupImgUpload(SportsGroup dto) throws Exception {return sqlSession.insert(namespace + ".groupImgUpload", dto);}
	
	public List<SportsGroup> sports(SportsGroup dto) {
		
		List<SportsGroup> sports = sqlSession.selectOne(namespace + ".sports", dto);
		
//		System.out.println("dao sports : " + sports);
		
		return sports;
	}
	
}
