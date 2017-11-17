package com.songfayuan.ssm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class CheckUserRight
{
	private HttpServletRequest request;

	public CheckUserRight(HttpServletRequest request)
	{
		this.request = request;
	}

	public boolean check(Integer resourceid)
	{
		HttpSession session = this.request.getSession();
		Object obj = session.getAttribute("resourceid");
		if(obj == null)
		{
			return false;
		}
		
		String resourceIdS = obj.toString();
		if (resourceIdS.indexOf("," + resourceid.toString() + ",") > -1)
		{
			return true;
		}

		return false;
	}
}
