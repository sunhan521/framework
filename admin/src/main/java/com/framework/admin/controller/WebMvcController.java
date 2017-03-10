package com.framework.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
/**
 * 页面跳转Controller
 *
 * @author sunhan
 * @since 2017年02月14日
 */
@Controller
public class WebMvcController extends WebMvcConfigurerAdapter {

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("admin/index.html");
        registry.addViewController("/login").setViewName("login");
    }
    @RequestMapping(value = "/admin/**/*.html", method = RequestMethod.GET)
    public ModelAndView view(HttpServletRequest request,
                             @RequestParam(required = false) Map<String, Object> param) {
        String path = getUri(request);
        if (path.contains("."))
            path = path.split("[.]")[0];
        ModelAndView modelAndView = new ModelAndView(path);
        modelAndView.addObject("param", param);

        return modelAndView;
    }
    public String getUri(HttpServletRequest request) {
        String path = request.getRequestURI();
        String content = request.getContextPath();
        if (path.startsWith(content)) {
            path = path.substring(content.length() + 1);
        }
        return path;
    }

}
