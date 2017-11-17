package com.songfayuan.ssm.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 * URL编码工具类
 * 
 * @author 廖金舟
 */
public class URLCode
{
	/**
	 * URL地址参数解码
	 * 
	 * @param str
	 * @return
	 */
	public final String urlDecoder(String str)
	{
		try
		{
			return URLDecoder.decode(str, "UTF-8");
		}
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
			return str;
		}
	}

	/**
	 * URL地址参数转码
	 * 
	 * @param str
	 * @return
	 */
	public final String urlEncoder(String str)
	{
		try
		{
			return URLEncoder.encode(str, "UTF-8");
		}
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
			return str;
		}
	}

	/**
	 * 将汉字编码从指定编码转换到UTF-8编码
	 * 
	 * @param str
	 * @param oldCharset
	 * @return
	 */
	public final String convertCode(String str,String oldCharset)
	{
		try
		{
			return new String(str.getBytes(oldCharset), "UTF-8");
		}
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();

			return str;
		}
	}
	
	/**
	 * 将汉字从ISO-8859-1编码转到UTF8编码
	 * @param str
	 * @return
	 */
	public final String convertCode(String str)
	{
		return convertCode(str,"ISO-8859-1");
	}
}
