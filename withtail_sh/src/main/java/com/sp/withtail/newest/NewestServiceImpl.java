package com.sp.withtail.newest;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.withtail.common.dao.CommonDAO;

@Service("newest.newestService")
public class NewestServiceImpl implements NewestService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Newest> listNewest(Map<String, Object> map) {
		List<Newest> list = null;
		
		try {
			list = dao.selectList("newest.newestList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("newest.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
