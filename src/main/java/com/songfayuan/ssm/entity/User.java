package com.songfayuan.ssm.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;

public class User implements Serializable {
	
	private static final long serialVersionUID = 4940988408258587417L;

	private Integer id;

	private Integer age;

	private BigInteger birthday;

	private BigDecimal bodyheight;

	private BigDecimal bodyweight;

	private String img;

	private String name;

	private String phone;

	private String password;

	private String wechat;

	private BigInteger registtime;

	private Integer sex;

	private String token;

	private String username;

	private Integer usertype;
	
	private BigDecimal balance;
	private BigDecimal totalmoney;
	private BigDecimal todaymoney;
	
	private String hideusername;
	
	private String createDate;   //创建时间
	
	private String birthdayTime;  //出生日期
	
	private String userrole;   //用户角色

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public BigInteger getBirthday() {
		return birthday;
	}

	public void setBirthday(BigInteger birthday) {
		this.birthday = birthday;
	}

	public BigDecimal getBodyheight() {
		return bodyheight;
	}

	public void setBodyheight(BigDecimal bodyheight) {
		this.bodyheight = bodyheight;
	}

	public BigDecimal getBodyweight() {
		return bodyweight;
	}

	public void setBodyweight(BigDecimal bodyweight) {
		this.bodyweight = bodyweight;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getWechat() {
		return wechat;
	}

	public void setWechat(String wechat) {
		this.wechat = wechat;
	}

	public BigInteger getRegisttime() {
		return registtime;
	}

	public void setRegisttime(BigInteger registtime) {
		this.registtime = registtime;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getUsertype() {
		return usertype;
	}

	public void setUsertype(Integer usertype) {
		this.usertype = usertype;
	}

	public BigDecimal getBalance() {
		return balance;
	}

	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}

	public BigDecimal getTotalmoney() {
		return totalmoney;
	}

	public void setTotalmoney(BigDecimal totalmoney) {
		this.totalmoney = totalmoney;
	}

	public BigDecimal getTodaymoney() {
		return todaymoney;
	}

	public void setTodaymoney(BigDecimal todaymoney) {
		this.todaymoney = todaymoney;
	}

	public String getHideusername() {
		return hideusername;
	}

	public void setHideusername(String hideusername) {
		this.hideusername = hideusername;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getBirthdayTime() {
		return birthdayTime;
	}

	public void setBirthdayTime(String birthdayTime) {
		this.birthdayTime = birthdayTime;
	}

	public String getUserrole() {
		return userrole;
	}

	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}

}