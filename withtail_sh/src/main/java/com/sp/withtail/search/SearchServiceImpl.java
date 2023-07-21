package com.sp.withtail.search;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.withtail.common.dao.CommonDAO;


@Service("search.searchService")
public class SearchServiceImpl implements SearchService {
	@Autowired
	private CommonDAO dao;


	@Override
	public List<Search> listSearch(Map<String, Object> map) {
		List<Search> list = null;
		
		try {
			list = dao.selectList("search.searchList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("search.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
