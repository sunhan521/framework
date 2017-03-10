package com.framework.admin.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.freemarker.FreeMarkerAutoConfiguration;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Han.Sun
 * @since 2017年02月17日
 */
@Configuration
public class FreemarkerConfiguration extends FreeMarkerAutoConfiguration.FreeMarkerWebConfiguration {

    @Value("${sharedVariables.staticPath}")
    private String staticPath;

    @Value("${sharedVariables.ossPath}")
    private String ossPath;

    @Override
    public FreeMarkerConfigurer freeMarkerConfigurer() {
        FreeMarkerConfigurer configurer = super.freeMarkerConfigurer();

        Map<String, Object> sharedVariables = new HashMap<>();
        sharedVariables.put("staticPath", staticPath);
        sharedVariables.put("ossPath", ossPath);
        configurer.setFreemarkerVariables(sharedVariables);

        return configurer;
    }

}
