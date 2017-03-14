package com.framework.core;

import com.baomidou.mybatisplus.activerecord.Model;

import java.io.Serializable;
import java.lang.reflect.Field;

/**
 * @author Han.Sun
 */
public class GenericPo<T extends GenericPo> extends Model<T> implements Serializable, Cloneable{
    private Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public int hashCode() {
        if (getId() == null) return 0;
        return getId().hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) return false;
        return this.hashCode() == obj.hashCode();
    }

    @Override
    public Object clone() throws CloneNotSupportedException {
        Field[] fields = this.getClass().getDeclaredFields();
        for (int i = 0; i < fields.length; i++) {

        }
        return super.clone();
    }

}
