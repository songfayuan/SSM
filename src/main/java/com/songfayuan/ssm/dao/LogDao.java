/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.dao
 * 创建时间：2017年6月17日上午11:24:11
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.songfayuan.ssm.entity.Log;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月17日上午11:24:11
 */
public interface LogDao {

	//保存日志记录
	void save(Log log);

	//查询从offset+1开始，取pagesize条数据
	List<Log> getList(@Param("model") Log logModel, @Param("offset") Integer offset, @Param("pagesize") Integer pagesize);

	//查询数据有多少条
	Integer findRows(@Param("model") Log logModel);

	//根据ID查询一条数据
	Log getOne(@Param("id") Integer id);

}
