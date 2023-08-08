package com.zss98.manger.module.service;

import com.zss98.manger.module.validate.setting.SettingLoginValidate;
import com.zss98.manger.module.vo.setting.SettingLoginVo;

/**
 * 登录设置服务接口类
 */
public interface ISettingLoginService {

    /**
     * 登录设置详情
     *
     * @author fzr
     * @return SettingLoginVo
     */
    SettingLoginVo detail();

    /**
     * 登录设置保存
     *
     * @author fzr
     * @param loginValidate 参数
     */
    void save(SettingLoginValidate loginValidate);

}
