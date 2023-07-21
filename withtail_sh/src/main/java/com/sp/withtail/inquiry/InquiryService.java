package com.sp.withtail.inquiry;

import java.util.List;
import java.util.Map;

public interface InquiryService {
	public void insertInquiry(Inquiry dto) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Inquiry> listInquiry(Map<String, Object> map);
	
	public Inquiry readInquiry(long num);
	public void deleteInquiry(long num) throws Exception;
}
