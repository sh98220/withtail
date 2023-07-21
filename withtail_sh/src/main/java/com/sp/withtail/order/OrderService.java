package com.sp.withtail.order;

import java.util.List;
import java.util.Map;

public interface OrderService {
	public void insertCart(Order dto) throws Exception;
	public List<Order> listCart(String userId);
	public void deleteCart(Map<String, Object> map) throws Exception;
	
	// 장바구니 총 개수, 수량 불러오기
	public Order readUserCart(String userId);
	
	// 주문 전 회원 정보 불러오기(포인트, 이메일, 쿠폰 개수)
	public OrderMember readMember(String userId);
	
	// 주문 전 회원 배송지 목록 불러오기
	public List<OrderMember> listAddress(String userId);
	
	// 주문 전 회원이 보유한 쿠폰 목록 불러오기
	public List<OrderMember> listCoupon(String userId);
	
	// 주문전 회원 기본 배송지 가져오기
	public OrderMember readDefAddress(String userId);
	
	// 주문전 회원 최근 입력한 가져오기
	public OrderMember readLastAddress(String userId);
	
	// 새로운 배송지 추가
	public void insertAdd(OrderMember dto) throws Exception;
	
	// 기존 배송지 수정
	public void updateAdd(OrderMember dto) throws Exception;
	
	// 선택한 배송지 불러오기
	public OrderMember readAdd(Long addNum);
	
	// 배송지 삭제
	public void deleteAdd(Long addNum) throws Exception;
	
	// 배송지 개수
	public int addDataCount(String userId);
	
	// 결제할 상품 목록 가져오기
	public List<Order> listProduct(List<Map<String, Long>> list);
	
	// 주문번호 생성
	public Long productOrderNumber();
	
	//주문 인서트(주문, 주문상세, 결제내역, 주문배송지까지)
	public void insertOrder(Order dto) throws Exception;
	
	// 멤버 포인트 업데이트
	public void updateMemberPoint(Order dto) throws Exception;
	
	// 포인트 기록 인서트
	public void insertPointDetail(Order dto) throws Exception;
}
