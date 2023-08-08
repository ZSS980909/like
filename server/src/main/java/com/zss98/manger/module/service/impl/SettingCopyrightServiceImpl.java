package com.zss98.manger.module.service.impl;

import com.alibaba.fastjson2.JSON;
import com.zss98.manger.module.service.ISettingCopyrightService;
import com.zss98.manger.module.validate.setting.SettingCopyrightValidate;
import com.zss98.manger.module.vo.setting.SettingCopyrightVo;
import com.zss98.manger.common.util.ListUtils;
import com.zss98.manger.common.util.ConfigUtils;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * 网站备案服务实现类
 */
@Service
public class SettingCopyrightServiceImpl implements ISettingCopyrightService {

    /**
     * 获取网站备案信息
     *
     * @author fzr
     * @return List<SettingCopyrightVo>
     */
    @Override
    public List<SettingCopyrightVo> detail() {
        String config = ConfigUtils.get("website", "copyright", "[]");
        List<Map<String, String>> copyright = ListUtils.stringToListAsMapStr(config);

        List<SettingCopyrightVo> list = new LinkedList<>();
        for (Map<String, String> map : copyright) {
            SettingCopyrightVo vo = new SettingCopyrightVo();
            vo.setName(map.getOrDefault("name", ""));
            vo.setLink(map.getOrDefault("link", ""));
            list.add(vo);
        }

        return list;
    }

    /**
     * 保存网站备案信息
     *
     * @author fzr
     * @param copyrightValidate 参数
     */
    @Override
    public void save(SettingCopyrightValidate copyrightValidate) {
        String s = JSON.toJSONString(copyrightValidate.getList());
        ConfigUtils.set("website", "copyright", s);
    }

}
