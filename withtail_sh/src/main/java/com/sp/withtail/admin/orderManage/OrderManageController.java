package com.sp.withtail.admin.orderManage;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.withtail.common.MyUtil;

@Controller("admin.orderManageController")
@RequestMapping("/admin/orderManage/*")
public class OrderManageController {
	@Autowired
	private OrderManageService service;

	@Autowired
	private MyUtil myUtilGeneral;

	@RequestMapping("{orderStatus}")
	public String list(
			@PathVariable String orderStatus,
			@RequestParam(defaultValue = "1") int state,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "orderNum") String col,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			Model model) throws Exception{

		if(orderStatus.equals("order")) {
			state = 1;
		} else if (orderStatus.equals("delivery")) {
			state = 2;
		} else if (orderStatus.equals("done")) {
			state = 3;
		} else if (orderStatus.equals("refund")) {
			state = 4;
		}

		String cp = req.getContextPath();

		int size = 10;
		int total_page;
		int dataCount;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "UTF-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", state);
		map.put("col", col);
		map.put("kwd", kwd);

		dataCount = service.orderCount(map);
		total_page = myUtilGeneral.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		List<OrderManage> list = service.listOrder(map);
		List<Map<String, Object>> listDeliveryCompany = service.listDeliveryCompany();

		String listUrl = cp + "/admin/orderManage/"+orderStatus;

		String query = "state="+state;
		if (kwd.length() != 0) {
			query += "&col=" + col + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}		
		listUrl += "?" + query;

		String paging = myUtilGeneral.paging(current_page, total_page, listUrl);

		model.addAttribute("orderStatus", orderStatus);

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("state", state);

		model.addAttribute("col", col);
		model.addAttribute("kwd", kwd);

		model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		model.addAttribute("listDeliveryCompany", listDeliveryCompany);	


		return ".admin.orderManage.order";
	}

	@PostMapping("detail/info")
	public String detail (
			@RequestParam long orderNum,
			@RequestParam String orderStatus,
			Model model) throws Exception {

		OrderManage order = service.readOrder(orderNum);

		List<OrderDetail> listDetail = service.orderDetails(orderNum);

		model.addAttribute("order", order);
		model.addAttribute("listDetail", listDetail);

		return "admin/orderManage/detail";
	}

	@PostMapping("detail/invoiceNumber")
	@ResponseBody
	public Map<String, Object> invoiceNumber(@RequestParam Map<String, Object> paramMap) {
		// 송장 번호 등록/변경
		String state = "true";

		try {
			service.insertDelivery(paramMap);
			service.updateOrderState(paramMap);

		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}

	@PostMapping("detail/delivery")
	@ResponseBody
	public Map<String, Object> delivery(@RequestParam Map<String, Object> paramMap) {
		String state = "true";

		try {
			service.updateOrderState(paramMap);
			} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@PostMapping("detail/refund")
	@ResponseBody
	public Map<String, Object> refund(@RequestParam Map<String, Object> paramMap) {
		String state = "true";
		
		try {
			service.updateOrderState(paramMap);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}

}
