/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.dao
 * 创建时间：2017年6月26日上午10:58:43
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.songfayuan.ssm.entity.Population;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月26日上午10:58:43
 */
public interface PopulationDao {

	//查询从offset+1开始，取pagesize条数据
	List<Population> getList(@Param("model") Population popModel, @Param("offset") Integer offset, @Param("pagesize") Integer pagesize);

	//查询数据有多少条
	Integer findRows(@Param("model") Population popModel);

	//查询所有的二级人群标签列表
	List<Population> getSecondList(@Param("id") Integer id, @Param("offset") Integer offset, @Param("pagesize") Integer pagesize);

	//查询数据有多少条
	Integer findSecondRows(@Param("id") Integer id);

	//根据id删除二级人群标签数据
	void deleteByPid(@Param("id") Integer id, @Param("pid") Integer pid);

	//根据id删除一级分类
	void delete(@Param("id") Integer id);

	//根据id和pid查询一条数据
	Population selectByPid(@Param("id") Integer id, @Param("pid") Integer pid);

	//保存更新
	void update(Population population);

	//保存添加的二级类别
	void saveSecondType(Population population);

}
