package com.woo.infra.modules.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeGroupServiceImpl implements CodeGroupService{
	
	@Autowired
	CodeGroupDao dao;
	
	@Override
	public List<CodeGroup> selectList(CodeGroupVo vo) throws Exception {
		return dao.selectList(vo);
	}

	@Override
	public List<CodeGroup> srcList(CodeGroupVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.srcList(vo);
	}
	
	

}
