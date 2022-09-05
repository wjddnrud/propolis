package com.woo.infra.modules.code2;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Code2ServiceImpl implements Code2Service {

	@Autowired 
	
	Code2Dao dao;
	
	@Override
	public List<Code2> selectList() throws Exception {
		return dao.selectList();
	}
}
