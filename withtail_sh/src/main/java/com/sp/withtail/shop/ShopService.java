package com.sp.withtail.shop;

import java.util.List;
import java.util.Map;

public interface ShopService {
	// 카테고리 리스트
	public List<Product> listCategory();
	
	// 현재 카테고리
	public Product readCategory(long ctNum);
	
	// 하위 카테고리 리스트(탭 표시)
	public List<Product> listSubCategory(long ctNum);
	
	public Product readSubCategory(long ctNum);
	
	// 상품 개수
	public int dataCount(Map<String, Object> map);
	
	// 상품 리스트
	public List<Product> listProd(Map<String, Object> map);
	
	// 상품 보기
	public Product readProd(long itemNum);
	
	// 상품 추가 이미지
	public List<Product> listProdImage(long itemNum);
	
	// 옵션명
	public List<Product> listProdOption(long itemNum);
	
	// 옵션 내용
	public List<Product> listOptionDetail(long option1Num);
	
	// 상품 찜 추가
	public void insertLike(Map<String, Object> map) throws Exception;
	
	// 상품 찜 삭제
	public void deleteLike(Map<String, Object> map) throws Exception;
	
	// 상품 찜 여부
	public boolean userLiked(Map<String, Object> map);
	
	// 연관상품 리스트
	public List<Product> listRelated(long itemNum);
	
	// 리뷰 개수
	public int rvDataCount(Map<String, Object> map);
}
