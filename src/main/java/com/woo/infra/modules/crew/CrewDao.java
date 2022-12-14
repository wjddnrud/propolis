package com.woo.infra.modules.crew;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.woo.infra.common.util.BaseVo;


@Repository

public class CrewDao {

	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.woo.infra.modules.crew.CrewMapper";
	
	public List<Crew> selectList(CrewVo vo) {
		
		return sqlSession.selectList(namespace + ".selectList", vo);
	}
	
	public Crew selectOne(Crew dto) {
		
		Crew selectOne = sqlSession.selectOne(namespace + ".selectOne", dto);
//		System.out.println("dao selectOne : " + selectOne);
		
		return selectOne;
	}
	
	public int insert(Crew dto) {
		
		int insert = sqlSession.insert(namespace + ".insert", dto);
		
		return insert;
	}
	
	public int selectLastSeq() { return sqlSession.selectOne(namespace + ".selectLastSeq", "");}
	
	public int crewImgUpload(Crew dto) {return sqlSession.insert(namespace + ".crewImgUpload", dto);}
	
	public List<Crew> sports(Crew dto) {
		
		List<Crew> sports = sqlSession.selectOne(namespace + ".sports", dto);
		
//		System.out.println("dao sports : " + sports);
		
		return sports;
	}
	
	public List<Crew> MyselectList(Crew crdto) {
		System.out.println("dao getCreator : " + crdto.getCreator());
		List<Crew> MyselectList = sqlSession.selectList(namespace + ".MyselectList", crdto);
		
		return MyselectList;
	}
	
	public int selectOneCount(BaseVo vo) {return sqlSession.selectOne(namespace + ".selectOneCount", vo);}
	
	public List<Crew> crMemberList(Crew dto) {return sqlSession.selectList(namespace + ".crMemberList", dto);}
	
	public int insertCrmm (Crew dto) {return sqlSession.insert(namespace + ".insertCrmm", dto);}
	
	public int joinCheck(Crew dto) {return sqlSession.selectOne(namespace + ".joinCheck", dto);}
	
	public int joinDel(Crew dto) {return sqlSession.delete(namespace + ".joinDel", dto);}
}
