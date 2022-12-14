package com.woo.infra.modules.crew;

import java.util.List;

import com.woo.infra.common.util.BaseVo;
import com.woo.infra.modules.member.Member;



public interface CrewService {
	
	public List<Crew> selectList(CrewVo vo) throws Exception;
	
	public Crew selectOne(Crew dto) throws Exception;
	
	public int insert(Crew dto) throws Exception;
	
	public List<Crew> sports(Crew dto) throws Exception;
	
	public List<Crew> MyselectList(Crew sgdto)throws Exception;
	
	public int selectOneCount(BaseVo vo) throws Exception;

	public Member selectMemberImg(Member dto) throws Exception;
	
	public List<Crew> crMemberList(Crew dto) throws Exception;
	
	public int insertCrmm(Crew dto) throws Exception;
	
	
}
