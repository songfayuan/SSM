package com.songfayuan.ssm.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.songfayuan.ssm.util.JsonUtil;



public class BaseController
{
//	protected HttpServletResponse getResponse()
//	{
//		return ControllerContext.getContext().getResponse();
//	}
//
//	protected HttpServletRequest getRequest()
//	{
//		return ControllerContext.getContext().getRequest();
//	}
	
	protected String MD5(String strSrc) throws NoSuchAlgorithmException 
	{  
		MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] bt = strSrc.getBytes();  
        md.update(bt);  
        String strDes = bytes2Hex(md.digest());  
        return strDes;  
    }  
    private String bytes2Hex(byte[] bts) 
    {  
        StringBuffer des = new StringBuffer();  
        String tmp = null;  
        for (int i = 0; i < bts.length; i++) {  
            tmp = (Integer.toHexString(bts[i] & 0xFF));  
            if (tmp.length() == 1) {  
                des.append("0");  
            }  
            des.append(tmp);  
        }  
        return des.toString();  
    } 

	/**
	 * 设置跨域访问头信息
	 */
	private void setCrossSite(HttpServletResponse response)
	{
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Content-Type, Authorization, Accept,X-Requested-With");
		response.addHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
	}

	protected String setFailureMessage(HttpServletResponse response, String msg)
	{
		setCrossSite(response);
		return "{\"status\":\"ERROR\",\"data\":\"" + msg + "\"}";
	}
	
//	protected String setFailureMessage(HttpServletResponse response, ErrorInfomation error)
//	{
//		setCrossSite(response);
//		return "{\"status\": \"ERROR\", \"code\": " + error.getCode() + ", \"description\": \"" + error.getDescription() + "\"}";
//	}

	protected String setSuccessMessage(HttpServletResponse response, boolean data)
	{
		setCrossSite(response);
		return "{\"status\":\"OK\",\"data\":\"" + data + "\"}";
	}

	protected String setSuccessMessage(HttpServletResponse response, Object data)
	{
		setCrossSite(response);

		if (data == null)
		{
			return setFailureMessage(response, "entity not fount.");
		}
		try
		{
			return "{\"status\":\"OK\",\"data\":" + JsonUtil.objectToJson(data) + "}";
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return setFailureMessage(response, e.getMessage());
		}
	}

	protected String setSuccessMessage(HttpServletResponse response, Object data, String[] excludes)
	{
		setCrossSite(response);

		if (data == null)
		{
			return setFailureMessage(response, "entity not fount.");
		}
		try
		{
			return "{\"status\":\"OK\",\"data\":" + JsonUtil.objectToJson(data, excludes) + "}";
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return setFailureMessage(response, e.getMessage());
		}
	}

	protected String setSuccessMessage(HttpServletResponse response, List<?> data)
	{
		setCrossSite(response);

		if (data == null)
		{
			return setFailureMessage(response, "entity not fount.");
		}
		try
		{
			return "{\"status\":\"OK\",\"data\":" + JsonUtil.collectionToJsonArray(data) + "}";
		}
		catch (Exception e)
		{
			return setFailureMessage(response, e.getMessage());
		}
	}

	protected String setSuccessMessage(HttpServletResponse response, List<?> data, String[] excludes)
	{
		setCrossSite(response);

		if (data == null)
		{
			return setFailureMessage(response, "entity not fount.");
		}
		try
		{
			return "{\"status\":\"OK\",\"data\":" + JsonUtil.collectionToJsonArray(data, excludes) + "}";
		}
		catch (Exception e)
		{
			return setFailureMessage(response, e.getMessage());
		}
	}

	protected String setSuccessMessage(HttpServletResponse response, Object[] data)
	{
		setCrossSite(response);

		if (data == null)
		{
			return setFailureMessage(response, "entity not fount.");
		}
		try
		{
			return "{\"status\":\"OK\",\"data\":" + JsonUtil.collectionToJsonArray(data) + "}";
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return setFailureMessage(response, e.getMessage());
		}
	}

	protected String setSuccessMessage(HttpServletResponse response, Object[] data, String[] excludes)
	{
		setCrossSite(response);

		if (data == null)
		{
			return setFailureMessage(response, "entity not fount.");
		}
		try
		{
			return "{\"status\":\"OK\",\"data\":" + JsonUtil.collectionToJsonArray(data, excludes) + "}";
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return setFailureMessage(response, e.getMessage());
		}
	}
}
