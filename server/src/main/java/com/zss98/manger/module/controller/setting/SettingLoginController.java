package com.zss98.manger.module.controller.setting;

import com.zss98.manger.common.aop.Log;
import com.zss98.manger.module.service.ISettingLoginService;
import com.zss98.manger.module.validate.setting.SettingLoginValidate;
import com.zss98.manger.module.vo.setting.SettingLoginVo;
import com.zss98.manger.common.core.AjaxResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("api/setting/login")
@Api(tags = "配置用户登录")
public class SettingLoginController {

    @Resource
    ISettingLoginService iSettingLoginService;

    @GetMapping("/detail")
    @ApiOperation(value="登录设置详情")
    public AjaxResult<SettingLoginVo> detail() {
        SettingLoginVo vo = iSettingLoginService.detail();
        return AjaxResult.success(vo);
    }

    @Log(title = "登录设置编辑")
    @PostMapping("/save")
    @ApiOperation(value="登录设置编辑")
    public AjaxResult<Object> save(@Validated @RequestBody SettingLoginValidate loginValidate) {
        iSettingLoginService.save(loginValidate);
        return AjaxResult.success();
    }

}
