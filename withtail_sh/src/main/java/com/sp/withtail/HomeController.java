package com.sp.withtail;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.withtail.member.SessionInfo;



@Controller
public class HomeController {
	@Autowired
	private HomeService service;
	
	@RequestMapping(value="/switchImage", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> switchImage(
			@RequestParam(value="animal", defaultValue ="1" ) int animal,
			HttpServletRequest req
		) {
		
		Map<String, Object> model = new HashMap<>();
		String imgUrl = "";
		if( animal == 1) {
			req.getSession().setAttribute("animal", 1);
			imgUrl = "icon_dog.png";
		} else {
			req.getSession().setAttribute("animal", 2);
			imgUrl = "icon_cat.png";
		}
		
		List<Home> listRank = service.listRank(animal);
		List<Home> listHotdeal = service.listHotdeal(animal);
		List<Home> listnewst = service.listnewst(animal);


		model.put("listRank", listRank);
		model.put("listHotdeal", listHotdeal);
		model.put("listnewst", listnewst);
		model.put("imgUrl", imgUrl);
		model.put("animal", animal);

		return model;
	}
	
	@GetMapping(value = "/header")
	@ResponseBody
	public int header(
			HttpSession session, HttpServletRequest req) {
		
		if((SessionInfo)session.getAttribute("member") == null) {
			return 0;
		}
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");

		int cartCount = service.cartCount(info.getUserId());

		return cartCount;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,
			@RequestParam(value = "animal", defaultValue = "1") int animal,
			HttpServletRequest req) {

		
		if(req.getSession().getAttribute("animal") == null || (int)req.getSession().getAttribute("animal") == 1) {
			req.getSession().setAttribute("animal", 1);
			animal = 1;
		} else {
			req.getSession().setAttribute("animal", 2);
			animal = 2;
		}
		
		List<Home> listRank = service.listRank(animal);
		List<Home> listHotdeal = service.listHotdeal(animal);
		List<Home> listnewst = service.listnewst(animal);
		
		model.addAttribute("animal", animal);
		model.addAttribute("listRank", listRank);
		model.addAttribute("listHotdeal", listHotdeal);
		model.addAttribute("listnewst", listnewst);
		return ".home";
	}
	
}
