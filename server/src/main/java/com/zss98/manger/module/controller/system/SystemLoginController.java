package com.zss98.manger.module.controller.system;

import com.zss98.manger.common.aop.NotLogin;
import com.zss98.manger.common.aop.NotPower;
import com.zss98.manger.module.service.ISystemLoginService;
import com.zss98.manger.module.validate.system.SystemAdminLoginsValidate;
import com.zss98.manger.module.vo.system.SystemCaptchaVo;
import com.zss98.manger.module.vo.system.SystemLoginVo;
import com.zss98.manger.common.core.AjaxResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("api/system")
@Api(tags = "系统登录管理")
public class SystemLoginController {

    @Resource
    ISystemLoginService iSystemLoginService;

    @NotLogin
    @GetMapping("/captcha")
    @ApiOperation(value="取验证码")
    public AjaxResult<SystemCaptchaVo> captcha() {
        SystemCaptchaVo vo = iSystemLoginService.captcha();
        return AjaxResult.success(vo);
    }

    @NotLogin
    @PostMapping("/login")
    @ApiOperation(value="登录系统")
    public AjaxResult<SystemLoginVo> login(@Validated() @RequestBody SystemAdminLoginsValidate loginsValidate) {
        SystemLoginVo vo = iSystemLoginService.login(loginsValidate);
        return AjaxResult.success(vo);
    }

    @NotPower
    @PostMapping("/logout")
    @ApiOperation(value="退出登录")
    public AjaxResult<Object> logout(HttpServletRequest request) {
        iSystemLoginService.logout(request.getHeader("token"));
        return AjaxResult.success();
    }

}
