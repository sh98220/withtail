package com.sp.withtail.admin;

import java.util.List;
import java.util.Map;

public interface MainService {
	public Map<String, Object> todayNewMember();
	public Map<String, Object> totalMember();
	
	public List<Map<String, Object>> weekSales(String date);
	public List<Map<String, Object>> weekNewMember(String date);
	
	public Map<String, Object> todaySales();
	public Map<String, Object> yesterDaySales();
	public Map<String, Object> monthSales();
	public Map<String, Object> totalSales();
	
	public Map<String, Object> paymentCompleted();
	public Map<String, Object> preparing();
	public Map<String, Object> inTransit();
	public Map<String, Object> deliveryCompleted();
	public Map<String, Object> orderComplete();
	
}
