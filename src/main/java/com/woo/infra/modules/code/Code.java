package com.woo.infra.modules.code;

import java.util.ArrayList;
import java.util.List;

public class Code {

	private String seq;
	private String cc_name;
	private String useNY;
	private String delNY;
	private String cc_key;
	private String ccg_seq;
	private String createDate;
	private String modiDate;
	
//	for cache
	public static List<Code> cachedCodeArrayList = new ArrayList<Code>();
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getCc_name() {
		return cc_name;
	}
	public void setCc_name(String cc_name) {
		this.cc_name = cc_name;
	}
	public String getUseNY() {
		return useNY;
	}
	public void setUseNY(String useNY) {
		this.useNY = useNY;
	}
	public String getCc_key() {
		return cc_key;
	}
	public void setCc_key(String cc_key) {
		this.cc_key = cc_key;
	}
	public String getCcg_seq() {
		return ccg_seq;
	}
	public void setCcg_seq(String ccg_seq) {
		this.ccg_seq = ccg_seq;
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
	public String getDelNY() {
		return delNY;
	}
	public void setDelNY(String delNY) {
		this.delNY = delNY;
	}
	
	
	
	
}
