package com.sp.withtail.hotdeal;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.withtail.common.dao.CommonDAO;


@Service("hotdeal.hotDealService")
public class HotDealServiceImpl implements HotDealService {
	@Autowired
	private CommonDAO dao;


	@Override
	public List<HotDeal> listRank(Map<String, Object> map) {
		List<HotDeal> list = null;
		
		try {
			list = dao.selectList("hotdeal.hotdealList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("hotdeal.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
