package com.zss98.manger.module.service;

import com.zss98.manger.module.validate.system.SystemAdminLoginsValidate;
import com.zss98.manger.module.vo.system.SystemCaptchaVo;
import com.zss98.manger.module.vo.system.SystemLoginVo;

/**
 * 系统登录服务接口类
 */
public interface ISystemLoginService {

    /**
     * 验证码
     *
     * @author fzr
     * @return SystemCaptchaVo
     */
    SystemCaptchaVo captcha();

    /**
     * 登录
     *
     * @author fzr
     * @param loginsValidate 登录参数
     * @return SystemLoginVo
     */
    SystemLoginVo login(SystemAdminLoginsValidate loginsValidate);

    /**
     * 退出
     *
     * @author fzr
     * @param token 令牌
     */
    void logout(String token);

}
