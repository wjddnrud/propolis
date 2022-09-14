package com.woo.infra.modules.codegroup;

public class CodeGroup {

	
	private String seq;
	private String ccg_name;
	private Integer useNY;
	private String xCodeCount;
	private String createDate;
	private String modiDate;
	private Integer delNY;
	
	
	
	public String getxCodeCount() {
		return xCodeCount;
	}
	public void setxCodeCount(String xCodeCount) {
		this.xCodeCount = xCodeCount;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getCcg_name() {
		return ccg_name;
	}
	public void setCcg_name(String ccg_name) {
		this.ccg_name = ccg_name;
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
	public Integer getUseNY() {
		return useNY;
	}
	public void setUseNY(Integer useNY) {
		this.useNY = useNY;
	}
	public Integer getDelNY() {
		return delNY;
	}
	public void setDelNY(Integer delNY) {
		this.delNY = delNY;
	}
	
	
	
}
