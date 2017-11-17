package com.songfayuan.ssm.util;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.net.ssl.HttpsURLConnection;

/**
 * HTTP客户端
 * 
 * @author 廖金舟
 * 
 */
public class HttpClient
{
private Map<String, String> httpHeaders = null;
	
	/**
	 * 设置HTTP Header信息
	 * @param httpHeaders
	 */
	public void setHttpHeaders(Map<String, String> httpHeaders)
	{
		this.httpHeaders = httpHeaders;
	}

	/**
	 * 使用HTTP协议从网络读取字符串,GET方式
	 * 
	 * @param URL
	 * @return
	 */
	public String getString(String URL)
	{
		byte[] byteData = getData(URL);

		if (byteData != null && byteData.length > 0)
		{
			return new String(byteData);
		}

		return "";
	}
	
	/**
	 * 使用HTTP协议从网络读取字符串,POST方式
	 * @param URL
	 * @param formParameters
	 * @return
	 */
	public String getString(String URL,Map<String, Object> formParameters)
	{
		byte[] byteData = getData(URL,formParameters);

		if (byteData != null && byteData.length > 0)
		{
			return new String(byteData);
		}

		return "";
	}

	/**
	 * 通过GET方式获取网络数据
	 * @param urlString
	 * @param requestHeaders
	 * @return
	 */
	public byte[] getData(String urlString)
	{
		try
		{
			URL url = new URL(urlString);
			HttpURLConnection conn;
			if(urlString.startsWith("https://"))
			{
				conn = (HttpsURLConnection) url.openConnection();
			}
			else
			{
				conn = (HttpURLConnection) url.openConnection();
			}

			conn.setRequestMethod("GET");
			conn.setDoInput(true);
			conn.setDoOutput(true);

			// 添加HTTPHeader信息
			if (httpHeaders != null)
			{
				Set<String> headers = httpHeaders.keySet();
				for (Iterator<String> it = headers.iterator(); it.hasNext();)
				{
					String headerName = it.next();
					String headerValue = httpHeaders.get(headerName);
					conn.setRequestProperty(headerName, headerValue);
				}
			}

			InputStream stream = conn.getInputStream();// 获得服务器的响应流
			byte[] data = readUrlStream(stream);
			conn.disconnect();// 断开

			return data;
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 通过POST方式获取网络数据
	 * 
	 * @param urlString
	 * @param requestHeaders
	 * @param formParameters
	 * @return
	 */
	public byte[] getData(String urlString, Map<String, Object> formParameters)
	{
		try
		{
			URL url = new URL(urlString);
			HttpURLConnection conn;
			if(urlString.startsWith("https://"))
			{
				conn = (HttpsURLConnection) url.openConnection();
			}
			else
			{
				conn = (HttpURLConnection) url.openConnection();
			}

			conn.setRequestMethod("POST");
			conn.setDoInput(true);
			conn.setDoOutput(true);

			// 添加HTTPHeader信息
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			if (httpHeaders != null)
			{
				Set<String> headers = httpHeaders.keySet();
				for (Iterator<String> it = headers.iterator(); it.hasNext();)
				{
					String headerName = it.next();
					String headerValue = httpHeaders.get(headerName);
					conn.setRequestProperty(headerName, headerValue);
				}
			}

			DataOutputStream out = null;
			try
			{
				out = new DataOutputStream(conn.getOutputStream()); // 获取输入流

				if (formParameters != null && formParameters.size() > 0)
				{
					Set<String> keies = formParameters.keySet();
					Iterator<String> it = keies.iterator();
					StringBuffer buf = new StringBuffer();

					for (int paramCount = 0; it.hasNext();)
					{
						String parameterName = it.next();
						Object parameterValue = formParameters.get(parameterName);

						if (parameterValue == null)
						{
							continue;
						}
						
						if(parameterValue instanceof String[])
						{
							String[] strTemp = (String[]) parameterValue;
							for(String s : strTemp)
							{
								parameterValue = new URLCode().urlEncoder(s);
								if (paramCount > 0)
								{
									buf.append("&");
								}
								buf.append(parameterName);
								buf.append("=");
								buf.append(parameterValue);
								++paramCount;
							}
						}
						else
						{
							parameterValue = new URLCode().urlEncoder(String.valueOf(parameterValue));
							if (paramCount > 0)
							{
								buf.append("&");
							}
							buf.append(parameterName);
							buf.append("=");
							buf.append(parameterValue);
							++paramCount;
						}
					}

					out.write(buf.toString().getBytes());
				}
			}
			finally
			{
				if (out != null)
				{
					out.flush();
					out.close();
				}
			}

			InputStream stream = conn.getInputStream();// 获得服务器的响应流
			byte[] data = readUrlStream(stream);
			conn.disconnect();// 断开

			return data;
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 将网络流读成二进制数组
	 * 
	 * @param networkStream
	 * @return
	 * @throws IOException
	 */
	private byte[] readUrlStream(InputStream networkStream) throws IOException
	{
		byte[] bytes = new byte[100];
		byte[] bytecount = null;
		int n = 0;
		int ilength = 0;
		try
		{
			while ((n = networkStream.read(bytes)) >= 0)
			{
				if (bytecount != null)
				{
					ilength = bytecount.length;
				}
				byte[] tempbyte = new byte[ilength + n];
				if (bytecount != null)
				{
					System.arraycopy(bytecount, 0, tempbyte, 0, ilength);
				}

				System.arraycopy(bytes, 0, tempbyte, ilength, n);
				bytecount = tempbyte;

				if (n == -1)
					break;
			}
		}
		finally
		{
			networkStream.close();
		}
		return bytecount;
	}
}