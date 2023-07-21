package com.sp.withtail.admin.reviewManage;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.withtail.admin.inquiryManage.InquiryManage;
import com.sp.withtail.common.MyUtil;
import com.sp.withtail.member.SessionInfo;

@Controller("admin.reviewManageController")
@RequestMapping("/admin/reviewManage/*")
public class ReviewManageController {
	
	@Autowired
	private ReviewManageService service;
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	@RequestMapping(value = "list/{state}")
	public String reviewList(
			@PathVariable String state,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "userId") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception{
		
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		/////
		if(state.equals("before")) {
			dataCount = service.dataCountbefore(map);
		}else if(state.equals("complete")) {
			dataCount = service.dataCountcomplete(map);
		}
		
		
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		
		// 글 리스트
		List<ReviewManage> list = null;
		if(state.equals("before")) {
			list = service.listReviewbefore(map);
		}else if(state.equals("complete")) {
			list = service.listReviewcomplete(map);
		}

		String query = "";
		String listUrl = cp + "/admin/reviewManage/list";
		String articleUrl = cp + "/admin/reviewManage/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		if (query.length() != 0) {
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("state", state);
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		System.out.println("keyword=!!!"+keyword);
		
		return ".admin.reviewManage.list";
	}
	
	@RequestMapping(value = "article")
	public String article(
			@RequestParam long rvNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session,
			Model model) throws Exception{
		
		keyword = URLDecoder.decode(keyword, "utf-8");

		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		
		ReviewManage dto = service.readReview(rvNum);
		List<ReviewManage> list = service.photolist(rvNum);
		
		if(dto != null) {
			dto.setReplyContent(myUtil.htmlSymbols(dto.getReplyContent()));
			dto.setRvContent(myUtil.htmlSymbols(dto.getRvContent()));
		}
		
		if (dto == null) {
			return "redirect:/admin/reviewManage/list?" + query;
		}

		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("query", query);

		
		return ".admin.reviewManage.article";
	}
	
	
	@RequestMapping(value = "reply", method = RequestMethod.POST)
	public String answerSubmit(ReviewManage dto, 
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		
		try {
			dto.setReplyId(info.getUserId());
			service.answerReview(dto);
		} catch (Exception e) {
		}

		return "redirect:/admin/reviewManage/list/before?" + query;
	}
	
	
	@RequestMapping(value = "deleteReply")
	public String deleteAnswer(@RequestParam long rvNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {

		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		
		ReviewManage dto = service.readReview(rvNum);
		if (dto != null) {
			try {
				service.deleteAnswer(rvNum);
			} catch (Exception e) {
			}
		}

		return "redirect:/admin/reviewManage/list/before?" + query;
	}
	
	
	@RequestMapping(value = "deleteReview")
	public String delete(@RequestParam long rvNum,
			@RequestParam(defaultValue = "1") String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session) throws Exception {

		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		ReviewManage dto = service.readReview(rvNum);
		if (dto != null) {
			try {
				service.deleteReview(rvNum);
			} catch (Exception e) {
			}
		}

		return "redirect:/admin/reviewManage/list/before?" + query;
	}
	
}
 