package com.woo.infra.modules.sportsGroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.woo.infra.common.util.UtilUpload;

@Service

public class SportsGroupServiceImpl implements SportsGroupService{
	
	@Autowired
	SportsGroupDao dao;

	@Override
	public List<SportsGroup> selectList() throws Exception {
		
		System.out.println("selectList : " + dao.selectList());
		
		return dao.selectList();
	}

	@Override
	public SportsGroup selectOne(SportsGroupVo vo) throws Exception {
		
		SportsGroup selectOne = dao.selectOne(vo);
		
//		System.out.println("selectOne dao : " + selectOne);
		
		return selectOne;
	}

	@Override
	public int insert(SportsGroup dto) throws Exception {

		int insert = dao.insert(dto);
		System.out.println("multipartfile : " + dto.getMultipartFile());
		
        int pSeq = dao.selectLastSeq();
        System.out.println("selectLastSeq : " + pSeq);

        int j = 0;
        for(MultipartFile myFile : dto.getMultipartFile()) {

            if(!myFile.isEmpty()) {
                // postServiceImpl
                String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
                UtilUpload.uploadSportsGroupImg(myFile, pathModule, dto);

                dto.setType(2);
                dto.setDefaultNY(j == 0 ? 1 : 0);
                dto.setSort(j+1);
                dto.setpSeq(pSeq);
//                업데이트하려면 pSeq말고 dto 담아서 레츠기릿

                dao.groupImgUpload(dto);
                j++;
            }

        }
		
		return insert;
	}
	
	@Override
	public List<SportsGroup> sports(SportsGroup dto) throws Exception {
		
		List<SportsGroup> sports = dao.sports(dto);
		
		return sports;
	}

	@Override
	public List<SportsGroup> MyselectList(SportsGroup sgdto) throws Exception {
		
		List<SportsGroup> MyselectList = dao.MyselectList(sgdto);
		
		return MyselectList;
	}
	
}
