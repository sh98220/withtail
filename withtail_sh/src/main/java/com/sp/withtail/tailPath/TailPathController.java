package com.sp.withtail.tailPath;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller("tailPath.tailPathController")
@RequestMapping("/tailPath/*")
public class TailPathController {
	
	@Autowired
	private TailPathService service;   
	
	@GetMapping(value = "main")
	public String main() throws Exception{
	
		return ".tailPath.main";
	}
	
	@PostMapping("main")
	public String insert(@RequestBody List<String> nameData) throws Exception{
		
		//service.insertTailPath(nameData);

		return ".tailPath.main";
	}
	
	@RequestMapping(value = "article")
	public String article(Model model, @RequestParam Map<String, String> paramMap) throws Exception{
		
		 model.addAttribute("item", paramMap);
		 
		
		return ".tailPath.article";
	}
	
	@RequestMapping(value = "boardList")
	public String boardList() throws Exception{
		
		return ".tailPath.boardList";
	}
	
	@RequestMapping(value = "boardArticle")
	public String boardArticle() throws Exception{
		
		return ".tailPath.boardArticle";
	}
	
	

}
