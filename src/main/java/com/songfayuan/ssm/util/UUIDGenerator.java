/**
 * 项目名称：stxzxos-management
 * 项目包名：com.stx.zxos.controller
 * 创建时间：2015年12月2日下午2:53:38
 * 创建者：Administrator-宋发元
 * 创建地点：北京清科科技股份有限公司
 */
package com.songfayuan.ssm.util;

import java.util.UUID;    
/**
 * 描述：随机码产生类
 * @author songfayuan
 * 2015年12月2日下午2:53:38
 */
public class UUIDGenerator {    
     
    
    public static String getUUID() {    
        UUID uuid = UUID.randomUUID();    
        String str = uuid.toString();    
        // 去掉"-"符号  
        String temp = str.substring(0, 8) + str.substring(9, 13) + str.substring(14, 18) + str.substring(19, 23) + str.substring(24);    
        return temp;    
    }    
     
    public static String getWordName()   
    {  
        int num = (int) Math.round(Math.random()*900000+1);  
        return String.valueOf(num);    
    }  
      
    public static void main(String[] args) {  
        String abc =  getUUID();  
        System.out.println("abc="+abc);  
        String cba = getWordName();  
        System.out.println(cba);  
    }  
}  
