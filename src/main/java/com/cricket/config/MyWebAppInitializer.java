package com.cricket.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.cricket.config.AppConfig;

public class MyWebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

  /*
   * @Override public void onStartup(ServletContext container) {
   * AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();
   * context.setConfigLocation("com.cricket.config");
   * 
   * container.addListener(new ContextLoaderListener(context));
   * 
   * ServletRegistration.Dynamic dispatcher = container .addServlet("dispatcher", new
   * DispatcherServlet(context));
   * 
   * dispatcher.setLoadOnStartup(1); dispatcher.addMapping("/mvc/*"); }
   */

  @Override
  protected Class<?>[] getRootConfigClasses() {
    return new Class[] {AppConfig.class, SecurityConfiguration.class,WebConfig.class};
  }

  @Override
  protected Class<?>[] getServletConfigClasses() {
    return new Class[] {};
  }

  @Override
  protected String[] getServletMappings() {
    return new String[] { /* "/mvc/*", "/api/*", */"/"};
  }
}
