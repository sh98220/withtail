package com.sp.withtail.admin.inquiryManage;

import java.util.List;
import java.util.Map;

public interface InquiryManageService {
	public int dataCount(Map<String, Object> map);
	public List<InquiryManage> listInquiry(Map<String, Object> map);
	
	public InquiryManage readInquiry(long num);
	
	public void answerInquiry(InquiryManage dto) throws Exception;
	public void deleteAnswer(long num) throws Exception;
	public void deleteInquiry(long num) throws Exception;
}
