package com.JOVO.util;

import java.util.Random;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

public class SMS {
	
	// 产品名称:云通信短信API产品,开发者无需替换
		static final String product = "Dysmsapi";
		// 产品域名,开发者无需替换
		static final String domain = "dysmsapi.aliyuncs.com";

		static final String accessKeyId = "LTAIFg6VoWFOSPxK";
		static final String accessKeySecret = "dlAoxt5eai1AKzWMM084BdgwzdJFNG";
		
//		public static void main(String[] args){
//			Random random=new Random();
//			StringBuffer code=new StringBuffer();
//			for(int i=0;i<6;i++){
//				code.append(random.nextInt(10));
//			}
//			
//			sendPhonenumber("13536842214",code.toString());
//		}
		
		
		public static void sendPhonenumber(String phoneNumber, String code) {
			try {
				System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
				System.setProperty("sun.net.client.defaultReadTimeout", "10000");
				// 初始化ascClient,暂时不支持多region
				IClientProfile profile = DefaultProfile.getProfile("cn-shantou", accessKeyId, accessKeySecret);
				DefaultProfile.addEndpoint("cn-shantou", "cn-shantou", product, domain);
				IAcsClient acsClient = new DefaultAcsClient(profile);
				// 组装请求对象
				SendSmsRequest request = new SendSmsRequest();
				// 使用post提交
				request.setMethod(MethodType.POST);
				request.setPhoneNumbers(phoneNumber);
				request.setSignName("JOVO通讯");
				request.setTemplateCode("SMS_82120060");
				request.setTemplateParam("{\"number\":\""+code+"\"}");
				
				System.out.println(code);
				SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
				if (sendSmsResponse.getCode().equals("OK")) {
					System.out.println("OK");
				}
			} catch (Exception e) {
				System.out.println(e);
			}

		}

}
