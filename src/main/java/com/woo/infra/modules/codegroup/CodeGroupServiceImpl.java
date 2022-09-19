package com.woo.infra.modules.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woo.infra.modules.paging.BaseVo;



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
		
//		if(vo.getShUseNY() == null)
//			vo.setShUseNY(1);
//		
//		if(vo.getShDelNY() == null)
//			vo.setShDelNY(0);
//		
//		if(vo.getShDate() == null)
//			vo.setShDate(0);
//		
//		if(vo.getShStartDate() == null || vo.getShStartDate() == "")
//			vo.setShStartDate("1900-01-01 00:00:00");
//		
//		if(vo.getShEndDate() == null || vo.getShEndDate() == "")
//			vo.setShEndDate("2023-12-31 00:00:00");
//		
//		if(vo.getShValue() == null)
//			vo.setShValue("");
//		
//		if(vo.getShOption() == null)
//			vo.setShOption(0);
		
		/*
		 * System.out.println("------------------------------");
		 * System.out.println(vo.getShStartDate());
		 * System.out.println("------------------------------");
		 */
		
		return dao.search(vo);
	}


	@Override
	public int insert(CodeGroup dto) throws Exception {
		
//		delNY가 null값일때 N으로 default값 정해주기
		if(dto.getDelNY() == null)
			dto.setDelNY(0);
		
		int result = dao.insert(dto);
		
		System.out.println("service result : " + result);
	
		
		return result;
	}


	@Override
	public CodeGroup selectOne(CodeGroupVo vo) throws Exception {
		
		CodeGroup result = dao.selectOne(vo);
		System.out.println("service result : " + result);
		return result;
	}


	@Override
	public int update(CodeGroup dto) throws Exception {
		return dao.update(dto);
	}


	@Override
	public int uelete(CodeGroup dto) throws Exception {
		return dao.uelete(dto);
	}


	@Override
	public int delete(CodeGroupVo vo) throws Exception {
		return dao.delete(vo);
	}


	@Override
	public List<CodeGroup> selectListWithoutPaging(CodeGroupVo vo) throws Exception {
		return dao.selectListWithoutPaging();
	}


	@Override
	public int selectOneCount(BaseVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}






}
