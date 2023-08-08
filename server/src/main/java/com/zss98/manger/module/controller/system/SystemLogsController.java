package com.zss98.manger.module.controller.system;

import com.zss98.manger.module.service.ISystemLogsServer;
import com.zss98.manger.module.validate.commons.PageValidate;
import com.zss98.manger.module.validate.system.SystemSearchLoginsValidate;
import com.zss98.manger.module.validate.system.SystemSearchOperateValidate;
import com.zss98.manger.module.vo.system.SystemLogLoginVo;
import com.zss98.manger.module.vo.system.SystemLogOperateVo;
import com.zss98.manger.common.core.AjaxResult;
import com.zss98.manger.common.core.PageResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("api/system/log")
@Api(tags = "系统日志管理")
public class SystemLogsController {

    @Resource
    ISystemLogsServer iSystemLogsServer;

    @GetMapping("/operate")
    @ApiOperation(value="系统操作日志")
    public AjaxResult<PageResult<SystemLogOperateVo>> operate(@Validated PageValidate pageValidate,
                                                              @Validated SystemSearchOperateValidate searchValidate) {
        PageResult<SystemLogOperateVo> list = iSystemLogsServer.operate(pageValidate, searchValidate);
        return AjaxResult.success(list);
    }

    @GetMapping("/login")
    @ApiOperation(value="系统登录日志")
    public AjaxResult<PageResult<SystemLogLoginVo>> login(@Validated PageValidate pageValidate,
                                                          @Validated SystemSearchLoginsValidate searchValidate) {
        PageResult<SystemLogLoginVo> list = iSystemLogsServer.login(pageValidate, searchValidate);
        return AjaxResult.success(list);
    }

}
