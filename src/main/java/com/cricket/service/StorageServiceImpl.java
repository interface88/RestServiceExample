package com.cricket.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import javax.xml.bind.DatatypeConverter;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cricket.common.AppUtil;

@Service
public class StorageServiceImpl implements StorageService {


	@Value("${file.upload.image.path}")
	private String imagePath;

	@Override
	public void init() {
		// TODO Auto-generated method stub
	}

	@Override
	public void upload(MultipartFile file) {
		// TODO Auto-generated method stub
	}

	@Override
	public String uploadImage(String base64String) throws IOException {
		String[] strings = base64String.split(",");
	      String extension;
		        switch (strings[0]) {//check image's extension
		            case "data:image/jpeg;base64":
		                extension = "jpeg";
		                break;
		            case "data:image/png;base64":
		                extension = "png";
		                break;
		            default://should write cases for more images types
		                extension = "jpg";
		                break;
		        }
	      //convert base64 string to binary data
	      byte[] data = DatatypeConverter.parseBase64Binary(strings[1]);

	      String newFile;
	      do{
	    	  newFile= AppUtil.generateUniqueString(10) + "." + extension;
	      }
	      while(new File(imagePath +  newFile).exists());
		  FileUtils.writeByteArrayToFile(new File(imagePath +  newFile), data);
		  return newFile;
	}

	@Override
	public byte[] getImage(String name) throws IOException {
		File serverFile = new File(imagePath + name);
		return  Files.readAllBytes(serverFile.toPath());
	}

}
