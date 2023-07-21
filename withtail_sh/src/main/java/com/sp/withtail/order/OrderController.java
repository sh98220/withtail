package com.sp.withtail.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.withtail.member.SessionInfo;

@Controller("order.orderController")
@RequestMapping("/order/*")
public class OrderController {
	@Autowired
	public OrderService orderService;
	
	// 장바구니 추가(AJAX - JSON)
	@PostMapping("saveCart")
	@ResponseBody
	public Map<String, Object> saveCart(Order dto,
			@RequestParam List<Long> itemNums,
			@RequestParam(required = false) List<Long> subNums,
			@RequestParam(required = false) List<Long> subNums2,
			@RequestParam List<Long> qtys,
			HttpSession session) throws Exception {
		
		String state = "true";
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			
			orderService.insertCart(dto);
			
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping("payment")
	public String paymentForm(
			@RequestParam(value = "itemNums") List<Long> itemNums,
			@RequestParam(value = "subNums", required = false) List<Long> subNums,
			@RequestParam(value = "subNums2", required = false) List<Long> subNums2,
			@RequestParam(value = "qtys") List<Integer> qtys,
			@RequestParam(defaultValue = "buy") String mode,
			HttpSession session,
			Model model) throws Exception {
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			String userId = info.getUserId();
			
			OrderMember memberDto = orderService.readMember(userId);
			
			List<OrderMember> listAddress = orderService.listAddress(userId);
			List<OrderMember> listCoupon = orderService.listCoupon(userId);
			
			OrderMember defAddrDto = orderService.readDefAddress(userId);
			OrderMember lastAddrDto = orderService.readLastAddress(userId);
			
			Long productOrderNumber = null; // 주문번호
			String productOrderName = ""; // 주문상품이름
			int totalMoney = 0; // 상품합
			int deliveryCharge = 0; // 배송비
			int payment = 0;  // 결제할 금액(상품합 + 배송비)
			int totalDiscountPrice = 0; // 총 할인액
			int totalQty = 0; // 총 상품개수
			
			productOrderNumber = orderService.productOrderNumber();
			
			//itemNums = itemNums.substring(0, itemNums.lastIndexOf(","));
			
			//String[] itemNum = itemNums.split(",");
			
			List<Map<String, Long>> list = new ArrayList<Map<String,Long>>();
			
			for(int i = 0; i < itemNums.size(); i++) {
				Map<String, Long> map = new HashMap<String, Long>();
				
				//map.put("itemNum", Long.parseLong(itemNum[i]) );
				map.put("itemNum", itemNums.get(i));
				
				/*
				if(subNums != null && subNums.get(i) != 0) {
					map.put("option2Num", subNums.get(i));
				} else if(subNums == null || subNums.get(i) == 0) {
					map.put("option2Num", Long.valueOf(0));
				}
				
				if(subNums2 != null && subNums2.get(i) != 0) {
					map.put("option2Num2", subNums2.get(i));
				} else if(subNums2 == null || subNums2.get(i) == 0) {
					map.put("option2Num2", Long.valueOf(0));
				}
				*/
				
				if(subNums != null && subNums2 != null) {
					map.put("option2Num", subNums.get(i));
					map.put("option2Num2", subNums2.get(i));
				} if(subNums == null && subNums2 == null) {
					map.put("option2Num", Long.valueOf(0));
					map.put("option2Num2", Long.valueOf(0));
				} if(subNums == null && subNums2 != null) {
					map.put("option2Num", subNums2.get(i));
					map.put("option2Num2", subNums2.get(i));
				} if(subNums != null && subNums2 == null) {
					map.put("option2Num", subNums.get(i));
					map.put("option2Num2", subNums.get(i));
				}
				
				list.add(map);
			}
			
			List<Order> listProduct = orderService.listProduct(list);
			for(int i = 0; i < listProduct.size(); i++) {
				Order orderDto = listProduct.get(i);
				
				orderDto.setCount(qtys.get(i));
				orderDto.setPurchaseMoney(qtys.get(i) * orderDto.getDcPrice());
				
				totalMoney += qtys.get(i) * orderDto.getItemPrice() + ((orderDto.getExtraPrice()+orderDto.getExtraPrice2()) * qtys.get(i));
				totalDiscountPrice += qtys.get(i) * orderDto.getSaleAmount();
				
				if(i == 0 || deliveryCharge > orderDto.getDeliveryFee()) {
					deliveryCharge = orderDto.getDeliveryFee();
				}
				
				totalQty += qtys.get(i);
			}
			
			productOrderName = listProduct.get(0).getItemName();
			if(listProduct.size() > 1) {
				productOrderName += " 외 " + (listProduct.size() - 1) + "건";
			}
			
			deliveryCharge = totalMoney >= 100000 ? 0 : deliveryCharge;
			payment = totalMoney + deliveryCharge - totalDiscountPrice;
			
			model.addAttribute("memberDto", memberDto);
			model.addAttribute("listAddress", listAddress);
			model.addAttribute("listCoupon", listCoupon);
			model.addAttribute("defAddrDto", defAddrDto);
			model.addAttribute("lastAddrDto", lastAddrDto);
			
			model.addAttribute("productOrderNumber", productOrderNumber);
			model.addAttribute("productOrderName", productOrderName);
			
			model.addAttribute("listProduct", listProduct);
			model.addAttribute("totalMoney", totalMoney); // 총 상품금액(수량*정가의 합)
			model.addAttribute("payment", payment); // 결제할 금액
			model.addAttribute("totalDiscountPrice", totalDiscountPrice); // 총 할인액
			model.addAttribute("deliveryCharge", deliveryCharge); // 배송비
			model.addAttribute("totalQty", totalQty); // 총 구매개수
			
			model.addAttribute("mode", mode); // 바로구매인지 장바구니 구매인지를 가지고 있음
			
			return ".order.payment";
			
		} catch (Exception e) {
		}
		
		return "redirect:/";
	}
	
