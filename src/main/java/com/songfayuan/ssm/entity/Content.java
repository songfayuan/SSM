/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.entity
 * 创建时间：2017年6月25日下午5:11:23
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月25日下午5:11:23
 */
public class Content implements Serializable{

	private static final long serialVersionUID = 1342361417189855427L;

	private int id;

	private String article_contents;

	private String article_title;

	private int article_userid;

	private String bottomimg;

	private String bottomimgurl;

	private int checkstatus;

	private BigInteger cpc;

	private BigDecimal cpcprice;

	private BigInteger cpm;

	private BigDecimal cpmprice;

	private BigInteger createtime;

	private BigInteger edittime;

	private BigInteger endtime;

	private String headimg;

	private String headimgurl;

	private int proceedstatus;

	private BigInteger starttime;

	private String title;

	private BigDecimal totalprice;

	private int userid;
	
	private Integer sex;
	
	private Integer age;
	
	private String province;
	
	private String city;
	
	private String consumption_idea;
	
	private String consumer_preference;
	
	private String startdate;
	
	private String enddate;
	
	private String username;//发布者姓名
	
	private String createdate;
	
	private Long starttime1;
	
	private Long endtime1;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

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

	public String getArticle_contents() {
		return article_contents;
	}

	public void setArticle_contents(String article_contents) {
		this.article_contents = article_contents;
	}

	public String getArticle_title() {
		return article_title;
	}

	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}

	public int getArticle_userid() {
		return article_userid;
	}

	public void setArticle_userid(int article_userid) {
		this.article_userid = article_userid;
	}

	public String getBottomimg() {
		return bottomimg;
	}

	public void setBottomimg(String bottomimg) {
		this.bottomimg = bottomimg;
	}

	public String getBottomimgurl() {
		return bottomimgurl;
	}

	public void setBottomimgurl(String bottomimgurl) {
		this.bottomimgurl = bottomimgurl;
	}

	public int getCheckstatus() {
		return checkstatus;
	}

	public void setCheckstatus(int checkstatus) {
		this.checkstatus = checkstatus;
	}

	public BigInteger getCpc() {
		return cpc;
	}

	public void setCpc(BigInteger cpc) {
		this.cpc = cpc;
	}

	public BigDecimal getCpcprice() {
		return cpcprice;
	}

	public void setCpcprice(BigDecimal cpcprice) {
		this.cpcprice = cpcprice;
	}

	public BigInteger getCpm() {
		return cpm;
	}

	public void setCpm(BigInteger cpm) {
		this.cpm = cpm;
	}

	public BigDecimal getCpmprice() {
		return cpmprice;
	}

	public void setCpmprice(BigDecimal cpmprice) {
		this.cpmprice = cpmprice;
	}

	public BigInteger getCreatetime() {
		return createtime;
	}

	public void setCreatetime(BigInteger createtime) {
		this.createtime = createtime;
	}

	public BigInteger getEdittime() {
		return edittime;
	}

	public void setEdittime(BigInteger edittime) {
		this.edittime = edittime;
	}

	public BigInteger getEndtime() {
		return endtime;
	}

	public void setEndtime(BigInteger endtime) {
		this.endtime = endtime;
	}

	public String getHeadimg() {
		return headimg;
	}

	public void setHeadimg(String headimg) {
		this.headimg = headimg;
	}

	public String getHeadimgurl() {
		return headimgurl;
	}

	public void setHeadimgurl(String headimgurl) {
		this.headimgurl = headimgurl;
	}

	public int getProceedstatus() {
		return proceedstatus;
	}

	public void setProceedstatus(int proceedstatus) {
		this.proceedstatus = proceedstatus;
	}

	public BigInteger getStarttime() {
		return starttime;
	}

	public void setStarttime(BigInteger starttime) {
		this.starttime = starttime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public BigDecimal getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(BigDecimal totalprice) {
		this.totalprice = totalprice;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getConsumption_idea() {
		return consumption_idea;
	}

	public void setConsumption_idea(String consumption_idea) {
		this.consumption_idea = consumption_idea;
	}

	public String getConsumer_preference() {
		return consumer_preference;
	}

	public void setConsumer_preference(String consumer_preference) {
		this.consumer_preference = consumer_preference;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	
	
}
