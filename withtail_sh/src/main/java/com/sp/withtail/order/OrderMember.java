package com.sp.withtail.order;

public class OrderMember {
	private String userId;
	private String userName;
	private String nickName;
	private String email;
	
	// 포인트
	private int point;
	
	// 배송지 목록
	private Long addNum;
	private String addr1;
	private String addr2;
	private String zip;
	private String tel;
	private String memo;
	private String addDef;
	private String addName;
	
	// 쿠폰 목록
	private Long couponNum;
	private String startDate;
	private String endDate;
	private String couponName;
	private int couponPrice;
	private int couponCategory;
	private int couponMinPrice;
	private int used;
	
	private int couponCount;

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Long getAddNum() {
		return addNum;
	}

	public void setAddNum(Long addNum) {
		this.addNum = addNum;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getAddDef() {
		return addDef;
	}

	public void setAddDef(String addDef) {
		this.addDef = addDef;
	}

	public String getAddName() {
		return addName;
	}

	public void setAddName(String addName) {
		this.addName = addName;
	}

	public Long getCouponNum() {
		return couponNum;
	}

	public void setCouponNum(Long couponNum) {
		this.couponNum = couponNum;
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

	public int getCouponPrice() {
		return couponPrice;
	}

	public void setCouponPrice(int couponPrice) {
		this.couponPrice = couponPrice;
	}

	public int getCouponCategory() {
		return couponCategory;
	}

	public void setCouponCategory(int couponCategory) {
		this.couponCategory = couponCategory;
	}

	public int getCouponMinPrice() {
		return couponMinPrice;
	}

	public void setCouponMinPrice(int couponMinPrice) {
		this.couponMinPrice = couponMinPrice;
	}

	public int getUsed() {
		return used;
	}

	public void setUsed(int used) {
		this.used = used;
	}

	public int getCouponCount() {
		return couponCount;
	}

	public void setCouponCount(int couponCount) {
		this.couponCount = couponCount;
	}
	
	
	
}
