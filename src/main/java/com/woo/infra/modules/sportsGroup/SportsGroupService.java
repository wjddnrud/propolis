package com.woo.infra.modules.sportsGroup;

import java.util.List;

import com.woo.infra.common.util.BaseVo;
import com.woo.infra.modules.member.Member;



public interface SportsGroupService {
	
	public List<SportsGroup> selectList(SportsGroupVo vo) throws Exception;
	
	public SportsGroup selectOne(SportsGroupVo vo) throws Exception;
	
	public int insert(SportsGroup dto) throws Exception;
	
	public List<SportsGroup> sports(SportsGroup dto) throws Exception;
	
	public List<SportsGroup> MyselectList(SportsGroup sgdto)throws Exception;
	
	public int selectOneCount(BaseVo vo) throws Exception;

	public Member selectMemberImg(Member dto) throws Exception;
	
	public List<SportsGroup> participantList(SportsGroup dto) throws Exception;
	
}
