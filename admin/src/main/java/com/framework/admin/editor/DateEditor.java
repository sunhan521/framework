package com.framework.admin.editor;


import com.framework.core.utils.DateHelper;

import java.beans.PropertyEditorSupport;

/**
 * @author Han.Sun
 */
public class DateEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String text) {
        setValue(DateHelper.parseDate(text));
    }

}
