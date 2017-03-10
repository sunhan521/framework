package com.framework.core.enums;

import com.framework.core.po.JsTreeState;

/**
 * @author Han.Sun
 * @since 2017年03月05日
 */
public enum JsTreeStateEnum {
    SELECTED("selected", "选中状态"),
    OPENED("opened", "打开状态"),
    DISABLED("disabled", "禁用状态"),
    CHECKED("checked", "checkbox时候生效，选中状态"),
    UNDETERMINED("undetermined", "懒加载的时候生效，待定状态");

    private final String state;

    private final String des;

    private JsTreeState jsTreeState;


    JsTreeStateEnum(String state, String des) {
        JsTreeState treeState = new JsTreeState();
        this.state = state;
        this.des = des;
        switch (state) {
            case "selected":
                treeState.setSelected(true);
                break;
            case "opened":
                treeState.setOpened(true);
                break;
            case "disabled":
                treeState.setDisabled(true);
                break;
            case "checked":
                treeState.setChecked(true);
                break;
            case "undetermined":
                treeState.setUndetermined(true);
                break;
        }
        this.jsTreeState = treeState;
    }

    public String getState() {
        return state;
    }

    public String getDes() {
        return des;
    }


    public JsTreeState getJsTreeState() {
        return jsTreeState;
    }

    public void setJsTreeState(JsTreeState jsTreeState) {
        this.jsTreeState = jsTreeState;
    }
}
