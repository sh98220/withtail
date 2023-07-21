package com.sp.withtail.newest;

import java.util.List;
import java.util.Map;

public interface NewestService {
	public List<Newest> listNewest(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
}