	@PostMapping("paymentOk")
	public String paymentOk(Order dto,
			@RequestParam(defaultValue = "buy") String mode,
			RedirectAttributes reAttr,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		String msg = "";
		Long orderNum = null;
		String state = "";
		String payMethod = "";
		
		try {
			dto.setUserId(userId);
			orderService.insertOrder(dto);
			
			if(mode.equals("cart")) {
				// 구매 상품에 대한 장바구니 비우기
				
			}
			
			String p = String.format("%,d", dto.getTotalPurchasePrice());
			msg = "주문이 정상적으로 완료되었습니다.";
			orderNum = dto.getOrderNum();
			state = "결제 완료";
			payMethod = "신용카드(" + dto.getCardName() + ")";
			
			reAttr.addFlashAttribute("dto", dto);
			reAttr.addFlashAttribute("payment", p);
			reAttr.addFlashAttribute("msg", msg);
			reAttr.addFlashAttribute("orderNum", orderNum);
			reAttr.addFlashAttribute("state", state);
			reAttr.addFlashAttribute("payMethod", payMethod);
			
			return "redirect:/order/complete";
			
		} catch (Exception e) {
			msg = "주문이 실패했습니다.";
			state = "결제 실패";
		}
		
		return "redirect:/";
	}
	
	@GetMapping("complete")
	public String complete(@ModelAttribute("dto") Order dto,
			@ModelAttribute("payment") String payment,
			@ModelAttribute("msg") String msg,
			@ModelAttribute("orderNum") Long orderNum,
			@ModelAttribute("state") String state,
			@ModelAttribute("payMethod") String payMethod) throws Exception {
		
		// F5를 누른 경우
		if(msg == null | msg.length() == 0) {
			return "redirect:/";
		}
		
		return ".order.complete";
	}
	
	@PostMapping("deleteAdd")
	@ResponseBody
	public Map<String, Object> deleteAdd(OrderMember dto) {
		String state = "true";
		
		try {
			orderService.deleteAdd(dto.getAddNum());
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
    	model.put("state", state);
    	
    	return model;
	}
	
}
