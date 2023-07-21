package com.sp.withtail.admin.itemManage;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.withtail.common.MyUtil;

@Controller("itemManage.itemManageContollr")
@RequestMapping("/admin/itemManage/*")
public class ItemManageController {

	@Autowired
	private ItemManageService service;

	@Autowired
	private MyUtil myUtilGeneral;

	@RequestMapping("list")
	public String list(
			@RequestParam(defaultValue = "0") long parentCt,
			@RequestParam(defaultValue = "0") long subCtNum,
			@RequestParam(defaultValue = "0") long lastCtNum,
			@RequestParam(defaultValue = "all") String col,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req,
			Model model) throws Exception {

		String cp = req.getContextPath();

		int size = 10;
		int total_page;
		int dataCount;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "UTF-8");
		}

		List<ItemManage> listCategory = service.listCategory();
		List<ItemManage> listSubCategory = null;
		List<ItemManage> listLastCategory = null;

		if(parentCt == 0 && listCategory.size() != 0) {
			parentCt = listCategory.get(0).getCtNum();
		}
		listSubCategory = service.listSubCategory(parentCt);
		if(subCtNum == 0 && listSubCategory.size() != 0) {
			subCtNum = listSubCategory.get(0).getCtNum();
		}
		listLastCategory = service.listSubCategory(subCtNum);
		if(lastCtNum == 0 && listLastCategory.size() != 0) {
			lastCtNum = listLastCategory.get(0).getCtNum();
		} else if(lastCtNum == 0 && listLastCategory.size() == 0 ) {
			lastCtNum = subCtNum;
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("parentCt", parentCt);
		map.put("subCtNum", subCtNum);
		map.put("lastCtNum", lastCtNum);
		map.put("col", col);
		map.put("kwd", kwd);

		dataCount = service.dataCount(map);

		total_page = myUtilGeneral.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		List<ItemManage> list = service.listItem(map);

		String listUrl = cp + "/admin/itemManage/list";
		String articleUrl = cp + "/admin/itemManage/article?page="+current_page;

		String query = "parentCt=" + parentCt + "&subCtNum=" + subCtNum + "&ctNum="+lastCtNum;

		if(lastCtNum == subCtNum) {
			query = "parentCt="+parentCt+"&ctNum="+subCtNum;
		}

		if (kwd.length() != 0) {
			query += "&col=" + col + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}		

		listUrl += "?" + query;
		articleUrl += "&" + query;

		String paging = myUtilGeneral.paging(current_page, total_page, listUrl);

		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listSubCategory", listSubCategory);
		model.addAttribute("listLastCategory", listLastCategory);
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);

		model.addAttribute("parentCt", parentCt);
		model.addAttribute("subCtNum", subCtNum);
		model.addAttribute("lastCtNum", lastCtNum);
		model.addAttribute("col", col);
		model.addAttribute("kwd", kwd);

		model.addAttribute("articleUrl", articleUrl);

		model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return ".admin.itemManage.list";

	}

	@GetMapping("listSubCategory")
	@ResponseBody
	public Map<String, Object> listSubCategory(@RequestParam long parentCt) throws Exception {
		Map<String , Object> model = new HashMap<String, Object>();

		List<ItemManage> listSubCategory = service.listSubCategory(parentCt);

		model.put("listSubCategory", listSubCategory);

		return model;

	}

	@GetMapping("listLastCategory")
	@ResponseBody
	public Map<String, Object> listLastCategory(@RequestParam long parentCt) throws Exception {
		Map<String , Object> model = new HashMap<String, Object>();

		List<ItemManage> listLastCategory = service.listSubCategory(parentCt);

		model.put("listLastCategory", listLastCategory);

		return model;

	}


	@GetMapping("write")
	public String writeForm(Model model) {
		List<ItemManage> listCategory = service.listCategory();
		List<ItemManage> listSubCategory = null;
		List<ItemManage> listLastCategory = null;
		long parentCt = 0;
		long subCtNum = 0;

		if(listCategory.size() != 0) {
			parentCt = listCategory.get(0).getCtNum();
		}
		listSubCategory = service.listSubCategory(parentCt);

		if(listSubCategory.size() != 0) {
			subCtNum = listSubCategory.get(0).getCtNum();
		}
		listLastCategory = service.listSubCategory(subCtNum);

		model.addAttribute("mode", "write");
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listSubCategory", listSubCategory);
		model.addAttribute("listLastCategory", listLastCategory);

		return ".admin.itemManage.write";
	}

	@PostMapping("write")
	public String writeSubmit(ItemManage dto, HttpSession session, Model model,
			@RequestParam(defaultValue = "0") long parentCt,
			@RequestParam(defaultValue = "0") long subCtNum,
			@RequestParam(defaultValue = "0") long lastCtNum) {

		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "item";

		try {
			if(lastCtNum != 0) {
				dto.setCtNum(lastCtNum);
			}else {
				dto.setCtNum(subCtNum);
			}
			service.insertItem(dto, path);
		} catch (Exception e) {
		}

		String url = "redirect:/admin/itemManage/list?parentCt="+dto.getParentCt()+"&subCtNum="+subCtNum+"&ctNum="+lastCtNum;

		return url;
	}

	@GetMapping("update")
	public String updateForm (
			@RequestParam(defaultValue = "0") long parentCt,
			@RequestParam(defaultValue = "0") long subCtNum,
			@RequestParam(defaultValue = "0") long lastCtNum,
			@RequestParam long itemNum,
			@RequestParam String page,
			Model model) {
		ItemManage dto = service.readItem(itemNum);
		if(dto == null) {
			String query = "parentCt="+parentCt+"&subCtNum="+subCtNum+"&ctNum="+lastCtNum+"&page="+page;
			if(lastCtNum == 0) {
				query = "parentCt="+parentCt+"&ctNum="+subCtNum+"&page="+page;
			}
			return "redirect:/admin/itemManage/list?"+query;
		}
		List<ItemManage> listCategory = service.listCategory();
		List<ItemManage> listSubCategory = service.listSubCategory(parentCt);
		List<ItemManage> listLastCategory = service.listSubCategory(subCtNum);

		if(lastCtNum == 0 && listLastCategory.size() == 0 ) {
			lastCtNum = subCtNum;
		}

		List<ItemManage> listPhoto = service.listItemPhoto(itemNum);

		List<ItemManage> listOption1 = service.listItemOption1(itemNum);

		List<ItemManage> listOption2 = null;
		List<ItemManage> listOption22 = null;
		if(listOption1.size() > 0) {
			dto.setOption1Num(listOption1.get(0).getOption1Num());
			dto.setOption1Name(listOption1.get(0).getOption1Name());
			listOption2 = service.listItemOption2(listOption1.get(0).getOption1Num());
		}
		if(listOption1.size() > 1) {
			dto.setOption1Num2(listOption1.get(1).getOption1Num());
			dto.setOption1Name2(listOption1.get(1).getOption1Name());
			listOption22 = service.listItemOption2(listOption1.get(1).getOption1Num());
		}

		model.addAttribute("mode", "update");
		model.addAttribute("dto",dto);
		model.addAttribute("listPhoto",listPhoto);
		model.addAttribute("listOption2",listOption2);
		model.addAttribute("listOption22",listOption22);

		model.addAttribute("listCategory",listCategory);
		model.addAttribute("listSubCategory",listSubCategory);
		model.addAttribute("listLastCategory",listLastCategory);
		model.addAttribute("parentCt",parentCt);
		model.addAttribute("subCtNum",subCtNum);
		model.addAttribute("lastCtNum",lastCtNum);

		model.addAttribute("page",page);

		return ".admin.itemManage.write";
	}


	@PostMapping("update")
	public String updateSubmit(
			ItemManage dto,
			@RequestParam String page,
			@RequestParam(defaultValue = "0") long parentCt,
			@RequestParam(defaultValue = "0") long subCtNum,
			@RequestParam(defaultValue = "0") long lastCtNum,
			HttpSession session,
			Model model) {

		List<ItemManage> listCategory = service.listCategory();
		List<ItemManage> listSubCategory = null;
		List<ItemManage> listLastCategory = null;

		if(parentCt == 0 && listCategory.size() != 0) {
			parentCt = listCategory.get(0).getCtNum();
		}
		listSubCategory = service.listSubCategory(parentCt);
		if(subCtNum == 0 && listSubCategory.size() != 0) {
			subCtNum = listSubCategory.get(0).getCtNum();
		}
		listLastCategory = service.listSubCategory(subCtNum);
		if(lastCtNum == 0 && listLastCategory.size() != 0) {
			lastCtNum = listLastCategory.get(0).getCtNum();
		} else if(lastCtNum == 0 && listLastCategory.size() == 0 ) {
			lastCtNum = subCtNum;
		}

		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "item";

		try {

			dto.setCtNum(lastCtNum);

			service.updateItem(dto, path);
		} catch (Exception e) {
		}

		String query = "parentCt=" + dto.getParentCt() + "&subCtNum=" + dto.getSubCtNum() + "&ctNum=" + dto.getCtNum() +"&page="+page;

		if(dto.getCtNum() == dto.getSubCtNum()) {
			query = "parentCt="+dto.getParentCt()+"&ctNum="+dto.getSubCtNum()+"&page="+page;
		}

		return "redirect:/admin/itemManage/list?"+query;
	}




	@RequestMapping(value = "deletePhoto", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deletePhoto(@RequestParam long photoNum, 
			@RequestParam String photoName, HttpSession session) throws Exception {

		String state = "true";
		try {

			String root = session.getServletContext().getRealPath("/");
			String path = root + "uploads" + File.separator + "item"+File.separator+photoName;

			service.deleteItemPhoto(photoNum, path);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value = "deleteOption2", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteOption2(@RequestParam long option2Num) throws Exception {
		String state = "true";
		try {
			service.deleteOption2(option2Num);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}


	@PostMapping("deleteListItem")
	public String deleteListItem (
			@RequestParam List<Long> nums,
			@RequestParam String page,
			@RequestParam(defaultValue = "0") long parentCt,
			@RequestParam(defaultValue = "0") long subCtNum,
			@RequestParam(defaultValue = "0") long lastCtNum,
			HttpSession session)throws Exception{

		List<ItemManage> listCategory = service.listCategory();
		List<ItemManage> listSubCategory = null;
		List<ItemManage> listLastCategory = null;

		if(parentCt == 0 && listCategory.size() != 0) {
			parentCt = listCategory.get(0).getCtNum();
		}
		listSubCategory = service.listSubCategory(parentCt);
		if(subCtNum == 0 && listSubCategory.size() != 0) {
			subCtNum = listSubCategory.get(0).getCtNum();
		}
		listLastCategory = service.listSubCategory(subCtNum);
		if(lastCtNum == 0 && listLastCategory.size() != 0) {
			lastCtNum = listLastCategory.get(0).getCtNum();
		} else if(lastCtNum == 0 && listLastCategory.size() == 0 ) {
			lastCtNum = subCtNum;
		}


		try {

			String root = session.getServletContext().getRealPath("/");
			String path = root + "uploads" + File.separator + "item";

			service.deleteItemList(nums,path);

		} catch (Exception e) {

		}

		String query = "parentCt=" + parentCt + "&subCtNum=" + subCtNum + "&ctNum=" + lastCtNum +"&page="+page;

		if(lastCtNum ==  subCtNum ) {
			query = "parentCt="+parentCt+"&ctNum="+subCtNum+"&page="+page;
		}

		return "redirect:/admin/itemManage/list?"+query;
	}

	@GetMapping("stockList")
	public String stockListForm(
			@RequestParam long itemNum,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req,
			@RequestParam(defaultValue = "0") long parentCt,
			@RequestParam(defaultValue = "0") long subCtNum,
			@RequestParam(defaultValue = "0") long lastCtNum,
			Model model) throws Exception{

		List<ItemManage> listCategory = service.listCategory();
		List<ItemManage> listSubCategory = null;
		List<ItemManage> listLastCategory = null;

		if(parentCt == 0 && listCategory.size() != 0) {
			parentCt = listCategory.get(0).getCtNum();
		}
		listSubCategory = service.listSubCategory(parentCt);
		if(subCtNum == 0 && listSubCategory.size() != 0) {
			subCtNum = listSubCategory.get(0).getCtNum();
		}
		listLastCategory = service.listSubCategory(subCtNum);
		if(lastCtNum == 0 && listLastCategory.size() != 0) {
			lastCtNum = listLastCategory.get(0).getCtNum();
		} else if(lastCtNum == 0 && listLastCategory.size() == 0 ) {
			lastCtNum = subCtNum;
		}

		String cp = req.getContextPath();

		int size = 10;
		int total_page;
		int dataCount;

		List<ItemStock> stockList = service.stocklist(itemNum);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemNum", itemNum);

		dataCount = service.stockDataCount(map);

		total_page = myUtilGeneral.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		String listUrl = cp + "/admin/itemManage/list";

		String query = "parentCt=" + parentCt + "&subCtNum=" + subCtNum + "&ctNum="+lastCtNum +"itemNum="+itemNum;

		if(lastCtNum == subCtNum) {
			query = "parentCt="+parentCt+"&ctNum="+subCtNum +"itemNum="+itemNum;
		}

		listUrl += "?" + query;

		String paging = myUtilGeneral.paging(current_page, total_page, listUrl);

		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listSubCategory", listSubCategory);
		model.addAttribute("listLastCategory", listLastCategory);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("stockList",stockList);

		model.addAttribute("parentCt", parentCt);
		model.addAttribute("subCtNum", subCtNum);
		model.addAttribute("lastCtNum", lastCtNum);
		model.addAttribute("itemNum", itemNum);

		model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);


		return ".admin.itemManage.stockList";
	}

	@PostMapping("updateStock")
	@ResponseBody
	public Map<String, Object> updateStock(
			@RequestParam Map<String, Object> paramMap) {

		String state = "true";
		try {
			service.updateItemStock(paramMap);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}

}
