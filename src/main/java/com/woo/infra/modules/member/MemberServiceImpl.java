package com.woo.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao dao;
	
	@Override
	public List<Member> selectList() throws Exception {
		return dao.selectList();
	}

	@Override
	public List<Member> srcList(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println(vo.getShStartDate());
		System.out.println(vo.getShEndDate());

		
		return dao.srcList(vo);
	}
	
}
