package com.sp.withtail.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.withtail.common.dao.CommonDAO;

@Service("admin.mainService")
public class MainServiceImpl implements MainService{
	@Autowired
	private CommonDAO dao;

	@Override
	public Map<String, Object> todayNewMember() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = dao.selectOne("adminMain.todayNewMember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> totalMember() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = dao.selectOne("adminMain.totalMember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}

	@Override
	public List<Map<String, Object>> weekSales(String date) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("adminMain.weekSales", date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Map<String, Object>> weekNewMember(String date) {
List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("adminMain.weekNewMember", date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Map<String, Object> todaySales() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = dao.selectOne("adminMain.todaySales");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> yesterDaySales() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = dao.selectOne("adminMain.yesterDaySales");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> monthSales() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = dao.selectOne("adminMain.monthSales");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> totalSales() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = dao.selectOne("adminMain.totalSales");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> paymentCompleted() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = dao.selectOne("adminMain.paymentCompleted");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> preparing() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = dao.selectOne("adminMain.preparing");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> inTransit() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = dao.selectOne("adminMain.inTransit");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> deliveryCompleted() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = dao.selectOne("adminMain.deliveryCompleted");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> orderComplete() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = dao.selectOne("adminMain.orderComplete");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}
	
	
	
	
}
