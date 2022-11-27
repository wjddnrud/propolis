package com.woo.infra.modules.post;

import com.woo.infra.modules.crew.Crew;

public class Post extends Crew {
	
	private String seq;
	private String writer;
	private String title;
	private String contents;
	private String createDate;
	private String modiDate;
	private String viewCount;
	private String category;
	private String MyPostCount;
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getModiDate() {
		return modiDate;
	}
	public void setModiDate(String modiDate) {
		this.modiDate = modiDate;
	}
	public String getViewCount() {
		return viewCount;
	}
	public void setViewCount(String viewCount) {
		this.viewCount = viewCount;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getMyPostCount() {
		return MyPostCount;
	}
	public void setMyPostCount(String myPostCount) {
		MyPostCount = myPostCount;
	}
	
	
	

}
