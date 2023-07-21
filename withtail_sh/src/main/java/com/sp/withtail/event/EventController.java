package com.sp.withtail.event;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.withtail.common.MyUtil;
import com.sp.withtail.common.MyUtilCustom;
import com.sp.withtail.member.SessionInfo;

@Controller("event.eventController")
@RequestMapping("/event/*")
public class EventController {
	@Autowired
	private EventService service;
	
	@Autowired
	private MyUtil myUtilGeneral;
	
	@Autowired
	private MyUtilCustom myUtilCustom;
	
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
		List<Event> list = service.listEvent(map);
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/event/"+category+"/list";
		String articleUrl = cp + "/event/"+category+"/article?page=" + current_page;

		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		listUrl += "?" + query;
		articleUrl += "&" + query;

		//String paging = myUtilGeneral.paging(current_page, total_page, listUrl);
		String paging = myUtilCustom.pagingMethod(current_page, total_page, "listPage");
		
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
		
		return ".event.list";
	}
	
	@GetMapping("article")
	public String article(Model model, @RequestParam long num, @RequestParam String category, HttpSession session) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("showEvent", 1);
		map.put("num", num);

		Event preReadDto = service.preReadEvent(map);
		Event nextReadDto = service.nextReadEvent(map);
		
		if(category.equals("progress")) {
			try {
				service.updateHitCount(num);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		int result = 0;
		
		
		
		List<Event> list = service.listWinner(num);
		Event dto = service.readEvent(num);
		int winnerNum = service.winnerCount(num);
		dto.setUserId(info.getUserId());
		result = service.countApply(dto);
		
		model.addAttribute("result", result);
		model.addAttribute("list", list);
		model.addAttribute("dto",dto);
		model.addAttribute("winnerNum",winnerNum);
		model.addAttribute("category", category);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);

		return ".event.article";
	}
	
	
	@PostMapping("insertApply")
	@ResponseBody
	public Map<String, Object> insertApply(Event dto, HttpSession session) throws Exception {
	   SessionInfo info = (SessionInfo)session.getAttribute("member");
       String state = "true";
       
       try {
    	   dto.setUserId(info.getUserId()); 
    	   service.insertEventApply(dto);
    	   
      } catch (Exception e) {
         state = "false";
      }
       
       Map<String, Object> model = new HashMap<String, Object>();
       model.put("state", state);
       
       
       return model;
    }
	
	
	@GetMapping("winner")
	public String winner(Model model) {
		
		return ".event.winner";
	}
}
