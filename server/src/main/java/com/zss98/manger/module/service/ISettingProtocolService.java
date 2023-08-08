package com.zss98.manger.module.service;

import com.zss98.manger.module.validate.setting.SettingProtocolValidate;
import com.zss98.manger.module.vo.setting.SettingProtocolDetailVo;

/**
 * 政策协议服务接口类
 */
public interface ISettingProtocolService {

    /**
     * 获取政策协议信息
     *
     * @author fzr
     * @return SettingProtocolDetailVo
     */
    SettingProtocolDetailVo detail();

    /**
     * 保存政策协议信息
     *
     * @author fzr
     * @param protocolValidate 参数
     */
    void save(SettingProtocolValidate protocolValidate);

}
