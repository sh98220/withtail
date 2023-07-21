package com.sp.withtail.admin.dogMapManage;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.withtail.common.MyUtil;


@Controller("admin.dogMapManageController")
@RequestMapping("/admin/dogMapManage/*")
public class DogMapManageController {
	@Autowired
	private DogMapManageService service;
	
	@Autowired
	private MyUtil myUtilGeneral;

	@RequestMapping(value = "list")
	public String list(
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
		
		Map<String, Object> map = new HashMap<String, Object>();
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
		
		List<DogMapManage> list = service.listDogMap(map);
		
		String listUrl = cp + "/admin/dogMapManage/list";
		
		String query = "";
		
		if (kwd.length() != 0) {
			query += "&col=" + col + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}	
		
		listUrl += "?" + query;
		
		String paging = myUtilGeneral.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);

		model.addAttribute("col", col);
		model.addAttribute("kwd", kwd);


		model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".admin.dogMapManage.list";
	}

	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(			
			@RequestParam long placeNum,
			@RequestParam String page,
			Model model) throws Exception {
		
		DogMapManage dto = service.readDogMap(placeNum);
		
		if(dto == null) {
			String query = "page="+page;
			return "redirect:/admin/dogMapManage/list?"+query;
		}
		
		List<DogMapManage> listPhoto = service.listDogMapPhoto(placeNum);
		
		model.addAttribute("mode", "update");
		model.addAttribute("listPhoto", listPhoto);
		model.addAttribute("dto",dto);

		model.addAttribute("page",page);

		return ".admin.dogMapManage.write";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(	DogMapManage dto,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "dogMap";
		
		try {
			service.updateDogMap(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String query = "page="+page;
		return "redirect:/admin/dogMapManage/list?"+query;
	}


	@RequestMapping(value = "article")
	public String article(
			) throws Exception {

		return ".admin.dogMapManage.article";
	}

	@RequestMapping(value = "deletePhoto", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deletePhoto(@RequestParam long photoNum, 
			@RequestParam String photoName,
			HttpSession session) throws Exception {

		String state = "true";
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "dogMap" + File.separator + photoName;

			service.deleteDogMapPhoto(photoNum, pathname);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	


}
