package com.songfayuan.ssm.util;

import java.util.List;

public class PageInfomation<T>
{
	private List<T> content;
	private int pageno;
	private int totalpages;
	private int pagesize;
	private long totalitems;

	public List<T> getContent()
	{
		return content;
	}

	public void setContent(List<T> content)
	{
		this.content = content;
	}

	public int getPageno()
	{
		return pageno;
	}

	public void setPageno(int pageno)
	{
		this.pageno = pageno;
	}

	public int getTotalpages()
	{
		return totalpages;
	}

	public void setTotalpages(int totalpages)
	{
		this.totalpages = totalpages;
	}

	public int getPagesize()
	{
		return pagesize;
	}

	public void setPagesize(int pagesize)
	{
		this.pagesize = pagesize;
	}

	public long getTotalitems()
	{
		return totalitems;
	}

	public void setTotalitems(long totalitems)
	{
		this.totalitems = totalitems;
	}
}
