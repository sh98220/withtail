package com.sp.withtail.admin.eventManage;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class EventManage {
	
	private long num;
	private String userId;
	private String nickName;
	private String subject;
	private String content;
	private String startDate;
	private String startDay;
	private String startTime;
	private String endDate;
	private String endDay;
	private String endTime;
	private String winningDate;
	private String winningDay;
	private String winningTime;
	private int enabled;
	private int maxCount;
	private int hitCount;
	private String regDate;
	
	private int rank;
	
	private int applyCount;  // 응모자수
	private int winnerCount; // 당첨자수
	
	private String imageFilename;
	private MultipartFile selectFile;
	
	// 당첨자 발표
	private int winEvent;
	private List<Integer> rankNum;
	private List<Integer> rankCount;
	
	
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
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
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
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
	public String getWinningDate() {
		return winningDate;
	}
	public void setWinningDate(String winningDate) {
		this.winningDate = winningDate;
	}
	public String getWinningDay() {
		return winningDay;
	}
	public void setWinningDay(String winningDay) {
		this.winningDay = winningDay;
	}
	public String getWinningTime() {
		return winningTime;
	}
	public void setWinningTime(String winningTime) {
		this.winningTime = winningTime;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public int getMaxCount() {
		return maxCount;
	}
	public void setMaxCount(int maxCount) {
		this.maxCount = maxCount;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
	public MultipartFile getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}
	public int getApplyCount() {
		return applyCount;
	}
	public void setApplyCount(int applyCount) {
		this.applyCount = applyCount;
	}
	public int getWinnerCount() {
		return winnerCount;
	}
	public void setWinnerCount(int winnerCount) {
		this.winnerCount = winnerCount;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getWinEvent() {
		return winEvent;
	}
	public void setWinEvent(int winEvent) {
		this.winEvent = winEvent;
	}
	public List<Integer> getRankNum() {
		return rankNum;
	}
	public void setRankNum(List<Integer> rankNum) {
		this.rankNum = rankNum;
	}
	public List<Integer> getRankCount() {
		return rankCount;
	}
	public void setRankCount(List<Integer> rankCount) {
		this.rankCount = rankCount;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	
	
		
}