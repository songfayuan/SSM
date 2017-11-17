package com.songfayuan.ssm.aspect;

import java.lang.reflect.Method;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.songfayuan.ssm.controller.SystemControllerLog;
import com.songfayuan.ssm.entity.Log;
import com.songfayuan.ssm.entity.User;
import com.songfayuan.ssm.service.LogService;
import com.songfayuan.ssm.service.SystemServiceLog;
import com.songfayuan.ssm.util.ValidateUtil;



/**
 * 描述：切入点
 * @author songfayuan
 * 2017年6月17日上午11:17:22
 */
@Aspect
@Component
public class SystemLogAspect {
	// 注入Service用于把日志保存数据库
	@Autowired
	private LogService logService;
	
	// 本地异常日志记录对象
	private static final Logger logger = LoggerFactory.getLogger(SystemLogAspect.class);

	// Service层切点
	@Pointcut("execution(* com.songfayuan.ssm.service.*.*(..) ) && !execution(* com.songfayuan.ssm.service.LogService.*(..) )")
	public void serviceAspect() {
	}

	// Controller层切点
	@Pointcut("execution(* com.songfayuan.ssm.controller.*.*(..))")
	public void controllerAspect() {
	}

	/**
	 * 前置通知 用于拦截Controller层记录用户的操作
	 * 
	 * @param joinPoint
	 *            切点
	 */
	@Before("controllerAspect()")
	public void doBefore(JoinPoint joinPoint) {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder .getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		// 读取session中的用户
		User user = (User) session.getAttribute("user");
		BigInteger time = new BigInteger(System.currentTimeMillis()+"");
		try {
			if(ValidateUtil.isObjectNotnull(getControllerMethodDescription(joinPoint))){
				// *========控制台输出=========*//
				System.out.println("请求方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
				System.out.println("方法描述:" + getControllerMethodDescription(joinPoint));
				
				// *========数据库日志=========*//
				Log log = new Log();
				if(ValidateUtil.isObjectNotnull(user)){
					System.out.println("请求人:" + user.getName());
					log.setUserid(user.getId());
				}else{
					System.out.println("请求人:null");
				}
				
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				String timestr = df.format(new Date(new Long(time+"")));
				System.out.println("请求时间:" + timestr);
				log.setContent(getControllerMethodDescription(joinPoint));
				log.setTime(time);
				log.setLogtype(1601);
				// 保存数据库
				logger.info(".............Controller操作日志保存开始.............");
				this.logService.save(log);
				logger.info(".............Controller操作日志保存结束.............");
			}
		} catch (Exception e) {
			System.out.println(e);
			// 记录本地异常日志
			logger.error("==前置通知异常==");
			logger.error("异常信息:{}", e.getMessage());
		}
	}

	/**
	 * 异常通知 用于拦截service层记录异常日志
	 * @param joinPoint
	 * @param e
	 */
	@AfterThrowing(pointcut = "serviceAspect()", throwing = "e")
	public void doAfterThrowing(JoinPoint joinPoint, Throwable e) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		// 读取session中的用户
		User user = (User) session.getAttribute("user");
		BigInteger time = new BigInteger(System.currentTimeMillis()+"");
		// 获取用户请求方法的参数并序列化为JSON格式字符串
		String params = "";
		if (joinPoint.getArgs() != null && joinPoint.getArgs().length > 0) {
			for (int i = 0; i < joinPoint.getArgs().length; i++) {
				params += joinPoint.getArgs()[i] + ";";
			}
		}
		try {
			/* ========控制台输出========= */
			System.out.println("异常代码:" + e.getClass().getName());
			System.out.println("异常信息:" + e.getMessage());
			System.out.println("异常方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
			System.out.println("方法描述:" + getServiceMthodDescription(joinPoint));
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String timestr = df.format(new Date(new Long(time+"")));
			System.out.println("请求时间:" + timestr);
			/* ==========数据库日志========= */
			Log log = new Log();
			if(ValidateUtil.isObjectNotnull(user)){
				System.out.println("请求人:" + user.getId());
				log.setUserid(user.getId());
			}else{
				System.out.println("请求人:null" );
			}
			System.out.println("请求参数:" + params);
			log.setContent("异常代码:" + e.getClass().getName()+",异常信息:" + e.getMessage()+",异常方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()")+",方法描述:" + getServiceMthodDescription(joinPoint));
			log.setTime(time);
			log.setLogtype(1602);
			// 保存数据库
			logger.info(".............Service操作日志保存开始.............");
			this.logService.save( log );
			logger.info(".............Service操作日志保存结束.............");
			
		} catch (Exception ex) {
			ex.printStackTrace();
			// 记录本地异常日志
			logger.error("==异常通知异常==");
			logger.error("异常信息:{}", ex.getMessage());
		}
	}

	/**
	 * 获取注解中对方法的描述信息 用于service层注解
	 * 
	 * @param joinPoint
	 *            切点
	 * @return 方法描述
	 * @throws Exception
	 */
	public static String getServiceMthodDescription(JoinPoint joinPoint)
			throws Exception {
		String targetName = joinPoint.getTarget().getClass().getName();
		String methodName = joinPoint.getSignature().getName();
		Object[] arguments = joinPoint.getArgs();
		Class targetClass = Class.forName(targetName);
		Method[] methods = targetClass.getMethods();
		String description = "";
		for (Method method : methods) {
			if (method.getName().equals(methodName)) {
				Class[] clazzs = method.getParameterTypes();
				if (clazzs.length == arguments.length) {
					description = ValidateUtil.isObjectNotnull(method.getAnnotation(SystemServiceLog.class))?method.getAnnotation(SystemServiceLog.class).description():"";
					break;
				}
			}
		}
		return description;
	}

	/**
	 * 获取注解中对方法的描述信息 用于Controller层注解
	 * 
	 * @param joinPoint
	 *            切点
	 * @return 方法描述
	 * @throws Exception
	 */
	public static String getControllerMethodDescription(JoinPoint joinPoint)
			throws Exception {
		String targetName = joinPoint.getTarget().getClass().getName();
		String methodName = joinPoint.getSignature().getName();
		Object[] arguments = joinPoint.getArgs();
		Class targetClass = Class.forName(targetName);
		Method[] methods = targetClass.getMethods();
		String description = "";
		for (Method method : methods) {
			if (method.getName().equals(methodName)) {
				Class[] clazzs = method.getParameterTypes();
				if (clazzs.length == arguments.length) {
//					description = method.getAnnotation( SystemControllerLog.class).description();
					description = ValidateUtil.isObjectNotnull(method.getAnnotation(SystemControllerLog.class))?method.getAnnotation(SystemControllerLog.class).description():"";
					break;
				}
			}
		}
		return description;
	}
}