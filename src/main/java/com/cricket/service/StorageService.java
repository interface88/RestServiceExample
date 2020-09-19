package com.cricket.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface StorageService {

	void init();
	void upload(MultipartFile file);
	String uploadImage(String base64String) throws IOException;
	byte[] getImage(String name) throws IOException;

}
