package com.woo.infra.modules.comment;

import com.woo.infra.modules.base.Base;

public class Comment extends Base{
	
	private Integer seq;
	private String writer;
	private String create_date;
	private String contents;
	private Integer post_seq;
	
	
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Integer getPost_seq() {
		return post_seq;
	}
	public void setPost_seq(Integer post_seq) {
		this.post_seq = post_seq;
	}
	
	

}
