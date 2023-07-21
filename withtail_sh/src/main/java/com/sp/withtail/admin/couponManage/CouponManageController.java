package com.sp.withtail.admin.couponManage;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.withtail.common.MyUtil;


@Controller("admin.couponManageController")
@RequestMapping("/admin/couponManage/*")
public class CouponManageController {
	@Autowired
	private MyUtil myUtilGeneral;
	
	@Autowired
	private CouponManageService service;

	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int size = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		System.out.println("condition= "+ condition);
		System.out.println("keyword= "+ keyword);

		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtilGeneral.pageCount(dataCount, size);
		}

		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if (total_page < current_page) {
			current_page = total_page;
		}

		// 리스트에 출력할 데이터를 가져오기
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		
		List<CouponManage> list = service.listCoupon(map);
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/admin/couponManage/list";
		String articleUrl = cp + "/admin/couponManage/article?page=" + current_page;

		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/admin/couponManage/list?" + query;
			articleUrl = cp + "/admin/couponManage/article?page=" + current_page + "&" + query;
		}

		String paging = myUtilGeneral.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		return ".admin.couponManage.list";

	}

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(Model model, HttpSession session) throws Exception {
		model.addAttribute("mode", "write");

		return ".admin.couponManage.write";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeSumbit(CouponManage dto) throws Exception {
		
		try {
			service.insertCoupon(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/couponManage/list";
	}


	@RequestMapping(value = "article")
	public String article(
			@RequestParam long couponNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			Model model) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");

		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + 
					"&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		CouponManage dto = service.readCoupon(couponNum);
		
		if (dto == null) {
			return "redirect:/admin/eventManage/list?" + query;
		}
		
		List<CouponManage> allMember = service.allMember(couponNum);
		List<CouponManage> noCouponMember = service.nocouponMember(couponNum);		
		
		
		model.addAttribute("dto", dto);
		model.addAttribute("allMember",allMember);
		model.addAttribute("noCouponMember",noCouponMember);
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		return ".admin.couponManage.article";
	}
	
	@GetMapping("update")
	public String updateForm(
			@RequestParam long couponNum,
			@RequestParam String page,
			HttpSession session,
			Model model)throws Exception {
		
		CouponManage dto = service.readCoupon(couponNum);
		
		if(dto == null) {
			return "redirect:/admin/couponManage/list?page="+page;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");
		
		return ".admin.couponManage.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(CouponManage dto,
			@RequestParam String page) {
		
		try {
			service.updateCoupon(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/admin/couponManage/list?page="+page;
	}
	
	@RequestMapping(value = "delete")
	public String delete (@RequestParam long couponNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "couponNum") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page=" + page;
		
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		
		service.deleteCoupon(couponNum);
		
		return "redirect:/admin/couponManage/list?" + query;
	}
	
	@PostMapping("insertToMember")
	@ResponseBody
	public Map<String, Object> insertToMember(
			@RequestParam Map<String, Object> paramMap
			) {

		String state = "true";
		try {
			service.insertToMember(paramMap);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}


}
