package com.cricket.config;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import static org.hibernate.cfg.Environment.*;


@Configuration
//@PropertySource({"file:/CRICKET/db.properties", "file:/CRICKET/email.properties"})
@PropertySource({"classpath:db.properties", "classpath:email.properties"})
@EnableTransactionManagement
@ComponentScans(value = { @ComponentScan("com.cricket.dao"),
@ComponentScan("com.cricket.service"),@ComponentScan("com.cricket.model"),@ComponentScan("com.cricket.config")  })
public class AppConfig {

   @Autowired
   private Environment env;

   @Bean
   public LocalSessionFactoryBean  getSessionFactory() {
	   
	   
	   /*
	    
	    // Creating Configuration Instance & Passing Hibernate Configuration File
        Configuration configObj = new Configuration();
        configObj.configure("hibernate.cfg.xml");
 
        // Since Hibernate Version 4.x, Service Registry Is Being Used
        ServiceRegistry serviceRegistryObj = new StandardServiceRegistryBuilder().applySettings(configObj.getProperties()).build(); 
 
        // Creating Hibernate Session Factory Instance
        SessionFactory factoryObj = configObj.buildSessionFactory(serviceRegistryObj);
 
        // Saving Hibernate Session Factory Object In The Request Scope
        servletContextEvent.getServletContext().setAttribute("SessionFactory", factoryObj);
        logger.info("Hibernate Session Factory Configured Successfully!");
	    
	    */
	   
      LocalSessionFactoryBean factoryBean = new LocalSessionFactoryBean();

      
      
      
      Properties props = new Properties();
      // Setting JDBC properties
      props.put(DRIVER, env.getProperty("mysql.driver"));
      props.put(URL, env.getProperty("mysql.url"));
      props.put(USER, env.getProperty("mysql.user"));
      props.put(PASS, env.getProperty("mysql.password"));

      // Setting Hibernate properties
      props.put(SHOW_SQL, env.getProperty("hibernate.show_sql"));
      //props.put(HBM2DDL_AUTO, env.getProperty("hibernate.hbm2ddl.auto"));

      // Setting C3P0 properties
      props.put(C3P0_MIN_SIZE, env.getProperty("hibernate.c3p0.min_size"));
      props.put(C3P0_MAX_SIZE, env.getProperty("hibernate.c3p0.max_size"));
      props.put(C3P0_ACQUIRE_INCREMENT, 
            env.getProperty("hibernate.c3p0.acquire_increment"));
      props.put(C3P0_TIMEOUT, env.getProperty("hibernate.c3p0.timeout"));
      props.put(C3P0_MAX_STATEMENTS, env.getProperty("hibernate.c3p0.max_statements"));

      factoryBean.setHibernateProperties(props);
      factoryBean.setPackagesToScan("com.cricket.model");

      return factoryBean;
      /*
	   StandardServiceRegistry standardRegistry = 
				new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
	   Metadata metaData = new MetadataSources(standardRegistry).getMetadataBuilder().build();
	   SessionFactory 	sessionFactory = metaData.getSessionFactoryBuilder().build();
	   return sessionFactory;
	   */
   }

	/*
	 * @Bean public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
	 * final LocalContainerEntityManagerFactoryBean emf = new
	 * LocalContainerEntityManagerFactoryBean();
	 * emf.setDataSource(restDataSource());
	 * emf.setPackagesToScan("com.cricket.model");
	 * 
	 * final JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
	 * emf.setJpaVendorAdapter(vendorAdapter);
	 * emf.setJpaProperties(hibernateProperties());
	 * 
	 * return emf; }
	 */
   
   @Bean
   public HibernateTransactionManager getTransactionManager() {
      HibernateTransactionManager transactionManager = new HibernateTransactionManager();
      transactionManager.setSessionFactory(getSessionFactory().getObject());
      return transactionManager;
   }
   
   @Bean
   public JavaMailSender getMailSender(){
	   
	   
	   // EMAIL CONFIGURATION
	   
	   String host = env.getProperty("spring.mail.host");
	   String userName = env.getProperty("spring.mail.username");
	   String password = env.getProperty("spring.mail.password");
	   int port = Integer.parseInt(env.getProperty("spring.mail.port"));
	   String protocol = env.getProperty("spring.mail.protocol");
	   String smtp_auth = env.getProperty("spring.mail.properties.mail.smtp.auth");
	   String startTLSEnable = env.getProperty("spring.mail.properties.mail.smtp.starttls.enable");
	   //String from = env.getProperty("spring.mail.from");
	   String debug = env.getProperty("spring.mail.debug");
	   
	   
	   
       JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
       mailSender.setHost(host);
       mailSender.setPort(port);
       if (Boolean.parseBoolean(smtp_auth)) {
    	   mailSender.setUsername(userName);
    	   mailSender.setPassword(password);
       }
        
       Properties javaMailProperties = new Properties();
       javaMailProperties.put("mail.transport.protocol", protocol);
       javaMailProperties.put("mail.smtp.starttls.enable", startTLSEnable);
       javaMailProperties.put("mail.smtp.auth", smtp_auth);
       javaMailProperties.put("mail.debug", debug);//Prints out everything on screen
        
       mailSender.setJavaMailProperties(javaMailProperties);
       return mailSender;
   }
}
