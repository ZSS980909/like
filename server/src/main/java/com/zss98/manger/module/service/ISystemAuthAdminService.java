package com.zss98.manger.module.service;

import com.zss98.manger.module.validate.commons.PageValidate;
import com.zss98.manger.module.validate.system.SystemAdminCreateValidate;
import com.zss98.manger.module.validate.system.SystemAdminSearchValidate;
import com.zss98.manger.module.validate.system.SystemAdminUpInfoValidate;
import com.zss98.manger.module.validate.system.SystemAdminUpdateValidate;
import com.zss98.manger.module.vo.system.SystemAuthAdminDetailVo;
import com.zss98.manger.module.vo.system.SystemAuthAdminListedVo;
import com.zss98.manger.module.vo.system.SystemAuthAdminSelvesVo;
import com.zss98.manger.common.core.PageResult;

/**
 * 系统管理员服务接口类
 */
public interface ISystemAuthAdminService {

    /**
     * 管理员列表
     *
     * @author fzr
     * @param pageValidate 分页参数
     * @param searchValidate 搜索参数
     * @return PageResult<SystemAuthAdminListedVo>
     */
    PageResult<SystemAuthAdminListedVo> list(PageValidate pageValidate, SystemAdminSearchValidate searchValidate);

    /**
     * 当前管理员
     *
     * @author fzr
     * @return SystemSelfVo
     */
    SystemAuthAdminSelvesVo self(Integer adminId);

    /**
     * 管理员详情
     *
     * @author fzr
     * @param id 主键参数
     * @return SystemAuthAdminDetailVo
     */
    SystemAuthAdminDetailVo detail(Integer id);

    /**
     * 管理员新增
     *
     * @author fzr
     * @param createValidate 参数
     */
    void add(SystemAdminCreateValidate createValidate);

    /**
     * 管理员编辑
     *
     * @author fzr
     * @param updateValidate 参数
     * @param adminId 管理员ID
     */
    void edit(SystemAdminUpdateValidate updateValidate, Integer adminId);

    /**
     * 当前管理员更新
     *
     * @author fzr
     * @param upInfoValidate 参数
     * @param adminId 管理员ID
     */
    void upInfo(SystemAdminUpInfoValidate upInfoValidate, Integer adminId);

    /**
     * 管理员删除
     *
     * @author fzr
     * @param id 主键参数
     * @param adminId 管理员ID
     */
    void del(Integer id, Integer adminId);

    /**
     * 管理员状态切换
     *
     * @author fzr
     * @param id 主键参数
     */
    void disable(Integer id, Integer adminId);

}
