package com.sp.withtail.admin.eventManage;

import java.io.File;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.withtail.common.MyUtil;

@Controller("admin.eventManageController")
@RequestMapping("/admin/eventManage/*")
public class EventManageController {
	@Autowired
	private EventManageService service;
	
	@Autowired
	private MyUtil myUtilGeneral;

	@RequestMapping("{category}/list")
	public String list(@PathVariable String category,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {

		int size = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtilGeneral.pageCount(dataCount, size);
		}
		
		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		// 글 리스트
		List<EventManage> list = service.listEvent(map);
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/admin/eventManage/"+category+"/list";
		String articleUrl = cp + "/admin/eventManage/"+category+"/article?page=" + current_page;

		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		listUrl += "?" + query;
		articleUrl += "&" + query;

		String paging = myUtilGeneral.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("category", category);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".admin.eventManage.list";
	}
	
	
	@GetMapping("{category}/write")
	public String writeForm(
			@PathVariable String category, Model model) throws Exception {
		model.addAttribute("mode", "write");

		return ".admin.eventManage.write";
	}
	
	
	@PostMapping("{category}/write")
	public String writeSubmit(
			@PathVariable String category,
			EventManage dto, HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "event";
		
		try {
			service.insertEvent(dto, path);
		} catch (Exception e) {
		}

		return "redirect:/admin/eventManage/all/list";
	}
	
	@GetMapping("{category}/article")
	public String article(
			@PathVariable String category,
			@RequestParam long num,
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

		EventManage dto = service.readEvent(num);
		if (dto == null) {
			return "redirect:/admin/eventManage/" + category + "/list?" + query;
		}
		
		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("num", num);

		EventManage preReadDto = service.preReadEvent(map);
		EventManage nextReadDto = service.nextReadEvent(map);
		
		// 이벤트 참여자
		List<EventManage> listEventApply = service.listEventApply(num);
		// 이벤트 당첨자
		List<EventManage> listEventWinner = service.listEventWinner(num);

		model.addAttribute("category", category);
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);

		model.addAttribute("listEventApply", listEventApply);
		model.addAttribute("listEventWinner", listEventWinner);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		return ".admin.eventManage.article";
	}
	
	@GetMapping("{category}/update")
	public String updateForm(
			@PathVariable String category,
			@RequestParam long num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {

		EventManage dto = service.readEvent(num);
		
		if (dto == null) {
			return "redirect:/admin/eventManage/" + category + "/list?page=" + page;
		}

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");
		
		return ".admin.eventManage.write";
	}

	@PostMapping("{category}/update")
	public String updateSubmit(EventManage dto,
			@PathVariable String category,
			@RequestParam String page,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "event";

		try {
			service.updateEvent(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/admin/eventManage/" + category + "/list?page=" + page;
	}

	@GetMapping("{category}/delete")
	public String delete(
			@PathVariable String category,
			@RequestParam long num,
			@RequestParam String page,
			@RequestParam String imageFilename,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {

		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "event" + File.separator + imageFilename;
		
		try {
			service.deleteEvent(num, pathname);
		} catch (Exception e) {
			
		}

		return "redirect:/admin/eventManage/" + category + "/list?" + query;
	}
	
	@PostMapping("{category}/win")
	public String winner(
			@PathVariable String category,
			EventManage dto,
			@RequestParam String page) throws Exception {
		
		try {
			service.insertEventWinner(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/admin/eventManage/winner/list?page=" + page;
	}
	
}
