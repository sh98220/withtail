package com.sp.withtail.admin.eventManage;

import java.util.List;
import java.util.Map;


public interface EventManageService {
	// 이벤트 등록 / 수정 / 삭제
	public void insertEvent(EventManage dto, String pathname) throws Exception;
	public void updateEvent(EventManage dto, String pathname) throws Exception;
	public void deleteEvent(long num, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<EventManage> listEvent(Map<String, Object> map);
	public List<EventManage> listEventApply(long num);
	
	public void updateHitCount(long num) throws Exception;
	public EventManage readEvent(long num);
	public EventManage preReadEvent(Map<String, Object> map);
	public EventManage nextReadEvent(Map<String, Object> map);
	
	// 이벤트 당첨자 등록 / 리스트
	public void insertEventWinner(EventManage dto) throws Exception;
	public List<EventManage> listEventWinner(long num);
	public EventManage readEventWinner(Map<String, Object> map);	
}
