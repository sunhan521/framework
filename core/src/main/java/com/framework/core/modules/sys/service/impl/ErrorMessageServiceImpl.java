package com.framework.core.modules.sys.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.framework.core.modules.sys.entity.ErrorMessage;
import com.framework.core.modules.sys.mapper.ErrorMessageMapper;
import com.framework.core.modules.sys.service.ErrorMessageService;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 系统错误信息 服务实现类
 * </p>
 *
 * @author Sun.Han
 * @since 2017-03-21
 */
@Service
public class ErrorMessageServiceImpl extends ServiceImpl<ErrorMessageMapper, ErrorMessage> implements ErrorMessageService {

    @Async
    public void asyncInsert(ErrorMessage message) {
        try {
            super.insert(message);
        } catch (Exception e) {

        }
    }

}
