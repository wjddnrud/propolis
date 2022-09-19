package com.woo.infra.modules.member;

import java.util.List;

public interface MemberService {

	public List<Member> selectList() throws Exception; 
	
	public List<Member> search(MemberVo vo) throws Exception;
	
	public Member selectOne(MemberVo vo) throws Exception;
	
	public int update(Member dto) throws Exception;
}
