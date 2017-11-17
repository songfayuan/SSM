package com.songfayuan.ssm.util;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * 解析或者封装JSON
 * 
 * @author liujx
 */
public class JsonUtil
{

	/**
	 * 对象转成JsonString
	 * 
	 * @param obj
	 * @return
	 */
	public static final String objectToJson(Object obj)
	{
		try
		{
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor());
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new TimestampJsonValueProcessor());
			return String.valueOf(JSONObject.fromObject(obj,jsonConfig));
		}
		catch (JSONException e)
		{
			throw e;
		}
	}
	
	/**
	 * 对象转成JsonString
	 * @param obj
	 * @param dateformat
	 * @param excludes
	 * @return
	 */
	public static String objectToJson(Object obj,String[] excludes)
	{
		try
		{
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor()); // 格式化日期
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new TimestampJsonValueProcessor());
			jsonConfig.setExcludes(excludes);	// 需要排除输出的字段列表
			return String.valueOf(JSONObject.fromObject(obj,jsonConfig));
		}
		catch (JSONException e)
		{
			throw e;
		}
	}

	/**
	 * 集合转成JsonString
	 * 
	 * @param obj
	 * @return
	 */
	public static final String collectionToJsonArray(List<?> obj)
	{
		try
		{
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor());
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new TimestampJsonValueProcessor());
			return String.valueOf(JSONArray.fromObject(obj,jsonConfig));
		}
		catch (JSONException e)
		{
			throw e;
		}
	}
	
	/**
	 * 数组转成JsonString
	 * @param obj
	 * @param dateformat
	 * @param excludes
	 * @return
	 */
	public static String collectionToJsonArray(List<?> obj,String[] excludes)
	{
		try
		{
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor()); // 格式化日期
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new TimestampJsonValueProcessor());
			jsonConfig.setExcludes(excludes);	// 需要排除输出的字段列表
			return String.valueOf(JSONArray.fromObject(obj,jsonConfig));
		}
		catch (JSONException e)
		{
			throw e;
		}
	}

	/**
	 * 集合转成JsonString
	 * 
	 * @param obj
	 * @return
	 */
	public static final String collectionToJsonArray(Object[] obj)
	{
		try
		{
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor());
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new TimestampJsonValueProcessor());
			return String.valueOf(JSONArray.fromObject(obj,jsonConfig));
		}
		catch (JSONException e)
		{
			throw e;
		}
	}
	
	/**
	 * 数组转成JsonString
	 * @param obj
	 * @param dateformat
	 * @param excludes
	 * @return
	 */
	public static String collectionToJsonArray(Object[] obj,String[] excludes)
	{
		try
		{
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor()); // 格式化日期
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new TimestampJsonValueProcessor());
			jsonConfig.setExcludes(excludes);	// 需要排除输出的字段列表
			return String.valueOf(JSONArray.fromObject(obj,jsonConfig));
		}
		catch (JSONException e)
		{
			throw e;
		}
	}
	
	/**
	 * String 转换成字符json对象
	 * @param jsonString
	 * @return
	 */
	public static JSONObject parseToJson(String jsonString)
	{
		return net.sf.json.JSONObject.fromObject(jsonString);
	}
}
