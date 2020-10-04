package com.cricket.controller.master;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

public abstract class AbstractBaseController {

	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
	    DATE_FORMAT.setLenient(true);
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(DATE_FORMAT, true));
	    
	    SimpleDateFormat DATE_TIME_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    DATE_TIME_FORMAT.setLenient(true);
	    binder.registerCustomEditor(Timestamp.class, new CustomDateEditor(DATE_TIME_FORMAT, true));
	    
	}
	
}
