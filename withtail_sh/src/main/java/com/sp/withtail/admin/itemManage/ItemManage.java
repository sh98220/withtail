package com.sp.withtail.admin.itemManage;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ItemManage {

	private long itemNum;
	private String itemName;
	private int itemPrice;
	private int discount;
	private int itemPoint;
	private int salePrice;
	private int deliveryFee;
	private String madeby;
	private int showNotice;
	private String itemContent;
	private String mainImage;
	private String regDate;
	private String upddate;
	private MultipartFile mainImageFile;
	
	private long orderNum;
	
	public long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
	}
	private long ctNum;
	private long subCtNum;
	private Long parentCt;
	private long dept;
	private String ctName;
	
	private Long option1Num;
	private String option1Name;
	private Long parent;
	
	private Long option1Num2;
	private String option1Name2;
	
	
	private Long option2Num;
	private String option2Name;
	private List<Long> option2Nums;
	private List<String> option2Names;
	
	private Long option2Num2;
	private String option2Name2;
	private List<Long> option2Nums2;
	private List<String> option2Names2;
	
	private List<Long> extraPrices;
	private List<Long> extraPrices2;
	
	private int totalStock;
	
	private long extraPrice;
	private long extraPrice2;
	private int coupon;

	private long photoNum;
	private String photoName;
	private List<MultipartFile> addFiles;
	
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
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getItemPoint() {
		return itemPoint;
	}
	public void setItemPoint(int itemPoint) {
		this.itemPoint = itemPoint;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public int getDeliveryFee() {
		return deliveryFee;
	}
	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}
	public String getMadeby() {
		return madeby;
	}
	public void setMadeby(String madeby) {
		this.madeby = madeby;
	}
	public int getShowNotice() {
		return showNotice;
	}
	public void setShowNotice(int showNotice) {
		this.showNotice = showNotice;
	}
	public String getItemContent() {
		return itemContent;
	}
	public void setItemContent(String itemContent) {
		this.itemContent = itemContent;
	}
	public String getMainImage() {
		return mainImage;
	}
	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getUpddate() {
		return upddate;
	}
	public void setUpddate(String upddate) {
		this.upddate = upddate;
	}
	public MultipartFile getMainImageFile() {
		return mainImageFile;
	}
	public void setMainImageFile(MultipartFile mainImageFile) {
		this.mainImageFile = mainImageFile;
	}
	public long getCtNum() {
		return ctNum;
	}
	public void setCtNum(long ctNum) {
		this.ctNum = ctNum;
	}
	public long getSubCtNum() {
		return subCtNum;
	}
	public void setSubCtNum(long subCtNum) {
		this.subCtNum = subCtNum;
	}
	public Long getParentCt() {
		return parentCt;
	}
	public void setParentCt(Long parentCt) {
		this.parentCt = parentCt;
	}
	public long getDept() {
		return dept;
	}
	public void setDept(long dept) {
		this.dept = dept;
	}
	public String getCtName() {
		return ctName;
	}
	public void setCtName(String ctName) {
		this.ctName = ctName;
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
	public List<Long> getOption2Nums() {
		return option2Nums;
	}
	public void setOption2Nums(List<Long> option2Nums) {
		this.option2Nums = option2Nums;
	}
	public List<String> getOption2Names() {
		return option2Names;
	}
	public void setOption2Names(List<String> option2Names) {
		this.option2Names = option2Names;
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
	public List<Long> getOption2Nums2() {
		return option2Nums2;
	}
	public void setOption2Nums2(List<Long> option2Nums2) {
		this.option2Nums2 = option2Nums2;
	}
	public List<String> getOption2Names2() {
		return option2Names2;
	}
	public void setOption2Names2(List<String> option2Names2) {
		this.option2Names2 = option2Names2;
	}
	public List<Long> getExtraPrices() {
		return extraPrices;
	}
	public void setExtraPrices(List<Long> extraPrices) {
		this.extraPrices = extraPrices;
	}
	public List<Long> getExtraPrices2() {
		return extraPrices2;
	}
	public void setExtraPrices2(List<Long> extraPrices2) {
		this.extraPrices2 = extraPrices2;
	}
	public int getTotalStock() {
		return totalStock;
	}
	public void setTotalStock(int totalStock) {
		this.totalStock = totalStock;
	}
	public long getExtraPrice() {
		return extraPrice;
	}
	public void setExtraPrice(long extraPrice) {
		this.extraPrice = extraPrice;
	}
	public long getExtraPrice2() {
		return extraPrice2;
	}
	public void setExtraPrice2(long extraPrice2) {
		this.extraPrice2 = extraPrice2;
	}
	public int getCoupon() {
		return coupon;
	}
	public void setCoupon(int coupon) {
		this.coupon = coupon;
	}
	public long getPhotoNum() {
		return photoNum;
	}
	public void setPhotoNum(long photoNum) {
		this.photoNum = photoNum;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public List<MultipartFile> getAddFiles() {
		return addFiles;
	}
	public void setAddFiles(List<MultipartFile> addFiles) {
		this.addFiles = addFiles;
	}
	
}
