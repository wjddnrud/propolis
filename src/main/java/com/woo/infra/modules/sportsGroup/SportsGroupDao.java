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
	
	public int selectLastSeq() { return sqlSession.selectOne(namespace + ".selectLastSeq", "");}
	
	public int groupImgUpload(SportsGroup dto) {return sqlSession.insert(namespace + ".groupImgUpload", dto);}
	
	public List<SportsGroup> sports(SportsGroup dto) {
		
		List<SportsGroup> sports = sqlSession.selectOne(namespace + ".sports", dto);
		
//		System.out.println("dao sports : " + sports);
		
		return sports;
	}
	
	public List<SportsGroup> MyselectList(SportsGroup sgdto) {
		System.out.println("dao getCreator : " + sgdto.getCreator());
		List<SportsGroup> MyselectList = sqlSession.selectList(namespace + ".MyselectList", sgdto);
		
		return MyselectList;
	}
	
}
