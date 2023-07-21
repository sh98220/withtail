package com.sp.withtail.admin.reviewManage;

import java.util.List;
import java.util.Map;

public interface ReviewManageService {
	//총개수
	public int dataCountbefore(Map<String, Object> map);
	public int dataCountcomplete(Map<String, Object> map);
	//리스트(상품명,상품썸네일 가져와야함)
	public List<ReviewManage> listReviewbefore(Map<String, Object> map);
	public List<ReviewManage> listReviewcomplete(Map<String, Object> map);
	
	//글보기(상품명,상품썸네일,별점 가져와야함)
	public ReviewManage readReview(long rvNum);
	
	//리뷰사진리스트
	public List<ReviewManage> photolist(long rvNum);
	
	//답변등록
	public void answerReview(ReviewManage dto)throws Exception;
	//답변삭제
	public void deleteAnswer(long rvNum)throws Exception;
	//리뷰삭제
	public void deleteReview(long rvNum)throws Exception;
}
