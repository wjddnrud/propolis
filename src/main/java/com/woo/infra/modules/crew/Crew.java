package com.woo.infra.modules.crew;

import com.woo.infra.modules.base.Base;

public class Crew extends Base{
	
	/* crew dto */
	private String seq; //crSeq
	private String creator;
	private String crewName;
	private String sports;
	private String location;
	private String crewMemberNum;
	private String startTime;
	private String endTime;
	private String detail;
	private String locationDetail;
	private String playDate;
	private String viewCount;
	private String createDate;
	
	/* crewMember dto */
	private Integer crmmSeq;
	private Integer crLeaderNy;
	private Integer mmSeq;
	private Integer crmmCount;
	
	
	
	private String id;
	private String name;
	
	/* view로 들어갈때 마이페이지에서인지 리스트에서인지 구별하기위해 */
	private Integer fromMyPage;
	
	
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getSports() {
		return sports;
	}
	public void setSports(String sports) {
		this.sports = sports;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getPlayDate() {
		return playDate;
	}
	public void setPlayDate(String playDate) {
		this.playDate = playDate;
	}
	public String getViewCount() {
		return viewCount;
	}
	public void setViewCount(String viewCount) {
		this.viewCount = viewCount;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCrewName() {
		return crewName;
	}
	public void setCrewName(String crewName) {
		this.crewName = crewName;
	}
	public String getCrewMemberNum() {
		return crewMemberNum;
	}
	public void setCrewMemberNum(String crewMemberNum) {
		this.crewMemberNum = crewMemberNum;
	}
	public Integer getCrLeaderNy() {
		return crLeaderNy;
	}
	public void setCrLeaderNy(Integer crLeaderNy) {
		this.crLeaderNy = crLeaderNy;
	}
	public Integer getMmSeq() {
		return mmSeq;
	}
	public void setMmSeq(Integer mmSeq) {
		this.mmSeq = mmSeq;
	}
	public Integer getCrmmSeq() {
		return crmmSeq;
	}
	public void setCrmmSeq(Integer crmmSeq) {
		this.crmmSeq = crmmSeq;
	}
	public Integer getCrmmCount() {
		return crmmCount;
	}
	public void setCrmmCount(Integer crmmCount) {
		this.crmmCount = crmmCount;
	}
	public String getLocationDetail() {
		return locationDetail;
	}
	public void setLocationDetail(String locationDetail) {
		this.locationDetail = locationDetail;
	}
	public Integer getFromMyPage() {
		return fromMyPage;
	}
	public void setFromMyPage(Integer fromMyPage) {
		this.fromMyPage = fromMyPage;
	}
	
	
	
	
}
