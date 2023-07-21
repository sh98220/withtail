package com.sp.withtail.cart;

public class Cart {
	private String userId; //아이디
	private Long cartNum; //장바구니 기본키
	private int quantity; //각 구매 개수
	private Long option2Num; //옵션2 번호 -상위
	private String option2Name; //옵션2 이름
	private Long option2Num2; //옵션2 번호 -하위
	private String option2Name2; //옵션2 이름
	private String mainImage; //이미지
	
	private Long itemNum; //물품번호
	private String itemName; // 물품명
	private int deliveryFee; //배달비
	private int deliveryFeeMax; //가장 비싼 배달비
	private int itemPrice; //가격
	private int disPrice; //할인가
	private int discount; //할인율
	private int finalPrice; //최종가
	private int itemPoint; //포인트
	private int extraPrice; //추가금
	private int totalStock; //재고량
	private int nullCheck; //널 체크
	
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
	public Long getItemNum() {
		return itemNum;
	}
	public void setItemNum(Long itemNum) {
		this.itemNum = itemNum;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getDeliveryFee() {
		return deliveryFee;
	}
	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}
	public int getitemPrice() {
		return itemPrice;
	}
	public void setitemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getitemPoint() {
		return itemPoint;
	}
	public void setitemPoint(int itemPoint) {
		this.itemPoint = itemPoint;
	}
	public String getmainImage() {
		return mainImage;
	}
	public void setmainImage(String mainImage) {
		this.mainImage = mainImage;
	}
	public Long getCartNum() {
		return cartNum;
	}
	public void setCartNum(Long cartNum) {
		this.cartNum = cartNum;
	}
	public String getMainImage() {
		return mainImage;
	}
	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public int getItemPoint() {
		return itemPoint;
	}
	public void setItemPoint(int itemPoint) {
		this.itemPoint = itemPoint;
	}
	public int getExtraPrice() {
		return extraPrice;
	}
	public void setExtraPrice(int extraPrice) {
		this.extraPrice = extraPrice;
	}
	public int getDisPrice() {
		return disPrice;
	}
	public void setDisPrice(int disPrice) {
		this.disPrice = disPrice;
	}
	public int getFinalPrice() {
		return finalPrice;
	}
	public void setFinalPrice(int finalPrice) {
		this.finalPrice = finalPrice;
	}
	public int getTotalStock() {
		return totalStock;
	}
	public void setTotalStock(int totalStock) {
		this.totalStock = totalStock;
	}
	public int getDeliveryFeeMax() {
		return deliveryFeeMax;
	}
	public void setDeliveryFeeMax(int deliveryFeeMax) {
		this.deliveryFeeMax = deliveryFeeMax;
	}
	public int getNullCheck() {
		return nullCheck;
	}
	public void setNullCheck(int nullCheck) {
		this.nullCheck = nullCheck;
	}
	
}
