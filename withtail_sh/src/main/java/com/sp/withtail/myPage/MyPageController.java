package com.sp.withtail.myPage;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.withtail.member.SessionInfo;

@Controller
@RequestMapping("/myPage/*")
public class MyPageController { 
	@Autowired
	private MyPageService service;
	
    @RequestMapping(value = "myPage")
    public String list(MyPage dto, HttpSession session, 
    					Model model) throws Exception {  
    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	int dataCount;
    	int addDataCount;
    	int couponUnusedDataCount;
    	int pointDataCount;
    	
    	dto.setUserId(info.getUserId());
		dataCount = service.dataCount(info.getUserId());
		addDataCount = service.addDataCount(info.getUserId());
		couponUnusedDataCount = service.couponUnusedDataCount(info.getUserId());
		pointDataCount = service.pointDataCount(info.getUserId());
		
		MyPage dto2 = service.readProfile(info.getUserId());
		
		List<MyPage> list = service.listMyPages(dto);
		List<MyPage> list1 = service.listDelivery(dto);
	
		List<MyPage> list2 = service.listPoint(info.getUserId());
		
		MyPage dto3 = null;
		if(list2.size() > 0)
	        dto3 = list2.get(0);
		
		
		    MyPage dto1 = null;
		    if(list1.size() > 0)
		        dto1 = list1.get(0);	
	
		
		model.addAttribute("dto3", dto3);
		model.addAttribute("dto2", dto2);
		model.addAttribute("list1", list1);
    	model.addAttribute("list", list);
    	model.addAttribute("addDataCount", addDataCount);
    	model.addAttribute("dataCount", dataCount);
    	model.addAttribute("dto1", dto1);
    	model.addAttribute("couponUnusedDataCount", couponUnusedDataCount);
    	model.addAttribute("pointDataCount", pointDataCount);
    	
        return ".myPage.myPage";
    }
    
    @GetMapping("favorite")
	public String favorite(MyPage dto, HttpSession session,
			Model model) throws Exception {
    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	int favoriteDataCount;
    	
    	dto.setUserId(info.getUserId());
    	favoriteDataCount = service.favoriteDataCount(info.getUserId());
    	
    	List<MyPage> list = service.listFavorite(info.getUserId());
    	
    	model.addAttribute("list", list);
    	model.addAttribute("favoriteDataCount", favoriteDataCount);
    	
		return ".myPage.favorite";
	}
    
    @PostMapping("deleteFavorite")
    @ResponseBody
    public Map<String, Object> deleteFavorite(MyPage dto) throws Exception {
    	
    	String state = "true";
    	try {
			service.deleteFavorite(dto.getItemNum());
		} catch (Exception e) {
			state = "false";
		}
    	
    	Map<String, Object> model = new HashMap<String, Object>();
    	model.put("state", state);
    	
    	return model;
    }
    
    @GetMapping("orders")
	public String orders(MyPage dto, HttpSession session, 
			Model model) throws Exception {
    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	int orderDataCount;

    	
    	dto.setUserId(info.getUserId());
    	orderDataCount = service.orderDataCount(info.getUserId());
   		
		
		List<MyPage> list = service.listOrder(dto);
		
		
    	model.addAttribute("list", list);
    	model.addAttribute("orderDataCount", orderDataCount);
    	
		return ".myPage.orders";
	}
    
    @GetMapping("orderDetail")
	public String orderDetail(@RequestParam long orderNum, 
			Model model, HttpSession session) throws Exception {
    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	
    	MyPage dto = service.readOrderList(orderNum);
    
    	MyPage dto1 = service.readPoint(info.getUserId());
    	
    
    	
    	List<MyPage> list = service.listNumOrder(orderNum);
    	model.addAttribute("dto", dto);
    	model.addAttribute("list", list);
    	model.addAttribute("dto1", dto1);
    	
		return ".myPage.orderDetail";
	}
    
    @PostMapping("updateOrderState")
    @ResponseBody
    public Map<String, Object> updateOrderState (MyPage dto) throws Exception {
    	
    	String state = "true";
    	try {
			service.updateOrderState(dto.getOrderNum());
		} catch (Exception e) {
			state = "false";
		}
    	
    	Map<String, Object> model = new HashMap<String, Object>();
    	model.put("state", state);
    	
    	return model;
    }
    
    @PostMapping("getPoint")
    @ResponseBody
    public Map<String, Object> getPoint(MyPage dto, HttpSession session) throws Exception {
    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	
    	String state = "true";
    	try {
    		
    		MyPage dto1 = service.readPoint(info.getUserId());
    		if(dto1 != null) {
    			dto.setBalance(dto1.getBalance() + dto.getAmount());
    		} else {
    			dto.setBalance(dto.getAmount());
    		}
    		dto.setUserId(info.getUserId());
    		
    		service.getPoint(dto);
    		
    		service.memberEdit(dto);
    		
		} catch (Exception e) {
			state = "false";
		}
    	
    	Map<String, Object> model = new HashMap<String, Object>();
    	model.put("state", state);
    	
    	return model;
    }
    
    
    @PostMapping("updateOrderCancel")
    @ResponseBody
    public Map<String, Object> updateOrderCancel (MyPage dto) throws Exception {
    	
    	String state = "true";
    	try {
			service.updateOrderCancel(dto.getOrderNum());
		} catch (Exception e) {
			state = "false";
		}
    	
    	Map<String, Object> model = new HashMap<String, Object>();
    	model.put("state", state);
    	
    	return model;
    }
    
