package com.sp.withtail.pets;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.withtail.common.FileManager;
import com.sp.withtail.common.dao.CommonDAO;

@Service("pets.petsService")
public class PetsServiceImpl implements PetsServcie  {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertPets(Pets dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if(saveFilename != null) {
				dto.setPetsImageFilename(saveFilename);
			} 
			
			if(dto.getBreed_cat().equals("")) {
				dto.setBreed(dto.getBreed_dog());
			} else {
				dto.setBreed(dto.getBreed_cat());
			}
				
			dao.insertData("pets.insertPets", dto);
	
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
}
