package me.anqi.jexam.config;

import me.anqi.jexam.interceptor.UserSecurityInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {
	private UserSecurityInterceptor securityInterceptor;

	@Autowired
	public WebMvcConfig(UserSecurityInterceptor securityInterceptor) {
		this.securityInterceptor = securityInterceptor;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(securityInterceptor).addPathPatterns("/user/**");
	}
}
//
//	@Bean
//	public FreeMarkerViewResolver freeMarkerViewResolver() {
//		System.out.println("MvcConfig.freeMarkerViewResolver()");
//		FreeMarkerViewResolver resolver = new FreeMarkerViewResolver();
//		resolver.setPrefix("");
//		resolver.setSuffix(".ftl");
//		resolver.setContentType("text/html; charset=UTF-8");
//		resolver.setRequestContextAttribute("request");
//		return resolver;
//	}
//}
