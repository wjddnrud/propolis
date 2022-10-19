package com.woo.infra.modules.base;

import org.springframework.web.multipart.MultipartFile;

public class Base {
	
	private Integer type;
	private Integer defaultNY;
	private Integer sort;
	private String originalName;
	private String uuidName;
	private String ext;
	private String size;
	private String delNY;
	private String path;
	private Integer pSeq;    //parents seq 마스터 테이블을 잡아주는 seq
	
	private MultipartFile[] multipartFile;
	
	
	public String getOriginalName() {
		return originalName;
	}
	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}
	public String getUuidName() {
		return uuidName;
	}
	public void setUuidName(String uuidName) {
		this.uuidName = uuidName;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getDelNY() {
		return delNY;
	}
	public void setDelNY(String delNY) {
		this.delNY = delNY;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public MultipartFile[] getMultipartFile() {
		return multipartFile;
	}
	public void setMultipartFile(MultipartFile[] multipartFile) {
		this.multipartFile = multipartFile;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getDefaultNY() {
		return defaultNY;
	}
	public void setDefaultNY(Integer defaultNY) {
		this.defaultNY = defaultNY;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public Integer getpSeq() {
		return pSeq;
	}
	public void setpSeq(Integer pSeq) {
		this.pSeq = pSeq;
	}
	

	
	
}
