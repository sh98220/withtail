package com.sp.withtail.shop;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.withtail.common.MyUtil;
import com.sp.withtail.member.SessionInfo;
import com.sp.withtail.review.ReviewService;

@Controller("shop.shopController")
@RequestMapping("/shop/*")
public class ShopController {
	@Autowired
	private ShopService service;
	
	//@Autowired
	//private OrderService orderService;
	
	@Autowired
	private ReviewService rvService;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private MyUtil myUtilCustom;
	
	// 카테고리 탭
	@GetMapping("{ctNum}")
	public String main(
			@PathVariable long ctNum,
			Model model) throws Exception {
		
		Product category = service.readCategory(ctNum);
		List<Product> listSubCategory = service.listSubCategory(ctNum);
		
		model.addAttribute("ctNum", ctNum);
		model.addAttribute("category", category);
		model.addAttribute("listSubCategory", listSubCategory);
		
		return ".shop.main";
	}

	// 상품 리스트(AJAX - html)
	@RequestMapping(value = "{ctNum}/list")
	public String list(@PathVariable long ctNum,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "itemName") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "0") String sortNo,
			HttpServletRequest req,
			Model model) throws Exception {
		
		Product category = service.readCategory(ctNum);
		
		int size = 20; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ctNum", ctNum);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
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
		
		map.put("sortNo", sortNo);

		// 글 리스트
		List<Product> list = service.listProd(map);

		String paging = myUtilCustom.pagingMethod2(current_page, total_page, "listPage");
		
		model.addAttribute("category", category);
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		model.addAttribute("sortNo", sortNo);
		
		return "shop/list";
	}
	
	// 상품 보기
	@GetMapping(value = "info/{itemNum}")
	public String productInfo(
			@PathVariable long itemNum,
			HttpServletResponse resp,
			Model model) throws Exception {
		
		int rvDataCount = 0;

		// 상품
		Product dto = service.readProd(itemNum);
		if(dto == null) {
			resp.sendError(410);
			return null;
		}
		
		// 추가 이미지
		List<Product> listProdImage = service.listProdImage(itemNum);
		
		dto.setPhotoName(dto.getMainImage());
		listProdImage.add(0, dto);
		
		// 옵션명
		List<Product> listOption = service.listProdOption(itemNum);
		
		// 옵션 내용
		List<Product> listOptionDetail = null;
		if(listOption.size() > 0) {
			listOptionDetail = service.listOptionDetail(listOption.get(0).getOption1Num());
		}
		
		// 연관 상품 리스트
		List<Product> listRelated = service.listRelated(itemNum);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemNum", itemNum);
		
		rvDataCount = rvService.dataCount(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("listProdImage", listProdImage);
		model.addAttribute("listOption", listOption);
		model.addAttribute("listOptionDetail", listOptionDetail);
		model.addAttribute("listRelated", listRelated);
		model.addAttribute("rvDataCount", rvDataCount);
		
		return ".shop.info";
	}
	
	// 상품 옵션(AJAX - JSON)
	@GetMapping("info/listOptionDetail2")
	@ResponseBody
	public List<Product> listOptionDetail2(@RequestParam Long option1Num,
			@RequestParam Long option1Sub, @RequestParam Long option2Num,
			 @RequestParam long extra1) {
		List<Product> list = service.listOptionDetail(option1Sub);
		return list;
	}
	
	@PostMapping("insertLike")
	@ResponseBody
	public Map<String, Object> insertLike(@RequestParam long itemNum, 
			@RequestParam boolean userLiked,
			HttpSession session) {
		
		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("itemNum", itemNum);
		paramMap.put("userId", info.getUserId());
		
		try {
			if(userLiked) {
				service.deleteLike(paramMap);
			} else {
				service.insertLike(paramMap);
			}
		} catch (DuplicateKeyException e) {
			state = "liked";
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}

}
