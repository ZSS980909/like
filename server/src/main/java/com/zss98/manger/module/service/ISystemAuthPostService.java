package com.zss98.manger.module.service;

import com.zss98.manger.module.validate.commons.PageValidate;
import com.zss98.manger.module.validate.system.SystemPostCreateValidate;
import com.zss98.manger.module.validate.system.SystemPostSearchValidate;
import com.zss98.manger.module.validate.system.SystemPostUpdateValidate;
import com.zss98.manger.module.vo.system.SystemAuthPostVo;
import com.zss98.manger.common.core.PageResult;

import java.util.List;

/**
 * 系统岗位服务接口类
 */
public interface ISystemAuthPostService {

    /**
     * 岗位所有
     *
     * @author fzr
     * @return List<SystemPostVo>
     */
    List<SystemAuthPostVo> all();

    /**
     * 岗位列表
     *
     * @author fzr
     * @param pageValidate 分页参数
     * @param searchValidate 搜索参数
     * @return PageResult<SystemPostVo>
     */
    PageResult<SystemAuthPostVo> list(PageValidate pageValidate, SystemPostSearchValidate searchValidate);

    /**
     * 岗位详情
     *
     * @author fzr
     * @param id 主键
     * @return SystemPostVo
     */
    SystemAuthPostVo detail(Integer id);

    /**
     * 岗位新增
     *
     * @author fzr
     * @param createValidate 参数
     */
    void add(SystemPostCreateValidate createValidate);

    /**
     * 岗位编辑
     *
     * @author fzr
     * @param updateValidate 参数
     */
    void edit(SystemPostUpdateValidate updateValidate);

    /**
     * 岗位删除
     *
     * @author fzr
     * @param id 主键
     */
    void del(Integer id);

}
