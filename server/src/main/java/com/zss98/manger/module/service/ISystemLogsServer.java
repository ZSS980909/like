package com.zss98.manger.module.service;

import com.zss98.manger.module.validate.commons.PageValidate;
import com.zss98.manger.module.validate.system.SystemSearchLoginsValidate;
import com.zss98.manger.module.validate.system.SystemSearchOperateValidate;
import com.zss98.manger.module.vo.system.SystemLogLoginVo;
import com.zss98.manger.module.vo.system.SystemLogOperateVo;
import com.zss98.manger.common.core.PageResult;

/**
 * 系统日志服务类接口类
 */
public interface ISystemLogsServer {

    /**
     * 系统操作日志
     *
     * @author fzr
     * @param pageValidate 分页参数
     * @param searchValidate 搜索参数
     * @return PageResult<LogOperateVo>
     */
    PageResult<SystemLogOperateVo> operate(PageValidate pageValidate, SystemSearchOperateValidate searchValidate);

    /**
     * 系统登录日志
     *
     * @param pageValidate 分页参数
     * @param searchValidate 搜索参数
     * @return PageResult<LogLoginVo>
     */
    PageResult<SystemLogLoginVo> login(PageValidate pageValidate, SystemSearchLoginsValidate searchValidate);

}
