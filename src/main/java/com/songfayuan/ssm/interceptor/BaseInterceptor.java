package com.songfayuan.ssm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.songfayuan.ssm.entity.User;

import ch.qos.logback.classic.Logger;




public class BaseInterceptor extends HandlerInterceptorAdapter
{
	Logger logger = (Logger) LoggerFactory.getLogger(BaseInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
	{
		String uri = request.getRequestURI();
		if(uri.toLowerCase().indexOf("/user/login") > -1 || uri.toLowerCase().indexOf("/user/logout") > -1 || uri.toLowerCase().indexOf("/user/register") > -1)
		{
			return super.preHandle(request, response, handler);
		}
		
		boolean bFlag = true;
		Object object = request.getSession().getAttribute("user");
		if(object != null)
		{
			try 
			{
				User user = (User)object;
				logger.info("============================分割线==============================");
				logger.info("用户{} 正在访问  {}", user.getUsername(), uri);
			} 
			catch (Exception e) {
				bFlag = false;
			}
		}
		else {
			bFlag = false;
		}
		
		if(bFlag)
		{
			return super.preHandle(request, response, handler);
		}
		else 
		{
			response.setContentType("text/html;charset=UTF-8");  
			String html = "";
			html += "<script>";
			html += "alert('登录会话已超时，请重新登录。');";
			html += "window.location.href='" + request.getContextPath() + "/user/login';";
			html += "</script>";
			response.getWriter().write(html);
			response.getWriter().flush();
			response.getWriter().close();
			return false;
		}
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception
	{
		super.afterCompletion(request, response, handler, ex);
	}
}