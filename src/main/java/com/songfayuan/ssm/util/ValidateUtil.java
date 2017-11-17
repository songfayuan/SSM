package com.songfayuan.ssm.util;

import java.util.List;


/**
 * 验证工具类
 * @author liyf
 *
 */
public class ValidateUtil {

	/**
	 * 验证集合是否为空
	 * @param list
	 * @return
	 */
	public static boolean isListNotnull(List list){
		
		if(list != null && list.size() > 0){
			return true;
		}
		
		return false;
	}
	
	/**
	 * 验证对象是否为空
	 * @param o
	 * @return
	 */
	public static boolean isObjectNotnull(Object o){
		
		if(o != null && !"".equals(o) ){
			return true;
		}
		
		return false;
	}
	
}
