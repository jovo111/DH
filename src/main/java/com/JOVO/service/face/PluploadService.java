package com.JOVO.service.face;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.JOVO.dao.face.qtTaskMapper;
import com.JOVO.model.Plupload;
import com.JOVO.model.Task;

@Service
public class PluploadService {
	
	@Autowired
	qtTaskMapper taskMapper;
	
	public void upload(Plupload plupload, File pluploadDir,int courseid) {
		
		
		int index=plupload.getName().lastIndexOf(".");
		String taskname=plupload.getName().substring(0, index);
		String format=plupload.getName().substring(index, plupload.getName().length());
		String fileName = "" + System.currentTimeMillis() + format;
		
		
		Task task= new Task(courseid,fileName,taskname);
		upload(plupload, pluploadDir, fileName,format,task);
	}

	public void upload(Plupload plupload, File pluploadDir, String fileName,String format,Task task) {
		int chunks = plupload.getChunks();
		int nowChunk = plupload.getChunk();

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) plupload.getRequest();
		MultiValueMap<String, MultipartFile> map = multipartHttpServletRequest.getMultiFileMap();

		if (map != null) {
			try {
				Iterator<String> iterator = map.keySet().iterator();
				while (iterator.hasNext()) {

					String key = iterator.next();
					List<MultipartFile> multipartFileList = map.get(key);

					for (MultipartFile multipartFile : multipartFileList) {// 循环只进行一次

						plupload.setMultipartFile(multipartFile);// 手动向Plupload对象传入MultipartFile属性值
						File targetFile = new File(pluploadDir + "/" + fileName);// 新建目标文件，只有被流写入时才会真正存在
						if (chunks > 1) {// 用户上传资料总块数大于1，要进行合并

							File tempFile = new File(pluploadDir.getPath() + "/" + multipartFile.getName());
							// 第一块直接从头写入，不用从末端写入
							savePluploadFile(multipartFile.getInputStream(), tempFile, nowChunk == 0 ? false : true);

							if (chunks - nowChunk == 1) {// 全部块已经上传完毕，此时targetFile因为有被流写入而存在，要改文件名字
								tempFile.renameTo(targetFile);

								// 每当文件上传完毕，将上传信息插入数据库
								taskMapper.insert(task);
							}
						} else {
							// 只有一块，就直接拷贝文件内容
							multipartFile.transferTo(targetFile);

							taskMapper.insert(task);
						}
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	private void savePluploadFile(InputStream inputStream, File tempFile, boolean flag) {
		OutputStream outputStream = null;
		try {
			if (flag == false) {
				// 从头写入
				outputStream = new BufferedOutputStream(new FileOutputStream(tempFile));
			} else {
				// 从末端写入
				outputStream = new BufferedOutputStream(new FileOutputStream(tempFile, true));
			}
			byte[] bytes = new byte[1024];
			int len = 0;
			while ((len = (inputStream.read(bytes))) > 0) {
				outputStream.write(bytes, 0, len);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				outputStream.close();
				inputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
