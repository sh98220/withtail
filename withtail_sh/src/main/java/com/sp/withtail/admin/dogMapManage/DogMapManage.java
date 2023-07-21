package com.sp.withtail.admin.dogMapManage;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class DogMapManage {
	
	private long placeNum;
	private String placeName;
	private String content;
	private String mainImage;
	private MultipartFile mainImageFile;
	
	private long photoNum;
	private String photoName;
	private List<MultipartFile> addFiles;

	
	public long getPlaceNum() {
		return placeNum;
	}
	public void setPlaceNum(long placeNum) {
		this.placeNum = placeNum;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMainImage() {
		return mainImage;
	}
	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}
	public MultipartFile getMainImageFile() {
		return mainImageFile;
	}
	public void setMainImageFile(MultipartFile mainImageFile) {
		this.mainImageFile = mainImageFile;
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
