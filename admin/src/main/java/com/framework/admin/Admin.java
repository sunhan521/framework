package com.framework.admin;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.HttpMessageConverters;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.scheduling.annotation.EnableAsync;

import java.util.Collections;


@MapperScan("com.framework.core.modules.sys.mapper*")
@SpringBootApplication
@ComponentScan("com.framework")
@EnableCaching
@EnableAsync
public class Admin {
	public static void main(String[] args) {
		SpringApplication.run(Admin.class, args);
	}


	/**
	 * 全局json格式化输出。默认null不输出，因为transient自动JSON自动过滤，
	 * 因此mybatis-plus非数据库字段根据情况，尽量不要用transient修饰
	 * @return
	 */
	@Bean
	public HttpMessageConverters fastJsonHttpMessageConverters() {
		FastJsonHttpMessageConverter fastConverter = new FastJsonHttpMessageConverter();
		FastJsonConfig fastJsonConfig = new FastJsonConfig();
		fastJsonConfig.setSerializerFeatures(SerializerFeature.PrettyFormat);
		fastConverter.setFastJsonConfig(fastJsonConfig);
		fastConverter.setSupportedMediaTypes(Collections.singletonList(MediaType.APPLICATION_JSON_UTF8));
		return new HttpMessageConverters((HttpMessageConverter<?>) fastConverter);
	}


}
