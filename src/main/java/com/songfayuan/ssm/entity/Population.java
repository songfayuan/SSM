/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.entity
 * 创建时间：2017年6月26日上午11:10:33
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.entity;

import java.io.Serializable;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月26日上午11:10:33
 */
public class Population implements Serializable {
	
	private static final long serialVersionUID = -8373528905512936125L;

	private int id;

	private String label;

	private int pid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}
	
}
