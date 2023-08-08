package com.zss98.manger.module.service;

import com.zss98.manger.module.validate.setting.SettingWebsiteValidate;
import com.zss98.manger.module.vo.setting.SettingWebsiteVo;

/**
 * 网站信息服务接口类
 */
public interface ISettingWebsiteService {

    /**
     * 获取网站信息
     *
     * @author fzr
     * @return SettingWebsiteVo
     */
    SettingWebsiteVo detail();

    /**
     * 保存网站信息
     *
     * @author fzr
     * @param websiteValidate 参数
     */
    void save(SettingWebsiteValidate websiteValidate);

}
