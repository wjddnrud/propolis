package com.woo.infra.modules.post;

import com.woo.infra.common.util.BaseVo;

public class PostVo extends BaseVo{
	
	
	//검색 조건
	
	private String shValue;
	private String shOption;
	private Integer shSeq;
	private String shStartDate;
	private String shEndDate;
	private Integer shUseNY;
	private Integer shDelNY;
	private Integer shDate;
	private Integer shCategory;
	
	
	/* post dto에 있는 작성자 이름을 쓰고싶어서 */
	private Integer writer;
	
	/* view로 들어갈때 마이페이지에서인지 리스트에서인지 구별하기위해 */
	private Integer fromMyPage;
	
	
	
	public String getShValue() {
		return shValue;
	}
	public void setShValue(String shValue) {
		this.shValue = shValue;
	}
	public String getShOption() {
		return shOption;
	}
	public void setShOption(String shOption) {
		this.shOption = shOption;
	}
	public String getShStartDate() {
		return shStartDate;
	}
	public void setShStartDate(String shStartDate) {
		this.shStartDate = shStartDate;
	}
	public String getShEndDate() {
		return shEndDate;
	}
	public void setShEndDate(String shEndDate) {
		this.shEndDate = shEndDate;
	}
	public Integer getShUseNY() {
		return shUseNY;
	}
	public void setShUseNY(Integer shUseNY) {
		this.shUseNY = shUseNY;
	}
	public Integer getShDelNY() {
		return shDelNY;
	}
	public void setShDelNY(Integer shDelNY) {
		this.shDelNY = shDelNY;
	}
	public Integer getShDate() {
		return shDate;
	}
	public void setShDate(Integer shDate) {
		this.shDate = shDate;
	}
	public Integer getShSeq() {
		return shSeq;
	}
	public void setShSeq(Integer shSeq) {
		this.shSeq = shSeq;
	}
	public Integer getWriter() {
		return writer;
	}
	public void setWriter(Integer writer) {
		this.writer = writer;
	}
	public Integer getShCategory() {
		return shCategory;
	}
	public void setShCategory(Integer shCategory) {
		this.shCategory = shCategory;
	}
	public Integer getFromMyPage() {
		return fromMyPage;
	}
	public void setFromMyPage(Integer fromMyPage) {
		this.fromMyPage = fromMyPage;
	}
	
	
	

}
