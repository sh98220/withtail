package com.sp.withtail.member;

// 세션에 저장할 정보(아이디, 이름, 권한 등)
public class SessionInfo {
	private long num;
	private String userId;
	private String userName;
	private String nickName;
	private int membership;
	private String email;
	private int animal;
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public int getMembership() {
		return membership;
	}
	public void setMembership(int membership) {
		this.membership = membership;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAnimal() {
		return animal;
	}
	public void setAnimal(int animal) {
		this.animal = animal;
	}
}
