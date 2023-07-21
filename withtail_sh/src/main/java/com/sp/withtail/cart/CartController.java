package com.sp.withtail.cart;

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

import com.sp.withtail.member.SessionInfo;

@Controller("cart.cartController")
@RequestMapping("/cart/*")
public class CartController {
	@Autowired
	private CartService service;
	
	@GetMapping("cart")
	public String cartForm(HttpSession session, Model model) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		List<Cart> list = service.listCart(info.getUserId());
		Cart nullCheck = service.listNullCheck(info.getUserId());
		Cart deliveryFeeMax = service.deliveryFee(info.getUserId());
	
		
		model.addAttribute("list", list);
		model.addAttribute("nullCheck", nullCheck);
		model.addAttribute("deliveryFeeMax", deliveryFeeMax);
		return ".cart.cart";
	}
	
	// 선택상품 장바구니 비우기
	@PostMapping("deleteListCart")
	public String deleteListCart(@RequestParam List<Long> nums, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("gubun", "list");
			map.put("userId", info.getUserId());
			map.put("list", nums);

			service.deleteCart(map);

		} catch (Exception e) {
		}

		return "redirect:/cart/cart";
	}

	// 장바구니 모두 비우기
	@GetMapping("deleteCartAll")
	public String deleteCartAll(HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("gubun", "all");
			map.put("userId", info.getUserId());

			service.deleteCart(map);

		} catch (Exception e) {
		}

		return "redirect:/cart/cart";
	}
	

	
	
	@GetMapping("checkout")
	public String execute() throws Exception {
	
		return ".cart.checkout";
	}
}
