package com.sp.withtail.tailPath;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.withtail.common.dao.CommonDAO;

@Service("tailPath.tailPathService")
public class TailPathServiceImpl implements TailPathService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertTailPath(List<String> nameData) throws Exception {
		try {
			for(String item : nameData) {
				dao.insertData("tailPath.insertTailPath", item);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
