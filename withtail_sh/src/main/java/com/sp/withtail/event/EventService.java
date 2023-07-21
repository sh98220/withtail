package com.sp.withtail.event;

import java.util.List;
import java.util.Map;


public interface EventService {
	public void insertEventApply(Event dto) throws Exception;
	public List<Event> listEvent(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public List<Event> listWinner(long num);
	public int winnerCount(long num);
	public int countApply(Event dto);
	public void updateHitCount(long num) throws Exception;
	public Event readEvent(long num);
	public Event preReadEvent(Map<String, Object> map);
	public Event nextReadEvent(Map<String, Object> map);
}
