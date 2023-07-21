package com.sp.withtail.order;

import java.util.List;

public class Order {
	/* 상품 */
	private long itemNum;
	private String itemName;
	private int discount;
	private String itemContent;
	private String regDate;
	private String updDate;
	private String madeby;
	private int deliveryFee;
	private int itemPrice;
	private int showNotice;
	private int itemPoint;
	private String mainImage;
	
	private int saleAmount; // 할인돼서 빠지는 가격
	private int dcPrice; // 할인된 가격
	
	/*옵션*/
	private Long option1Num;
	private String option1Name;
	private Long parent;
	private Long option1Num2;
	private String option1Name2;
	
	private Long option2Num;
	private String option2Name;
	
	private int extraPrice;
	private int extraPrice2;
	private int coupon;
	
	/*장바구니*/
	private long cartNum;
	private String userId;
	private int quantity;
	private String cartRegDate;
	
	private Long option2Num2;
	private String option2Name2;
	
	private List<Long> option2Nums;
	private List<Long> option2Nums2;
	private List<String> option2Names;
	private List<String> option2Names2;
	
	/*장바구니 및 바로결제 추가 리스트*/
	private List<Long> itemNums;
	private List<Long> subNums;
	private List<Long> subNums2;
	private List<Integer> qtys;
	
	/*장바구니 토탈*/
	private int cartTotalQty;
	private int cartTotalPrice;
	
	/*주문*/
	private long orderNum; // 주문번호
	private int totalOriPrice; // 총 원가
	private int totalPurchasePrice; // 총 결제 금액
	private String purchaseDate; // 구매날짜
	private Integer orderState; // 주문 상태
	private String orderStateDate; // 주문 상태 날짜
	private int usedCoupon; // 쿠폰 사용금액
	private int usedPoint; // 포인트 사용금액
	private int deliveryCharge; // 배송비
	
	/*주문상세*/
	private long orderDetailNum; // 주문상세번호
	private int count; // 개수
	private int price; // 정가
	private int salePrice; // 할인판매액
	private int purchaseMoney; // 상품 구매금액(할인판매액*개수)
	private int savePoint; // 적립금
	
	private List<Integer> purchaseMoneys; // 상품 구매금액(할인판매액*개수) 리스트
	private List<Integer> prices; // 정가 리스트
	private List<Integer> salePrices; // 할인판매액 리스트
	private List<Integer> savePoints; // 적립금 리스트
	
	/*주문 배송지*/
	private String addr1;
	private String addr2;
	private String zip;
	private String tel;
	private String memo;
	private String orderName;
	
	/*결제 내역*/
	private String payMethod; // 결제구분(결제수단)
	private String cardName; // 결제카드
	private String authNumber; // 승인번호
	private String authDate; // 승인날짜
	
	/*쿠폰*/
	private Long couponNum;
	private int used;
	private Long usedCouponNum;
	
	/*포인트*/
	private int point;
	private int pointNum;
	private int pointChk;
	private int amount;
	private String pointRegDate;
	private int balance;
	
