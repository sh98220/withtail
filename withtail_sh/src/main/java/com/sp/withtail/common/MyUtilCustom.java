package com.sp.withtail.common;

import org.springframework.stereotype.Service;

@Service("myUtilCustom")
public class MyUtilCustom extends MyUtil {

	@Override
	public String paging(int current_page, int total_page, String list_url) {
		StringBuilder sb = new StringBuilder();
		
		int numPerBlock = 5;
		int currentPageSetup;
		int n, page;
		
		if(current_page < 1 || total_page < current_page) {
			return "";
		}
		
		if(list_url.indexOf("?") != -1) {
			list_url += "&";
		} else {
			list_url += "?";
		}
		
		// currentPageSetup : 표시할첫페이지-1
		currentPageSetup = (current_page / numPerBlock) * numPerBlock;
		if(current_page % numPerBlock == 0) {
			currentPageSetup = currentPageSetup - numPerBlock;
		}

		sb.append("<ul class='d-flex gap-1 justify-content-center'>");
		
		// 처음페이지
		if (current_page > 1) {
			sb.append("<li><a href='" + list_url + "page=1'>&lt;&lt;</a></li>");
		} else {
			sb.append("<li><span class='disabled'>&lt;&lt;</span></li>");
		}
		
		// 이전 페이지
		n = current_page - numPerBlock;
		if (total_page > numPerBlock && currentPageSetup > 0) {
			sb.append("<li><a href='" + list_url + "page=" + n + "'>&lt;</a></li>");
		} else {
			sb.append("<li><span class='disabled'>&lt;</span></li>");
		}
		
		// 페이징
		page = currentPageSetup + 1;
		while (page <= total_page && page <= (currentPageSetup + numPerBlock)) {
			if(page == current_page) {
				sb.append("<li class='active'><span>" + page + "</span></li>");
			} else {
				sb.append("<li><a href='" + list_url + "page=" + page + "'>" + page + "</a></li>");
			}

			page++;
		}
		
		// 다음(5페이지 후)
		n = current_page + numPerBlock;
		if (n > total_page) n = total_page;
		if (total_page - currentPageSetup > numPerBlock) {
			sb.append("<li><a href='" + list_url + "page=" + n + ");>&gt;</a></li>");
		} else {
			sb.append("<li><span class='disabled'>&gt;</span></li>");
		}
		
		sb.append("</ul>");
	
		return sb.toString();
	}

	// javascript 페이지 처리(javascript 지정 함수 호출, methodName:호출할 스크립트 함수명)
	@Override
	public String pagingMethod(int current_page, int total_page, String methodName) {
		StringBuilder sb = new StringBuilder();

		int numPerBlock = 5; // 리스트에 나타낼 페이지 수
		int currentPageSetUp;
		int n, page;

		if (current_page < 1 || total_page < current_page) {
			return "";
		}

		// currentPageSetup : 표시할첫페이지-1
		currentPageSetUp = (current_page / numPerBlock) * numPerBlock;
		if (current_page % numPerBlock == 0) {
			currentPageSetUp = currentPageSetUp - numPerBlock;
		}

		sb.append("<ul class='d-flex gap-1 justify-content-center'>");

		// 처음페이지
		if (current_page > 1) {
			sb.append("<li><a onclick='" + methodName + "(1);'>&lt;&lt;</a></li>");
		} else {
			sb.append("<li><span class='disabled'>&lt;&lt;</span></li>");
		}
		// 이전(5페이지 전)
		n = current_page - numPerBlock;
		if (total_page > numPerBlock && currentPageSetUp > 0) {
			sb.append("<li><a onclick='" + methodName + "(" + n + ");'>&lt;</a></li>");
		} else {
			sb.append("<li><span class='disabled'>&lt;</span></li>");
		}

		// 바로가기 페이지 구현
		page = currentPageSetUp + 1;
		while (page <= total_page && page <= (currentPageSetUp + numPerBlock)) {
			if (page == current_page) {
				sb.append("<li class='active'><span>" + page + "</span></li>");
			} else {
				sb.append("<li><a onclick='" + methodName + "(" + page + ");'>" + page + "</a></li>");
			}
			page++;
		}

		// 다음(10페이지 후)
		n = current_page + numPerBlock;
		if (n > total_page)
			n = total_page;
		if (total_page - currentPageSetUp > numPerBlock) {
			sb.append("<li><a onclick='" + methodName + "(" + n + ");>&gt;</a></li>");
		} else {
			sb.append("<li><span class='disabled'>&gt;</span></li>");
		}
		// 마지막 페이지
		if (current_page < total_page) {
			sb.append("<li><a onclick='" + methodName + "(" + total_page + ");'>&gt;&gt;</a></li>");
		} else {
			sb.append("<li><span class='disabled'>&gt;&gt;</span></li>");
		}

		sb.append("</ul>");

		return sb.toString();
	}
	
	// javascript 페이지 처리(javascript 지정 함수 호출, methodName:호출할 스크립트 함수명)
	@Override
	public String pagingMethod2(int current_page, int total_page, String methodName) {
		StringBuilder sb = new StringBuilder();

		int numPerBlock = 5; // 리스트에 나타낼 페이지 수
		int currentPageSetUp;
		int n, page;

		if (current_page < 1 || total_page < current_page) {
			return "";
		}

		// currentPageSetup : 표시할첫페이지-1
		currentPageSetUp = (current_page / numPerBlock) * numPerBlock;
		if (current_page % numPerBlock == 0) {
			currentPageSetUp = currentPageSetUp - numPerBlock;
		}

		sb.append("<ul class='d-flex gap-1 justify-content-center'>");

		// 처음페이지
		if (current_page > 1) {
			sb.append("<li><a onclick='" + methodName + "(1);'>&lt;&lt;</a></li>");
		} else {
			sb.append("<li><span class='disabled'>&lt;&lt;</span></li>");
		}
		// 이전(10페이지 전)
		n = current_page - numPerBlock;
		if (total_page > numPerBlock && currentPageSetUp > 0) {
			sb.append("<li><a onclick='" + methodName + "(" + n + ",0);'>&lt;</a></li>");
		} else {
			sb.append("<li><span class='disabled'>&lt;</span></li>");
		}

		// 바로가기 페이지 구현
		page = currentPageSetUp + 1;
		while (page <= total_page && page <= (currentPageSetUp + numPerBlock)) {
			if (page == current_page) {
				sb.append("<li class='active'><span>" + page + "</span></li>");
			} else {
				sb.append("<li><a onclick='" + methodName + "(" + page + ",0);'>" + page + "</a></li>");
			}
			page++;
		}

		// 다음(10페이지 후)
		n = current_page + numPerBlock;
		if (n > total_page)
			n = total_page;
		if (total_page - currentPageSetUp > numPerBlock) {
			sb.append("<li><a onclick='" + methodName + "(" + n + ",0);>&gt;</a></li>");
		} else {
			sb.append("<li><span class='disabled'>&gt;</span></li>");
		}
		// 마지막 페이지
		if (current_page < total_page) {
			sb.append("<li><a onclick='" + methodName + "(" + total_page + ",0);'>&gt;&gt;</a></li>");
		} else {
			sb.append("<li><span class='disabled'>&gt;&gt;</span></li>");
		}

		sb.append("</ul>");

		return sb.toString();
	}

	@Override
	public String pagingUrl(int current_page, int total_page, String list_url) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String pagingFunc(int current_page, int total_page, String methodName) {
		// TODO Auto-generated method stub
		return null;
	}

}
