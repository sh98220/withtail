package com.sp.withtail.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.withtail.common.dao.CommonDAO;

@Service("order.orderService")
public class OrderServiceImpl implements OrderService {
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertCart(Order dto) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", dto.getUserId());
		
		try {
			for(int i = 0; i < dto.getItemNums().size(); i++) {
				// 장바구니 추가, 수정 구분
				map.put("itemNum", dto.getItemNums().get(i));
				if(dto.getSubNums() != null) {
					map.put("option2Num", dto.getSubNums().get(i));
				}
				if(dto.getSubNums2() != null) {
					map.put("option2Num2", dto.getSubNums2().get(i));
				}
				
				dto.setItemNum(dto.getItemNums().get(i));
				
				// List NULL값 체크
				if(dto.getSubNums() != null) {
					dto.setOption2Num(dto.getSubNums().get(i));
				}
				
				if(dto.getSubNums2() != null) {
					dto.setOption2Num2(dto.getSubNums2().get(i));
				}
				
				dto.setQuantity(dto.getQtys().get(i));
				
				if(dao.selectOne("order.readCart", map) == null) {
					dao.insertData("order.insertCart", dto);
				} else {
					dao.updateData("order.updateCart", dto);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Order> listCart(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteCart(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Order readUserCart(String userId) {
		Order dto = null;
		
		try {
			dto = dao.selectOne("order.readUserCart", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public OrderMember readMember(String userId) {
		OrderMember dto = null;
		
		try {
			dto = dao.selectOne("order.readMember", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<OrderMember> listAddress(String userId) {
		List<OrderMember> list = null;
		
		try {
			list = dao.selectList("order.listAddress", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<OrderMember> listCoupon(String userId) {
		List<OrderMember> list = null;
		
		try {
			list = dao.selectList("order.listCoupon", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public OrderMember readDefAddress(String userId) {
		OrderMember dto = null;
		
		try {
			dto = dao.selectOne("order.readDefAddress", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public OrderMember readLastAddress(String userId) {
		OrderMember dto = null;
		
		try {
			dto = dao.selectOne("order.readLastAddress", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void insertAdd(OrderMember dto) throws Exception {
		try {
			dao.insertData("order.insertAdd", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateAdd(OrderMember dto) throws Exception {
		try {
			dao.updateData("order.updateAdd", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public OrderMember readAdd(Long addNum) {
		OrderMember dto = null;
		
		try {
			dto = dao.selectOne("order.readAdd", addNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void deleteAdd(Long addNum) throws Exception {
		try {
			dao.deleteData("order.deleteAdd", addNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int addDataCount(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("order.addDataCount", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Order> listProduct(List<Map<String, Long>> list) {
		List<Order> listProduct = null;
		
		try {
			listProduct = dao.selectList("order.listProduct", list);
			for(Order dto : listProduct) {
				int saleAmount = 0;
				if(dto.getDiscount() > 0) {
					saleAmount = (int)(dto.getItemPrice() * (dto.getDiscount()/100.0));
					dto.setSaleAmount(saleAmount);
				}
				
				dto.setDcPrice(dto.getItemPrice() - saleAmount);
				//dto.setItemPrice(dto.getDcPrice() + dto.getExtraPrice() + dto.getExtraPrice2());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listProduct;
	}

	@Override
	public Long productOrderNumber() {
		Long result = null;
		
		try {
			result = dao.selectOne("order.readOrderNumber");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertOrder(Order dto) throws Exception {
		try {
			// 주문정보 저장
			dao.insertData("order.insertOrder", dto);
						
			// 결제 내역 저장
			dao.insertData("order.insertPayDetail", dto);
			
			// 주문상세
			for(int i=0; i<dto.getItemNums().size(); i++) {
				dto.setItemNum(dto.getItemNums().get(i));
				dto.setCount(dto.getQtys().get(i));
				if(dto.getSubNums() != null) {
					dto.setOption2Num(dto.getSubNums().get(i));
				} else if(dto.getSubNums() == null) {
					dto.setOption2Num(null);
				}
				if(dto.getSubNums2() != null) {
					dto.setOption2Num2(dto.getSubNums2().get(i));
				} else if(dto.getSubNums2() == null) {
					dto.setOption2Num2(null);
				}
				
				dto.setPurchaseMoney(dto.getPurchaseMoneys().get(i));
				dto.setPrice(dto.getPrices().get(i));
				dto.setSalePrice(dto.getSalePrices().get(i));
				dto.setSavePoint(dto.getSavePoints().get(i));
				
				dao.insertData("order.insertOrderDetail", dto);
			}
			
			// 주문 배송지
			dao.insertData("order.insertOrderAddress", dto);
			
			// 쿠폰 사용
			//dto.setUsedCouponNum(dto.getUsedCouponNum());
			if(dto.getUsedCouponNum() != null || String.valueOf(dto.getUsedCouponNum()) != "") {
				dao.updateData("order.updateUsedCoupon", dto.getUsedCouponNum());
			}
			
			dto.setBalance(dto.getPoint() - dto.getUsedPoint());
			
			// 포인트 사용
			dao.updateData("order.updateMemberPoint", dto);
			dao.insertData("order.insertPointDetail", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateMemberPoint(Order dto) throws Exception {
		try {
			dao.updateData("order.updateMemberPoint", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertPointDetail(Order dto) throws Exception {
		try {
			int balance = dto.getPoint() - dto.getUsedPoint();
			dto.setBalance(balance);
			dao.insertData("order.insertPointDetail", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
