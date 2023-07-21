package com.sp.withtail.newest;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.withtail.common.MyUtil;

@Controller("newest.newestController")
@RequestMapping("/newest/*")
public class NewestController {
	
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private MyUtil myUtilCustom;
	@Autowired
	private NewestService service;

	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "1") String condition,
			@RequestParam(value = "size", defaultValue = "12") int size,
			HttpServletRequest req,
			Model model) throws Exception {
		
		size = 12;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			condition = URLDecoder.decode(condition, "utf-8");
		}

		if(req.getSession().getAttribute("animal") == null || (int)req.getSession().getAttribute("animal") == 1) {
			req.getSession().setAttribute("animal", 1);
			condition = "1";
		} else {
			req.getSession().setAttribute("animal", 2);
			condition = "2";
		}
		
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);

		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if (dataCount != 0) {
			total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);
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

		// 글 리스트
		List<Newest> list = service.listNewest(map);
		
		String cp = req.getContextPath();
		String query = "size=" + size;
		String listUrl = cp + "/newest/list";
		
		listUrl += "?" + query;

		//String paging = myUtilCustom.pagingMethod(current_page, total_page, "listPage");
		String paging = myUtilCustom.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("condition", condition);
		
		return ".newest.list";
	}
}
