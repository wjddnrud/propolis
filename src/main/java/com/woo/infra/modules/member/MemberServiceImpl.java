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
	public List<Member> search(MemberVo vo) throws Exception {
		
		return dao.search(vo);
		
//		  if(vo.getShGender() == null) vo.setShGender(0);
//		  
//		  if(vo.getShTelecom() == null) vo.setShTelecom(1);
//		  
//		  if(vo.getShWayReg() == null) vo.setShWayReg(3);
//		 
//		  
//		  if(vo.getShStartDate() == null || vo.getShStartDate() == "")
//		  vo.setShStartDate("1900-01-01 00:00:00");
//		  
//		  if(vo.getShEndDate() == null || vo.getShEndDate() == "")
//		  vo.setShEndDate("2023-12-31 00:00:00");
//		 
//		
//		if(vo.getShValue() == null)
//			vo.setShValue("");
//		
//		if(vo.getShOption() == null)
//			vo.setShOption(2);
//		System.out.println("----------------");
//		System.out.println(vo.getShOption());
//		
//		  if(vo.getShDelNY() == null) vo.setShOption(0);
//		  
//		  if(vo.getShDate() == null) vo.setShDate(0);
	}

	@Override
	public Member selectOne(MemberVo vo) throws Exception {
		
		Member selectOne = dao.selectOne(vo);
		
		System.out.println("Service selectOne : " + selectOne);
		
		return selectOne;
	}
	
	

	

	
	
	
	
}
