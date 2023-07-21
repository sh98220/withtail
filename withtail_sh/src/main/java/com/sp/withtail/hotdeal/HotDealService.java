package com.sp.withtail.hotdeal;

import java.util.List;
import java.util.Map;

public interface HotDealService {
	public List<HotDeal> listRank(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
}