	public long getItemNum() {
		return itemNum;
	}
	public void setItemNum(long itemNum) {
		this.itemNum = itemNum;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getItemContent() {
		return itemContent;
	}
	public void setItemContent(String itemContent) {
		this.itemContent = itemContent;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getUpdDate() {
		return updDate;
	}
	public void setUpdDate(String updDate) {
		this.updDate = updDate;
	}
	public String getMadeby() {
		return madeby;
	}
	public void setMadeby(String madeby) {
		this.madeby = madeby;
	}
	public int getDeliveryFee() {
		return deliveryFee;
	}
	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public int getShowNotice() {
		return showNotice;
	}
	public void setShowNotice(int showNotice) {
		this.showNotice = showNotice;
	}
	public int getItemPoint() {
		return itemPoint;
	}
	public void setItemPoint(int itemPoint) {
		this.itemPoint = itemPoint;
	}
	public String getMainImage() {
		return mainImage;
	}
	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}
	public int getSaleAmount() {
		return saleAmount;
	}
	public void setSaleAmount(int saleAmount) {
		this.saleAmount = saleAmount;
	}
	public int getDcPrice() {
		return dcPrice;
	}
	public void setDcPrice(int dcPrice) {
		this.dcPrice = dcPrice;
	}
	public Long getOption1Num() {
		return option1Num;
	}
	public void setOption1Num(Long option1Num) {
		this.option1Num = option1Num;
	}
	public String getOption1Name() {
		return option1Name;
	}
	public void setOption1Name(String option1Name) {
		this.option1Name = option1Name;
	}
	public Long getParent() {
		return parent;
	}
	public void setParent(Long parent) {
		this.parent = parent;
	}
	public Long getOption1Num2() {
		return option1Num2;
	}
	public void setOption1Num2(Long option1Num2) {
		this.option1Num2 = option1Num2;
	}
	public String getOption1Name2() {
		return option1Name2;
	}
	public void setOption1Name2(String option1Name2) {
		this.option1Name2 = option1Name2;
	}
	public Long getOption2Num() {
		return option2Num;
	}
	public void setOption2Num(Long option2Num) {
		this.option2Num = option2Num;
	}
	public String getOption2Name() {
		return option2Name;
	}
	public void setOption2Name(String option2Name) {
		this.option2Name = option2Name;
	}
	public int getExtraPrice() {
		return extraPrice;
	}
	public void setExtraPrice(int extraPrice) {
		this.extraPrice = extraPrice;
	}
	public int getExtraPrice2() {
		return extraPrice2;
	}
	public void setExtraPrice2(int extraPrice2) {
		this.extraPrice2 = extraPrice2;
	}
	public int getCoupon() {
		return coupon;
	}
	public void setCoupon(int coupon) {
		this.coupon = coupon;
	}
	public long getCartNum() {
		return cartNum;
	}
	public void setCartNum(long cartNum) {
		this.cartNum = cartNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getCartRegDate() {
		return cartRegDate;
	}
	public void setCartRegDate(String cartRegDate) {
		this.cartRegDate = cartRegDate;
	}
	public Long getOption2Num2() {
		return option2Num2;
	}
	public void setOption2Num2(Long option2Num2) {
		this.option2Num2 = option2Num2;
	}
	public String getOption2Name2() {
		return option2Name2;
	}
	public void setOption2Name2(String option2Name2) {
		this.option2Name2 = option2Name2;
	}
	public List<Long> getOption2Nums() {
		return option2Nums;
	}
	public void setOption2Nums(List<Long> option2Nums) {
		this.option2Nums = option2Nums;
	}
	public List<Long> getOption2Nums2() {
		return option2Nums2;
	}
	public void setOption2Nums2(List<Long> option2Nums2) {
		this.option2Nums2 = option2Nums2;
	}
	public List<String> getOption2Names() {
		return option2Names;
	}
	public void setOption2Names(List<String> option2Names) {
		this.option2Names = option2Names;
	}
	public List<String> getOption2Names2() {
		return option2Names2;
	}
	public void setOption2Names2(List<String> option2Names2) {
		this.option2Names2 = option2Names2;
	}
	public List<Long> getItemNums() {
		return itemNums;
	}
	public void setItemNums(List<Long> itemNums) {
		this.itemNums = itemNums;
	}
	public List<Long> getSubNums() {
		return subNums;
	}
	public void setSubNums(List<Long> subNums) {
		this.subNums = subNums;
	}
	public List<Long> getSubNums2() {
		return subNums2;
	}
	public void setSubNums2(List<Long> subNums2) {
		this.subNums2 = subNums2;
	}
	public List<Integer> getQtys() {
		return qtys;
	}
	public void setQtys(List<Integer> qtys) {
		this.qtys = qtys;
	}
	public int getCartTotalQty() {
		return cartTotalQty;
	}
	public void setCartTotalQty(int cartTotalQty) {
		this.cartTotalQty = cartTotalQty;
	}
	public int getCartTotalPrice() {
		return cartTotalPrice;
	}
	public void setCartTotalPrice(int cartTotalPrice) {
		this.cartTotalPrice = cartTotalPrice;
	}
	public long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
	}
	public int getTotalOriPrice() {
		return totalOriPrice;
	}
	public void setTotalOriPrice(int totalOriPrice) {
		this.totalOriPrice = totalOriPrice;
	}
	public int getTotalPurchasePrice() {
		return totalPurchasePrice;
	}
	public void setTotalPurchasePrice(int totalPurchasePrice) {
		this.totalPurchasePrice = totalPurchasePrice;
	}
	public String getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public Integer getOrderState() {
		return orderState;
	}
	public void setOrderState(Integer orderState) {
		this.orderState = orderState;
	}
	public String getOrderStateDate() {
		return orderStateDate;
	}
	public void setOrderStateDate(String orderStateDate) {
		this.orderStateDate = orderStateDate;
	}
	public int getUsedCoupon() {
		return usedCoupon;
	}
	public void setUsedCoupon(int usedCoupon) {
		this.usedCoupon = usedCoupon;
	}
	public int getUsedPoint() {
		return usedPoint;
	}
	public void setUsedPoint(int usedPoint) {
		this.usedPoint = usedPoint;
	}
	public int getDeliveryCharge() {
		return deliveryCharge;
	}
	public void setDeliveryCharge(int deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
	}
	public long getOrderDetailNum() {
		return orderDetailNum;
	}
	public void setOrderDetailNum(long orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public int getPurchaseMoney() {
		return purchaseMoney;
	}
	public void setPurchaseMoney(int purchaseMoney) {
		this.purchaseMoney = purchaseMoney;
	}
	public int getSavePoint() {
		return savePoint;
	}
	public void setSavePoint(int savePoint) {
		this.savePoint = savePoint;
	}
	public List<Integer> getPurchaseMoneys() {
		return purchaseMoneys;
	}
	public void setPurchaseMoneys(List<Integer> purchaseMoneys) {
		this.purchaseMoneys = purchaseMoneys;
	}
	public List<Integer> getPrices() {
		return prices;
	}
	public void setPrices(List<Integer> prices) {
		this.prices = prices;
	}
	public List<Integer> getSalePrices() {
		return salePrices;
	}
	public void setSalePrices(List<Integer> salePrices) {
		this.salePrices = salePrices;
	}
	public List<Integer> getSavePoints() {
		return savePoints;
	}
	public void setSavePoints(List<Integer> savePoints) {
		this.savePoints = savePoints;
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
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public String getAuthNumber() {
		return authNumber;
	}
	public void setAuthNumber(String authNumber) {
		this.authNumber = authNumber;
	}
	public String getAuthDate() {
		return authDate;
	}
	public void setAuthDate(String authDate) {
		this.authDate = authDate;
	}
	public Long getCouponNum() {
		return couponNum;
	}
	public void setCouponNum(Long couponNum) {
		this.couponNum = couponNum;
	}
	public int getUsed() {
		return used;
	}
	public void setUsed(int used) {
		this.used = used;
	}
	public Long getUsedCouponNum() {
		return usedCouponNum;
	}
	public void setUsedCouponNum(Long usedCouponNum) {
		this.usedCouponNum = usedCouponNum;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getPointNum() {
		return pointNum;
	}
	public void setPointNum(int pointNum) {
		this.pointNum = pointNum;
	}
	public int getPointChk() {
		return pointChk;
	}
	public void setPointChk(int pointChk) {
		this.pointChk = pointChk;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getPointRegDate() {
		return pointRegDate;
	}
	public void setPointRegDate(String pointRegDate) {
		this.pointRegDate = pointRegDate;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	
	
	
	
	
}
