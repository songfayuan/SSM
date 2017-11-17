/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.entity
 * 创建时间：2017年6月21日上午11:58:37
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.entity;

import java.io.Serializable;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月21日上午11:58:37
 */
public class Resource implements Serializable {
	
	private static final long serialVersionUID = -7416329811122144998L;

	private Integer resourceid;

	private Integer parentresourceid;

	private String title;

	public Integer getResourceid() {
		return resourceid;
	}

	public void setResourceid(Integer resourceid) {
		this.resourceid = resourceid;
	}

	public Integer getParentresourceid() {
		return parentresourceid;
	}

	public void setParentresourceid(Integer parentresourceid) {
		this.parentresourceid = parentresourceid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
}
