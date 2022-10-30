package com.woo.infra.modules.comment;

import com.woo.infra.common.util.BaseVo;

public class CommentVo extends BaseVo {
	private Integer post_seq;
	private Integer seq;
	
	

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public Integer getPost_seq() {
		return post_seq;
	}

	public void setPost_seq(Integer post_seq) {
		this.post_seq = post_seq;
	}

	
	

}
