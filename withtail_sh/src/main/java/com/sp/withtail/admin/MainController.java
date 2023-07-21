package com.sp.withtail.admin;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSessionEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("admin.mainController")
public class MainController {
	@Autowired
	private MainService service;
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String main(Model model) {
		
		Map<String, Object> todayNewMember = service.todayNewMember();
		Map<String, Object> totalMember = service.totalMember();
		
		Map<String, Object> todaySales = service.todaySales();
		Map<String, Object> yesterDaySales = service.yesterDaySales();
		Map<String, Object> monthSales = service.monthSales();
		Map<String, Object> totalSales = service.totalSales();

		Map<String, Object> paymentCompleted = service.paymentCompleted();
		Map<String, Object> preparing = service.preparing();
		Map<String, Object> inTransit = service.inTransit();
		Map<String, Object> deliveryCompleted = service.deliveryCompleted();
		Map<String, Object> orderComplete = service.orderComplete();
		
		int currentCount = CountManager.getCurrentCount();
		long toDayCount = CountManager.getToDayCount();
		long yesterDayCount = CountManager.getYesterDayCount();
		long totalCount = CountManager.getTotalCount();

		model.addAttribute("currentCount",currentCount);
		model.addAttribute("toDayCount",toDayCount);
		model.addAttribute("yesterDayCount",yesterDayCount);
		model.addAttribute("totalCount",totalCount);

		model.addAttribute("todayNewMember",todayNewMember);
		model.addAttribute("totalMember",totalMember);
		
		model.addAttribute("todaySales",todaySales);
		model.addAttribute("yesterDaySales",yesterDaySales);
		model.addAttribute("monthSales",monthSales);
		model.addAttribute("totalSales",totalSales);

		model.addAttribute("paymentCompleted",paymentCompleted);
		model.addAttribute("preparing",preparing);
		model.addAttribute("inTransit",inTransit);
		model.addAttribute("deliveryCompleted",deliveryCompleted);
		model.addAttribute("orderComplete",orderComplete);

		
		return ".adminLayout";
	}
	
	@RequestMapping(value="/admin/charts")
	@ResponseBody
	public Map<String, Object> chart1() throws Exception {
		Map<String, Object> model = new HashMap<>();
		
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		int d = cal.get(Calendar.DATE);
		
		String date = String.format("%04d-%02d-%02d", y, m, d);
		
		List<Map<String, Object>> weekSales = service.weekSales(date);
		List<Map<String, Object>> weekNewMember = service.weekNewMember(date);
		
		model.put("weekSales", weekSales);
		model.put("weekNewMember", weekNewMember);
		
		return model;
	}
	

	
}
