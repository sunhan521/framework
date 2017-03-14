package com.framework.core.handler;

import com.baomidou.mybatisplus.mapper.IMetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;

/**
 * @author Han.Sun
 * @since 2017年03月13日
 */
public class MyMetaObjectHandler  implements IMetaObjectHandler {
    @Override
    public void insertFill(MetaObject metaObject) {
        Object name = metaObject.getValue("name");
        if (null == name) {
            metaObject.setValue("name", "instert-fill");
        }
    }
}
