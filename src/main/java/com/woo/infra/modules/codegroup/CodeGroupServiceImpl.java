package com.woo.infra.modules.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeGroupServiceImpl implements CodeGroupService{
	
	@Autowired
	CodeGroupDao dao;
	
//	@Override
//	public List<CodeGroup> selectList(CodeGroupVo vo) throws Exception {
//		return dao.selectList(vo);
//	}
	
	@Override
	public List<CodeGroup> selectList(CodeGroupVo vo) throws Exception {
		List<CodeGroup> list = dao.selectList(vo);
		return list;
	}
	

	@Override
	public List<CodeGroup> search(CodeGroupVo vo) throws Exception {
		
		if(vo.getShUseNY() == null)
			vo.setShUseNY(2);
		
		if(vo.getShDelNY() == null)
			vo.setShDelNY(2);
		
		if(vo.getShDate() == null)
			vo.setShDate(0);
		
		if(vo.getShStartDate() == null)
			vo.setShStartDate("1900-01-01 00:00:00");
		
		if(vo.getShEndDate() == null)
			vo.setShEndDate("2023-12-31 00:00:00");
		
		if(vo.getShValue() == null)
			vo.setShValue("");
		
		if(vo.getShOption() == null)
			vo.setShOption(0);
		
		
		return dao.search(vo);
	}


	@Override
	public int insert(CodeGroup dto) throws Exception {
		int result = dao.insert(dto);
		System.out.println("service result : " + result);
		return result;
	}
	
	
	

}
