/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.service
 * 创建时间：2017年6月17日上午11:22:33
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.service;

import com.songfayuan.ssm.entity.Log;
import com.songfayuan.ssm.util.PageInfomation;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月17日上午11:22:33
 */
public interface LogService {

	//保存日志记录
	public void save(Log log);

	//分页查询
	public PageInfomation<Log> getList(Log logModel, Integer pageno, Integer pagesize);

	//根据ID查询一条数据
	public Log getOne(Integer id);

}
