package com.sp.withtail.ranking;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.withtail.common.dao.CommonDAO;


@Service("ranking.rankingService")
public class RankingServiceImpl implements RankingService {
	@Autowired
	private CommonDAO dao;


	@Override
	public List<Ranking> listRank(Map<String, Object> map) {
		List<Ranking> list = null;
		
		try {
			list = dao.selectList("ranking.rankList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("ranking.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
