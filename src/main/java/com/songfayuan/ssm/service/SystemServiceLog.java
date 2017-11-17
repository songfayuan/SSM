package com.songfayuan.ssm.service;

import java.lang.annotation.*;

/**
 * 描述：自定义注解 拦截service
 * @author songfayuan
 * 2017年6月17日上午11:13:51
 */
@Target({ ElementType.PARAMETER, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SystemServiceLog {

	String description() default "默认。。";

}