package com.cricket.controller.master;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cricket.service.StorageService;

@Controller
@RequestMapping("/mvc/resource")
public class ResourceController extends AbstractBaseController{


	@Autowired
	StorageService storageService;

	@ResponseBody
	@RequestMapping(value = "/image/{name}", method = RequestMethod.GET,produces = {MediaType.IMAGE_JPEG_VALUE, MediaType.IMAGE_GIF_VALUE, MediaType.IMAGE_PNG_VALUE})
	@Cacheable	("images")
	public byte[] image(@PathVariable String name, Model model) throws IOException {
		return storageService.getImage(name);
	}
}
