package com.woo.infra.modules.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.woo.infra.common.util.UtilUpload;

@Service
public class PostServiceImpl implements PostService{
	

	@Autowired
	PostDao dao;
	
	@Override
	public List<Post> selectList(PostVo vo) throws Exception {
		return dao.selectList(vo);
	}

	@Override
	public int insert(Post dto) throws Exception {

		int insert = dao.insert(dto);
//		System.out.println("service insert : " + insert);
		
		
        int pSeq = dao.selectLastSeq();
//        System.out.println("dao.selectLastSeq : " + dao.selectLastSeq());

        int j = 0;
        for(MultipartFile myFile : dto.getMultipartFile()) {

            if(!myFile.isEmpty()) {
                // postServiceImpl
                String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
                UtilUpload.uploadPostImg(myFile, pathModule, dto);

                dto.setType(2);
                dto.setDefaultNY(j == 0 ? 1 : 0);
                dto.setSort(j+1);
                dto.setpSeq(pSeq);

                dao.insertPostUpload(dto);
                j++;
            }

        }
		
		return insert;
	}

	@Override
	public Post selectOne(PostVo vo) throws Exception {
		
//		System.out.println("service : " + vo.getShSeq());
		
		Post selectOne = dao.selectOne(vo);
		
//		System.out.println("service selectOne : " + selectOne);
		
		return selectOne;
	}

	@Override
	public int update(Post dto) throws Exception {
		
		return dao.update(dto);
	}

	@Override
	public int ulete(Post dto) throws Exception {
		
		return dao.uelete(dto);
	}

	@Override
	public int delete(PostVo vo) throws Exception {
		
		return dao.delete(vo);
	}

	@Override
	public Post selectPostImg(PostVo vo) throws Exception {

		return dao.selectPostImg(vo);
	}

	@Override
	public List<Post> MyselectList(Post dto) throws Exception {
		
		System.out.println("getSeq : " + dto.getSeq());
		
		return dao.MyselectList(dto);
	}

	@Override
	public int selectCountFromCategory(int i) throws Exception {
		return dao.selectCountFromCategory(i);
	}

	@Override
	public int selectCountNewFromCategory(Post dto) throws Exception {
		
		return dao.selectCountNewFromCategory(dto);
	}

	@Override
	public int selectOneCount(PostVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}

	@Override
	public int thumbUp(PostVo vo) throws Exception {
		
		return dao.thumbUp(vo);
	}

	@Override
	public int thumbDown(PostVo vo) throws Exception {
		
		return dao.thumbDown(vo);
	}

	@Override
	public List<Post> thumbUpList(PostVo vo) throws Exception {
		
		return dao.thumbUpList(vo);
	}

	@Override
	public List<Post> searchPost(PostVo vo) throws Exception {
		
		return dao.searchPost(vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	


	
	
	
	
	
	
	
	
}
