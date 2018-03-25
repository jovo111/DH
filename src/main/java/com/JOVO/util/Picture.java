package com.JOVO.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class Picture {
	public static String upload(MultipartFile photo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		if(photo.isEmpty()){
			return "/image/teacher/picture.jpg";
		}
		String path = request.getSession().getServletContext().getRealPath("/resource/image/teacher");

		int beginIndex = photo.getOriginalFilename().lastIndexOf(".");
		String file = photo.getOriginalFilename().substring(beginIndex, photo.getOriginalFilename().length());

		String fileName = UUID.randomUUID().toString() + file;

		File dir = new File(path, fileName);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		photo.transferTo(dir);
		return "/image/teacher/" + fileName;
	}

	public static void delete(String filedir) {
		File file = new File(filedir);
		if (!file.exists()) {
			System.out.println("删除文件失败:" + filedir + "不存在！");
		} else {
			file.delete();
			System.out.println("删除文件成功！");
		}
	}
}
