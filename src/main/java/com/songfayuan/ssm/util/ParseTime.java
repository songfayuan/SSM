package com.songfayuan.ssm.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ParseTime {
	public static Date parse2Date(String s)
	{
		try
		{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = sdf.parse(s);
			return date;
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
}
