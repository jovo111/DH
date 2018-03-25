package com.JOVO.util;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.SimpleHash;

public class Md5 {
	
	public static void main(String [] args){
		
		String num="t123123";
		String pwd="123456";
		
		int hashIterations = 1024;
        Object obj = new SimpleHash("MD5", pwd, num, hashIterations);
        System.out.println(obj);
//		String md5 = new Md5Hash(pwd, num).toString();
//		System.out.println("md5="+md5);
	}

}
