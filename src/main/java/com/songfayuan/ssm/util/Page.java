package com.songfayuan.ssm.util;

import java.util.List;

public class Page<T> {
	List<T> data;
	Integer total;
	Integer start;
	Integer pageSize = 10;
	Integer resultCount;

	public static final int DEFAULE_PAGESIZE = 10;

	public Page(Integer start, Integer pageSize, Integer resultCount) {
		super();
		this.total = resultCount / pageSize + (resultCount % pageSize > 0 ? 1 : 0);
		this.start = start;
		this.pageSize = pageSize;
		this.resultCount = resultCount;
	}

	public Page() {
		super();
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getResultCount() {
		return resultCount;
	}

	public void setResultCount(Integer resultCount) {
		this.resultCount = resultCount;
	}

}
