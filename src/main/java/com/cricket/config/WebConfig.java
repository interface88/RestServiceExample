package com.cricket.config;

import java.io.IOException;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"com.cricket.controller"})
public class WebConfig extends WebMvcConfigurerAdapter {

	
	/**
     * Configure TilesConfigurer.
     */
    @Bean
    public TilesConfigurer tilesConfigurer(){
        TilesConfigurer tilesConfigurer = new TilesConfigurer();
        tilesConfigurer.setDefinitions(new String[] {"/WEB-INF/views/**/tiles.xml"});
        tilesConfigurer.setCheckRefresh(true);
        return tilesConfigurer;
    }
    
  /**
   * Configure ViewResolvers to deliver preferred views.
   */
  @Override
  public void configureViewResolvers(ViewResolverRegistry registry) {

    /*InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
    viewResolver.setPrefix("/WEB-INF/views/");
    viewResolver.setSuffix(".jsp");
    registry.viewResolver(viewResolver);
    */
    TilesViewResolver viewResolver = new TilesViewResolver();
    registry.viewResolver(viewResolver);
  }

  
  /**
   * Configure ResourceHandlers to serve static resources like CSS/ Javascript etc...
   */
  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
    registry.addResourceHandler("/static/**").addResourceLocations("/static/");
  }

  /**
   * Configure MessageSource to lookup any validation/error message in internationalized property
   * files
   */
  @Bean
  public MessageSource messageSource() {
    ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
    messageSource.setBasename("messages");
    return messageSource;
  }

  /**
   * Optional. It's only required when handling '.' in @PathVariables which otherwise ignore
   * everything after last '.' in @PathVaidables argument. It's a known bug in Spring
   * [https://jira.spring.io/browse/SPR-6164], still present in Spring 4.1.7. This is a workaround
   * for this issue.
   */
  @Override
  public void configurePathMatch(PathMatchConfigurer matcher) {
    matcher.setUseRegisteredSuffixPatternMatch(true);
  }
	/*
	 * @Override public void addViewControllers(ViewControllerRegistry registry) {
	 * registry.addViewController("/").setViewName("index"); }
	 */

  @Bean(name = "multipartResolver")
  public CommonsMultipartResolver getResolver() throws IOException {
    CommonsMultipartResolver resolver = new CommonsMultipartResolver();

    // Set the maximum allowed size (in bytes) for each individual file.
    resolver.setMaxUploadSizePerFile(5242880);// 5MB

    // You may also set other available properties.

    return resolver;
  }
}
