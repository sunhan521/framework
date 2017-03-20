package com.framework.core.handler;

import com.baomidou.mybatisplus.mapper.IMetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;

/**
 * 自定义填充公共
 * 当前版本的IMetaObjectHandler 有bug，等下一个版本出来了再更新
 * @author Han.Sun
 * @since 2017年03月18日
 */
public class MyMetaObjectHandler implements IMetaObjectHandler {


    public void insertFill(MetaObject metaObject) {
        Object name = metaObject.getValue("name");
        if (null == name) {
            metaObject.setValue("name", "instert-fill");
        }
    }

}