    @PostMapping("updateOrderRefund")
    @ResponseBody
    public Map<String, Object> updateOrderRefund (MyPage dto) throws Exception {
    	
    	String state = "true";
    	try {
			service.updateOrderRefund(dto.getOrderNum());
		} catch (Exception e) {
			state = "false";
		}
    	
    	Map<String, Object> model = new HashMap<String, Object>();
    	model.put("state", state);
    	
    	return model;
    }
    
    @GetMapping("pet")
	public String pet(@RequestParam long num, 
			Model model) throws Exception {
    	    	 	
    	MyPage dto = service.readPet(num);
 
    	// LocalDate today = LocalDate.now();
        // LocalDate birth = LocalDate.parse(dto.getBirth2());

       // Period period = Period.between(birth, today);
        
        // int age = period.getYears();
     
    	model.addAttribute("dto", dto);
    //	model.addAttribute("age", age);
    	
    	return ".myPage.pet";
	}
    
    @GetMapping(value = "delete")
    public String delete(@RequestParam long num, HttpSession session) throws Exception {
    	String root = session.getServletContext().getRealPath("/");
    	String pathname = root + "uploads" + File.separator + "pets";
    	
    	try {
    		service.deletePet(num ,pathname);    
    	} catch (Exception e) {
		}
    	
    	return "redirect:/myPage/myPage";
    }
    
    @GetMapping(value = "petEdit")
    public String petEditForm(@RequestParam long num,
    		Model model) throws Exception {
    	
    	MyPage dto = service.readPet(num);
    	
    	model.addAttribute("dto", dto);
    	
    	return ".myPage.petEdit";
    }
    
    @PostMapping(value = "petEdit")
    public String petEditSubmit(MyPage dto,
    		HttpSession session) throws Exception {
    	String root = session.getServletContext().getRealPath("/");
    	String pathname = root + "uploads" + File.separator + "pets";
    	
    	try {
    		service.updatePet(dto, pathname);
		} catch (Exception e) {
		}
    	
    	return "redirect:/myPage/pet?num=" + dto.getNum();
    }
    
    @GetMapping("storecredit")
   	public String storecredit(MyPage dto, HttpSession session, 
			Model model) throws Exception {
    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	
    	List<MyPage> list = service.listPoint(info.getUserId());
    	
    	 MyPage dto1 = null;
		    if(list.size() > 0)
		        dto1 = list.get(0);
    		
    	int pointDataCount = 0;
    	
    	pointDataCount = service.pointDataCount(info.getUserId());
    	
    	model.addAttribute("dto1", dto1);
    	model.addAttribute("list", list);
    	model.addAttribute("pointDataCount", pointDataCount);
   	
   		return ".myPage.storecredit";
   	}
    
    @GetMapping("delivery")
   	public String deliveryList(MyPage dto, HttpSession session, 
			Model model) throws Exception {
    	SessionInfo info = (SessionInfo) session.getAttribute("member");

		dto.setUserId(info.getUserId());
		List<MyPage> list = service.listDelivery(dto);
		
		int dataCount = 0;
    	
		dataCount = service.dataCount(info.getUserId());
		
    	model.addAttribute("list", list);
    	model.addAttribute("dataCount", dataCount);
    	
   		return ".myPage.delivery";
   	}
    
    
    @GetMapping("writeDelivery")
   	public String deliveryForm(Model model) throws Exception {
    	  	
    	model.addAttribute("mode", "writeDelivery");
    	
   		return ".myPage.writeDelivery";
   	}
    
    @PostMapping("writeDelivery")
   	public String deliverySubmit(MyPage dto, HttpSession session) throws Exception {
    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	
    	try {
			dto.setUserId(info.getUserId());
			service.insertAdd(dto);
			
		} catch (Exception e) {
		}
   		return "redirect:/myPage/delivery";
   	}
    
    @GetMapping("update")
    public String updateAddform(@RequestParam long num, Model model) throws Exception {
    	MyPage dto = service.readAdd(num);
    	
    	model.addAttribute("dto",dto);
    	model.addAttribute("mode", "update");
    	
    	return ".myPage.writeDelivery";
    }
    
    @PostMapping("update")
    public String updateAddSubmit(MyPage dto, HttpSession session) throws Exception {
    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	
    	try {
    		dto.setUserId(info.getUserId());
			service.updateAdd(dto);
		} catch (Exception e) {
		}
    	
    	return "redirect:/myPage/delivery";
    }

    @GetMapping(value = "deleteAdd")
    public String deleteAdd(@RequestParam long num,
    		Model model) throws Exception {
    
   	
    	try {
    		service.deleteAdd(num);    
    	} catch (Exception e) {
		}
    	
    	return "redirect:/myPage/delivery";
    }
    
