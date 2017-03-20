package com.framework.core.modules.sys.service;

import com.framework.core.modules.sys.entity.ErrorMessage;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 * 系统错误信息 服务类
 * </p>
 *
 * @author Sun.Han
 * @since 2017-03-21
 */
public interface ErrorMessageService extends IService<ErrorMessage> {

    void asyncInsert(ErrorMessage errorMessages);
}
