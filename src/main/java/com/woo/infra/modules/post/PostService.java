package com.woo.infra.modules.post;

import java.util.List;

public interface PostService {
	
	public List<Post> selectList(PostVo vo) throws Exception;
	
	public List<Post> searchPost(PostVo vo) throws Exception;
	
	public int insert(Post dto) throws Exception;
	
	public Post selectOne(PostVo vo) throws Exception;
	
	public int update(Post dto) throws Exception;
	
	public int ulete(Post dto) throws Exception;
	
	public int delete(PostVo vo) throws Exception;

	public Post selectPostImg(PostVo vo) throws Exception;
	
	public List<Post> MyselectList(Post dto) throws Exception;

	public int selectCountFromCategory(int i) throws Exception;
	
	public int selectCountNewFromCategory(Post dto) throws Exception;
	
	public int selectOneCount(PostVo vo) throws Exception;
	
	public int thumbUp(PostVo vo) throws Exception;
	
	public int thumbDown(PostVo vo) throws Exception;
	
	public List<Post> thumbUpList(PostVo vo) throws Exception;
	
}