    @PostMapping("updateProfileName")
    @ResponseBody
    public Map<String, Object> updateProfileNameSubmit(MyPage dto, HttpSession session) throws Exception {
    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	
    	String state = "true";
    	try {
    		dto.setUserId(info.getUserId());
			service.updateProfileName(dto);
		} catch (Exception e) {
			state = "false";
		}
    	
    	Map<String, Object> model = new HashMap<String, Object>();
    	model.put("state", state);
    	return model;
    }
    
    @PostMapping("updatePwd")
    @ResponseBody
    public Map<String, Object> updatePwdSubmit(MyPage dto, HttpSession session) throws Exception {
    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	
    	String state = "true";
    	try {
    		dto.setUserId(info.getUserId());
			service.updatePwd(dto);
		} catch (Exception e) {
			state = "false";
		}
    	
    	Map<String, Object> model = new HashMap<String, Object>();
    	model.put("state", state);
    	return model;
    }
    
    @GetMapping("profile")
  	public String profile(MyPage dto, HttpSession session, 
  			Model model) throws Exception {
      	    	 	
    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	
    	dto.setUserId(info.getUserId());
    	
    	MyPage dto1 = service.readProfile(dto.getUserId());	
      
    	model.addAttribute("dto1", dto1);
      
      	
      	return ".myPage.profile";
  	}
    
    @GetMapping("unregister")
    public String unregister(MyPage dto, HttpSession session, 
  			Model model) throws Exception {
    	
    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	
    	dto.setUserId(info.getUserId());
    	
    	MyPage dto1 = service.readProfile(dto.getUserId());	
      
    	model.addAttribute("dto1", dto1);
    	
    	return ".myPage.unregister";
    }
    
    @PostMapping(value = "updateUnregister")
    @ResponseBody
    public Map<String, Object> updateUnregister (MyPage dto,
    		HttpSession session) throws Exception {
    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	
    	String state = "true";
    	try {
    		dto.setUserId(info.getUserId());
			service.updateEnabled(dto);
			service.insertMemberState(dto);
		} catch (Exception e) {
			state = "false";
		}
    	
    	Map<String, Object> model = new HashMap<String, Object>();
    	model.put("state", state);
    	return model;
    }
    
    @RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		// 세션에 저장된 정보 지우기
		session.removeAttribute("member");

		// 세션에 저장된 모든 정보 지우고, 세션초기화
		session.invalidate();

		return "redirect:/";
	}
    
    @GetMapping("coupon")
   	public String couponList(MyPage dto, HttpSession session, 
			Model model) throws Exception {
    	SessionInfo info = (SessionInfo) session.getAttribute("member");

		dto.setUserId(info.getUserId());
		List<MyPage> list = service.listCoupon(dto);
		
		
		int couponUnusedDataCount = 0;
    	
		MyPage dto1 = service.readProfile(info.getUserId());
		
		couponUnusedDataCount = service.couponUnusedDataCount(info.getUserId());
		
    	model.addAttribute("list", list);
    	model.addAttribute("dto1",dto1);
    	model.addAttribute("couponUnusedDataCount", couponUnusedDataCount);
    	
   		return ".myPage.coupon";
   	}
    
    @PostMapping("insertCart")
    @ResponseBody
    public Map<String, Object> insertCart(MyPage dto, HttpSession session) {
    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	String state ="true";
    	
    	try {
    		dto.setUserId(info.getUserId());
			service.insertCart(dto);
		} catch (Exception e) {
			state = "false";
		}
    	
    	Map<String, Object> model = new HashMap<>();
    	model.put("state", state);
    	
    	return model;
    }
    
    @GetMapping("writeReview")
    public String writeReviewForm(@RequestParam long orderDetailNum,
    		Model model) throws Exception {
    	
    	MyPage dto = service.readReviewItem(orderDetailNum);
    	
    	model.addAttribute("dto", dto);
    	
    	return ".myPage.writeReview";
    }
    
    
    @PostMapping("writeReview")
   	public String writeReviewSubmit(MyPage dto, HttpSession session, 
   			
   			Model model) throws Exception {
    	SessionInfo info = (SessionInfo) session.getAttribute("member");
    	
    	String root = session.getServletContext().getRealPath("/");
    	String pathname = root + "uploads" + File.separator + "review";
    	
    	try {
    	
    		dto.setUserId(info.getUserId());
			service.insertReview(dto, pathname);
		
			
		} catch (Exception e) {
		}
   		return "redirect:/myPage/thankYou?itemNum=" + dto.getItemNum() + "&orderDetailNum=" + dto.getOrderDetailNum();
   	}
      
    @GetMapping("thankYou")
    public String thankYou(@RequestParam long orderDetailNum,
    		Model model) throws Exception {
    	
    	MyPage dto = service.readReviewItem(orderDetailNum);
    	
    	model.addAttribute("dto", dto);
    	
    	return ".myPage.thankYou";
    }
    
}