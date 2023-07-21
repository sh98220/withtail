package com.sp.withtail.admin.orderManage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.withtail.common.dao.CommonDAO;

@Service
public class OrderManageServiceImpl implements OrderManageService{
	@Autowired
	private CommonDAO dao;

	@Override
	public int orderCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("orderManage.orderCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<OrderManage> listOrder(Map<String, Object> map) {
		List<OrderManage> list = null;
		
		try {
			list = dao.selectList("orderManage.listOrder", map);
			
			for(OrderManage dto : list) {
				dto.setOrderStateInfo(OrderState.ORDERSTATEINFO[dto.getOrderState()]);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public OrderManage readOrder(long orderNum) {
		OrderManage dto = null;
		
		try {
			dto = dao.selectOne("orderManage.readOrder", orderNum);
			if(dto != null) {
				dto.setOrderStateInfo(OrderState.ORDERSTATEINFO[dto.getOrderState()]);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<OrderDetail> orderDetails(long orderNum) {
		List<OrderDetail> list = null;
		
		try {
			list = dao.selectList("orderManage.readDetail", orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int orderDetailCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("orderManage.orderDetailCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<OrderDetail> listOrderDetail(Map<String, Object> map) {
		List<OrderDetail> list = null;
		
		try {
			list = dao.selectList("orderManage.listOrderDetail", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateOrderState(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("orderManage.updateOrderState", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Map<String, Object>> listDeliveryCompany() {
		List<Map<String, Object>> list = null;
		try {
			list = dao.selectList("orderManage.listDeliveryCompany");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void insertDelivery(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("orderManage.insertDelivery", map);
			
			updateOrderState(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	public void updateOrderStateDone(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("orderManage.updateOrderStateDone", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
