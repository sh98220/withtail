package com.sp.withtail.admin.orderManage;

import java.util.List;
import java.util.Map;

public interface OrderManageService {
	public int orderCount(Map<String, Object> map);
	public List<OrderManage> listOrder(Map<String, Object> map);
	public OrderManage readOrder(long orderNum);
	public List<OrderDetail> orderDetails(long orderNum);
	
	public int orderDetailCount(Map<String, Object> map);
	public List<OrderDetail> listOrderDetail (Map<String, Object> map);
	
	public void insertDelivery(Map<String, Object> map) throws Exception;
	public void updateOrderState(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> listDeliveryCompany();
	public void updateOrderStateDone(Map<String, Object> map) throws Exception; 
}
