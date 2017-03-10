package com.framework.core.po;

/**
 * @author Han.Sun
 * @since 2017年03月05日
 */
public class JsTreeState {

    private Boolean selected;
    private Boolean opened;
    private Boolean disabled;
    private Boolean checked;
    private Boolean undetermined;

    public Boolean getSelected() {
        return selected;
    }

    public void setSelected(Boolean selected) {
        this.selected = selected;
    }

    public Boolean getOpened() {
        return opened;
    }

    public void setOpened(Boolean opened) {
        this.opened = opened;
    }

    public Boolean getDisabled() {
        return disabled;
    }

    public void setDisabled(Boolean disabled) {
        this.disabled = disabled;
    }

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }

    public Boolean getUndetermined() {
        return undetermined;
    }

    public void setUndetermined(Boolean undetermined) {
        this.undetermined = undetermined;
    }
}
