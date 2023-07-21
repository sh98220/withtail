package com.sp.withtail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.withtail.common.dao.CommonDAO;


@Service("homeService")
public class HomeServiceImpl implements HomeService {
	@Autowired
	private CommonDAO dao;


	@Override
	public List<Home> listRank(int num) {
		List<Home> list = null;
		
		try {
			list = dao.selectList("home.rankList", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	

	@Override
	public List<Home> listHotdeal(int num) {
		List<Home> list = null;
		
		try {
			list = dao.selectList("home.hotdealList", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Home> listnewst(int num) {
		List<Home> list = null;
		
		try {
			list = dao.selectList("home.newstList", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public int cartCount(String id) {
		int result = 0;
		
		try {
			result = dao.selectOne("home.cartCount", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
