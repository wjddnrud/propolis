package com.woo.infra.modules.post;

import java.util.List;

public interface PostService {
	
	public List<Post> selectList() throws Exception;

}
