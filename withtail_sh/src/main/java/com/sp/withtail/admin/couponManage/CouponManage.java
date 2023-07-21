package com.sp.withtail.admin.couponManage;

import java.util.List;

public class CouponManage {
	private Long couponNum;
	private String startDay;
	private String startTime;
	private String endDay;
	private String endTime;
	private String startDate;
	private String endDate;
	private String couponName;
	private long couponPrice;
	private int couponCategory;
	private long couponMinPrice;
	
	private List<Long> allMember;
	private long memberNum;
	private String userId;
	private long userNum;
	private Long used;
	
	private List<Long> couponMember;
	private List<Long> nocouponMember;
	public Long getCouponNum() {
		return couponNum;
	}
	public void setCouponNum(Long couponNum) {
		this.couponNum = couponNum;
	}
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public long getCouponPrice() {
		return couponPrice;
	}
	public void setCouponPrice(long couponPrice) {
		this.couponPrice = couponPrice;
	}
	public int getCouponCategory() {
		return couponCategory;
	}
	public void setCouponCategory(int couponCategory) {
		this.couponCategory = couponCategory;
	}
	public long getCouponMinPrice() {
		return couponMinPrice;
	}
	public void setCouponMinPrice(long couponMinPrice) {
		this.couponMinPrice = couponMinPrice;
	}
	public List<Long> getAllMember() {
		return allMember;
	}
	public void setAllMember(List<Long> allMember) {
		this.allMember = allMember;
	}
	public long getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(long memberNum) {
		this.memberNum = memberNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public long getUserNum() {
		return userNum;
	}
	public void setUserNum(long userNum) {
		this.userNum = userNum;
	}
	public Long getUsed() {
		return used;
	}
	public void setUsed(Long used) {
		this.used = used;
	}
	public List<Long> getCouponMember() {
		return couponMember;
	}
	public void setCouponMember(List<Long> couponMember) {
		this.couponMember = couponMember;
	}
	public List<Long> getNocouponMember() {
		return nocouponMember;
	}
	public void setNocouponMember(List<Long> nocouponMember) {
		this.nocouponMember = nocouponMember;
	}
	
	
	
}
