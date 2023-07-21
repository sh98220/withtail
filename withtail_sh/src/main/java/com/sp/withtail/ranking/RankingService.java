package com.sp.withtail.ranking;

import java.util.List;
import java.util.Map;

public interface RankingService {
	public List<Ranking> listRank(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
}
