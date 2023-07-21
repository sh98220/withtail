package com.sp.withtail.search;

import java.util.List;
import java.util.Map;

public interface SearchService {
	public List<Search> listSearch(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
}
