package com.sp.withtail.pets;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.withtail.member.SessionInfo;

@Controller("pets.petsController")
@RequestMapping("/pets/*")
public class PetsController {
	@Autowired
	private PetsServcie service;
    
    @GetMapping("new")
    public String writeForm() throws Exception {
    	
    	return ".pets.new";
    }
	    
	@PostMapping("new")
	public String writeSubmit(Pets dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "pets";
		
		try {
			dto.setUserId(info.getUserId());
			
			
			service.insertPets(dto, pathname);		
		} catch (Exception e) {
		}
		return "redirect:/myPage/myPage";
	}
}
