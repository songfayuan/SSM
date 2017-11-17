package com.songfayuan.ssm.util;

/**
 * 解析或者封装JSON
 * 
 * @author liujx
 */
public class RandomStringUtil
{

	public static String getRandomString()
	{   
       // 把0-9、a-z、A-Z全存在一个字符串里
		StringBuffer array = new StringBuffer();
		for (int i = 0; i <= 9; i++) {
			array.append(i);
		}
		for (int i = (int) 'a'; i <= (int) 'z'; i++) {
			array.append((char) i);
		}
		for (int i = (int) 'A'; i <= (int) 'Z'; i++) {
			array.append((char) i);
		}
		int length = array.length();

		// 假设n现在为32
		int n = 32;//生成几位的随机字符串
		// 存储最后生成的字符串
		StringBuffer str = new StringBuffer();
		for (int i = 0; i < n; i++) {
			// 获得随机位置的字符
			char c = array.charAt((int) (Math.random() * length));
			str.append(c);
		}

		
        return str.toString();
	}
	
	public static String getRandomString4()
	{   
       // 把0-9、a-z、A-Z全存在一个字符串里
		StringBuffer array = new StringBuffer();
		for (int i = 0; i <= 9; i++) {
			array.append(i);
		}
		for (int i = (int) 'a'; i <= (int) 'z'; i++) {
			array.append((char) i);
		}
		for (int i = (int) 'A'; i <= (int) 'Z'; i++) {
			array.append((char) i);
		}
		int length = array.length();

		// 假设n现在为32
		int n = 6;//生成几位的随机字符串
		// 存储最后生成的字符串
		StringBuffer str = new StringBuffer();
		for (int i = 0; i < n; i++) {
			// 获得随机位置的字符
			char c = array.charAt((int) (Math.random() * length));
			str.append(c);
		}
		
        return str.toString();
	}
	
	public static void main(String[] args) {
		
		String str=getRandomString();
		// 打印结果
		System.out.println(str.toString());
		System.out.println("该字符串的长度: " + str.length());
	}
}
