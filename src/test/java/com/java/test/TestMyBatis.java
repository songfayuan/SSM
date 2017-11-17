/**
 * 项目名称：ssm
 * 项目包名：com.java.test
 * 创建时间：2017年6月14日上午11:15:28
 * 创建者：Administrator-宋发元
 * 创建地点：北京清科科技股份有限公司
 */
package com.java.test;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;

import com.alibaba.fastjson.JSON;
import com.songfayuan.ssm.entity.Role;
import com.songfayuan.ssm.entity.User;
import com.songfayuan.ssm.service.RoleService;
import com.songfayuan.ssm.service.UserService;

import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月14日上午11:15:28
 */
@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})  
public class TestMyBatis {
    private static Logger logger = Logger.getLogger(TestMyBatis.class);  
//  private ApplicationContext ac = null;  
    @Resource  
    private UserService userService = null;  
    
    @Resource
	private RoleService roleService;
  
//  @Before  
//  public void before() {  
//      ac = new ClassPathXmlApplicationContext("applicationContext.xml");  
//      userService = (UserService) ac.getBean("userService");  
//  }  
  
    @Test  
    public void test1() {  
        User user = userService.findDetailById(1);  
        System.out.println(user.getUsername());  
        JSON json = (JSON) JSON .toJSON(user);
        System.out.println(json);
        
        logger.info("值："+user.getUsername());  
        logger.info(JSON.toJSONString(user));  
		logger.info(JSON.toJSONString(user));
    }  
}
