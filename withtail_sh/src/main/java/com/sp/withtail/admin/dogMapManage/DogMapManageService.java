package com.sp.withtail.admin.dogMapManage;

import java.util.List;
import java.util.Map;

public interface DogMapManageService {
	public void updateDogMap(DogMapManage dto, String pathname) throws Exception;
	public DogMapManage readDogMap(long placeNum);
	public void deleteDogMapPhoto(long photoNum, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<DogMapManage> listDogMap(Map<String, Object> map);
	
	public List<DogMapManage> listDogMapPhoto(long placeNum);
}
