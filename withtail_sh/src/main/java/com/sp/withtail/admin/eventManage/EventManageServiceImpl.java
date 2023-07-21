package com.sp.withtail.admin.eventManage;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.withtail.common.FileManager;
import com.sp.withtail.common.dao.CommonDAO;

@Service("eventManage.eventService")
public class EventManageServiceImpl implements EventManageService{

	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertEvent(EventManage dto, String pathname) throws Exception {
		try {
			dto.setStartDate(dto.getStartDay() + " " + dto.getStartTime() + ":00");
			dto.setEndDate(dto.getEndDay() + " " + dto.getEndTime() + ":00");
			
			if(dto.getMaxCount() !=0 && dto.getWinningDay().length() != 0 && dto.getWinningTime().length() != 0) {
				dto.setWinningDate(dto.getWinningDay() + " " + dto.getWinningTime() + ":00");
			}
			
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			
			if (saveFilename != null) {
				dto.setImageFilename(saveFilename);
			}	
				
			dao.insertData("eventManage.insertEvent", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void updateEvent(EventManage dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);

			if (saveFilename != null) {
				// 이전 파일 지우기
				if (dto.getImageFilename().length() != 0) {
					fileManager.doFileDelete(dto.getImageFilename(), pathname);
				}

				dto.setImageFilename(saveFilename);
			}
			
			dto.setStartDate(dto.getStartDay() + " " + dto.getStartTime() + ":00");
			dto.setEndDate(dto.getEndDay() + " " + dto.getEndTime() + ":00");
			if(dto.getMaxCount() !=0 && dto.getWinningDay().length() != 0 && dto.getWinningTime().length() != 0) {
				dto.setWinningDate(dto.getWinningDay() + " " + dto.getWinningTime() + ":00");
			}
			
			dao.updateData("eventManage.updateEvent", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void deleteEvent(long num, String pathname) throws Exception {
		try {
			if (pathname != null) {
				fileManager.doFileDelete(pathname);
			}
			dao.deleteData("eventManage.deleteEvent", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("eventManage.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<EventManage> listEvent(Map<String, Object> map) {
		List<EventManage> list = null;

		try {
			list = dao.selectList("eventManage.listEvent", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			dao.updateData("eventManage.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public EventManage readEvent(long num) {
		EventManage dto = null;

		try {
			dto = dao.selectOne("eventManage.readEvent", num);
			if(dto != null) {
				dto.setStartDay(dto.getStartDate().substring(0, 10));
				dto.setStartTime(dto.getStartDate().substring(11));

				dto.setEndDay(dto.getEndDate().substring(0, 10));
				dto.setEndTime(dto.getEndDate().substring(11));

				if(dto.getWinningDate() != null && dto.getWinningDate().length() != 0) {
					dto.setWinningDay(dto.getWinningDate().substring(0, 10));
					dto.setWinningTime(dto.getWinningDate().substring(11));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public EventManage preReadEvent(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EventManage nextReadEvent(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertEventWinner(EventManage dto) throws Exception {
		try {

			if(dto.getWinEvent() == 1) {
				// 순위 없는 당첨자 발표
				dao.updateData("eventManage.insertEventWinner1", dto);
			} else {
				// 순위별 당첨자 발표
				List<EventManage> list = listEventApply(dto.getNum());
				Collections.shuffle(list);

				int idx = 0;
				jump:
					for(int i = 0; i < dto.getRankCount().size(); i++) {
						for(int j = 0; j < dto.getRankCount().get(i); j++ ) {
							if(idx >= list.size()) {
								break jump;
							}

							dto.setUserId(list.get(idx).getUserId());
							dto.setRank(dto.getRankNum().get(i));

							dao.insertData("eventManage.insertEventWinner2", dto);

							idx++;
						}
					}
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public List<EventManage> listEventWinner(long num) {
		List<EventManage> list = null;

		try {
			// 이벤트 당첨자 리스트
			list = dao.selectList("eventManage.listEventWinner", num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public EventManage readEventWinner(Map<String, Object> map) {
		EventManage dto = null;
		// 이벤트 당첨 여부
		try {
			dto = dao.selectOne("eventManage.readEventWinner", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<EventManage> listEventApply(long num) {
		List<EventManage> list = null;
		
		try {
			// 이벤트 응모자 목록
			list = dao.selectList("eventManage.listEventApply", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}



}
