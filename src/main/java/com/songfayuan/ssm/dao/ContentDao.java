/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.dao
 * 创建时间：2017年6月25日下午5:05:01
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.songfayuan.ssm.entity.Content;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月25日下午5:05:01
 */
public interface ContentDao {

	//分页查询content list
	List<Content> getList(@Param("model") Content contentModel, @Param("offset") Integer offset, @Param("pagesize") Integer pagesize);

	//查询数据有多少条
	Integer findRows(@Param("model") Content contentModel);

}
