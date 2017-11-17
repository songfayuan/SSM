/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.entity
 * 创建时间：2017年6月17日上午11:29:20
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.entity;

import java.io.Serializable;
import java.math.BigInteger;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月17日上午11:29:20
 */
public class Log implements Serializable {
	
	private static final long serialVersionUID = -5793234857616647180L;

	private Integer id;

	private String content;

	private Integer logtype;

	private BigInteger time;

	private Integer userid;
	
	private String username;
	
	private String timedate;
	
	private Long starttime1;
	
	private Long endtime1;
	
	public Long getStarttime1() {
		return starttime1;
	}

	public void setStarttime1(Long starttime1) {
		this.starttime1 = starttime1;
	}

	public Long getEndtime1() {
		return endtime1;
	}

	public void setEndtime1(Long endtime1) {
		this.endtime1 = endtime1;
	}


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTimedate() {
		return timedate;
	}

	public void setTimedate(String timedate) {
		this.timedate = timedate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getLogtype() {
		return logtype;
	}

	public void setLogtype(Integer logtype) {
		this.logtype = logtype;
	}

	public BigInteger getTime() {
		return time;
	}

	public void setTime(BigInteger time) {
		this.time = time;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	
	
}
