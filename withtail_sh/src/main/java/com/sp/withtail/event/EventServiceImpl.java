package com.sp.withtail.event;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.withtail.common.dao.CommonDAO;

@Service("event.eventService")
public class EventServiceImpl implements EventService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertEventApply(Event dto) throws Exception {
		try {
			dao.insertData("event.insertEventApply", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("event.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	@Override
	public List<Event> listEvent(Map<String, Object> map) {
		List<Event> list = null;
		
		try {
			list = dao.selectList("event.listEvent", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public Event preReadEvent(Map<String, Object> map) {
		Event dto = null;
		
		try {
			dto = dao.selectOne("event.preReadEvent", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			dao.updateData("event.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Event nextReadEvent(Map<String, Object> map) {
		Event dto = null;
		
		try {
			dto = dao.selectOne("event.nextReadEvent", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Event readEvent(long num) {
		Event dto = null;
		
		try {
			dto = dao.selectOne("event.readEvent", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int winnerCount(long num) {
		
		int result = 0;
		try {
			result = dao.selectOne("event.winnerCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Event> listWinner(long num) {
		
		List<Event> list = null;
		
		try {
			list = dao.selectList("event.listWinner", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int countApply(Event dto) {
		int result = 0;
		
		try {
			result = dao.selectOne("event.countApply", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result; 
	}

}
