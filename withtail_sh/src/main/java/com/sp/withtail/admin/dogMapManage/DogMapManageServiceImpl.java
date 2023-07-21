package com.sp.withtail.admin.dogMapManage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.withtail.common.FileManager;
import com.sp.withtail.common.dao.CommonDAO;

@Service
public class DogMapManageServiceImpl implements DogMapManageService{
	@Autowired
	private CommonDAO dao;

	@Autowired
	private FileManager fileManager;
	
	@Override
	public void updateDogMap(DogMapManage dto, String pathname) throws Exception {
		try {
			
			String photoName = fileManager.doFileUpload(dto.getMainImageFile(), pathname);
			if(photoName != null) {
				if(dto.getMainImage().length() != 0) {
					fileManager.doFileDelete(dto.getMainImage(), pathname);
				}

				dto.setMainImage(photoName);
			}
			
			dao.updateData("dogMapManage.updateDogMap", dto);

			if(! dto.getAddFiles().isEmpty()) {
				for(MultipartFile mf : dto.getAddFiles()) {
					photoName = fileManager.doFileUpload(mf, pathname);
					if(photoName == null) {
						continue;
					}
					dto.setPhotoName(photoName);

					dao.insertData("dogMapManage.insertDogMapPhoto",dto);
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteDogMapPhoto(long photoNum, String pathname) throws Exception {
		try {
			if(pathname != null) {
				fileManager.doFileDelete(pathname);
			}

			dao.deleteData("dogMapManage.deleteDogMapPhoto", photoNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("dogMapManage.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<DogMapManage> listDogMap(Map<String, Object> map) {
		List<DogMapManage> list = null;
		
		try {
			list = dao.selectList("dogMapManage.listDogMap", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<DogMapManage> listDogMapPhoto(long placeNum) {
	List<DogMapManage> list = null;
		
		try {
			list = dao.selectList("dogMapManage.listDogMapPhoto",placeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public DogMapManage readDogMap(long placeNum) {
		DogMapManage dto = null;
		
		try {
			dto = dao.selectOne("dogMapManage.readDogMap", placeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
