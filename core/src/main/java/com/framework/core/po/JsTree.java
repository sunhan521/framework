package com.framework.core.po;

import com.framework.core.enums.JsTreeStateEnum;
import org.apache.commons.lang.StringUtils;

/**
 * @author Han.Sun
 * @since 2017年03月02日
 */
public class JsTree {
    private String id;
    private String parent;
    private String text;
    private String icon;

    /**
     * 节点的状态
     * {@link JsTreeStateEnum}
     */
    private JsTreeState state;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getParent() {
        return parent;
    }

    public void setParent(String parent) {
        this.parent = parent;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getIcon() {
        if (StringUtils.isEmpty(icon))
            return "fa fa-file-o";
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public JsTreeState getState() {
        return state;
    }

    public void setState(JsTreeState state) {
        this.state = state;
    }
}
