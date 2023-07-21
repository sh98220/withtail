package com.sp.withtail.pets;

import org.springframework.web.multipart.MultipartFile;

public class Pets {
	private long num;
	private String userId;
	private String petName;
	private String breed_dog;
	private String breed_cat;
	private String breed;
	
	public String getBreed() {
		return breed;
	}
	public void setBreed(String breed) {
		this.breed = breed;
	}
	public String getBreed_dog() {
		return breed_dog;
	}
	public void setBreed_dog(String breed_dog) {
		this.breed_dog = breed_dog;
	}
	public String getBreed_cat() {
		return breed_cat;
	}
	public void setBreed_cat(String breed_cat) {
		this.breed_cat = breed_cat;
	}
	private int weight;
	private String birth;
	private String gender;
	private String whichpet;
	private String petsImageFilename;

	
	private MultipartFile selectFile;
	
	public MultipartFile getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}
	public String getPetsImageFilename() {
		return petsImageFilename;
	}
	public void setPetsImageFilename(String petsImageFilename) {
		this.petsImageFilename = petsImageFilename;
	}
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
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getWhichpet() {
		return whichpet;
	}
	public void setWhichpet(String whichpet) {
		this.whichpet = whichpet;
	}
}
