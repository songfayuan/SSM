package com.songfayuan.ssm.controller;

import java.lang.annotation.*;

/**
 * 描述：自定义注解 拦截Controller
 * @author songfayuan
 * 2017年6月17日上午11:11:49
 */
@Target({ ElementType.PARAMETER, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SystemControllerLog {

	String description() default "controller default...";

}