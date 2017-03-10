package com.framework.core.po;

/**
 * @author sunhan
 * @since 2017年02月15日
 */
public class KeyValue {
    private String id;
    private Object text;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Object getText() {
        return text;
    }

    public void setText(Object text) {
        this.text = text;
    }

    public KeyValue() {
    }

    public KeyValue(String id, Object text) {
        this.id = id;
        this.text = text;
    }
}
