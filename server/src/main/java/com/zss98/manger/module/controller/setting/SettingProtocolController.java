package com.zss98.manger.module.controller.setting;

import com.zss98.manger.common.aop.Log;
import com.zss98.manger.module.service.ISettingProtocolService;
import com.zss98.manger.module.validate.setting.SettingProtocolValidate;
import com.zss98.manger.module.vo.setting.SettingProtocolDetailVo;
import com.zss98.manger.common.core.AjaxResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("api/setting/protocol")
@Api(tags = "配置政策协议")
public class SettingProtocolController {

    @Resource
    ISettingProtocolService iSettingProtocolService;

    @GetMapping("/detail")
    @ApiOperation(value="政策协议信息")
    public AjaxResult<SettingProtocolDetailVo> detail() {
        SettingProtocolDetailVo detail = iSettingProtocolService.detail();
        return AjaxResult.success(detail);
    }

    @Log(title = "政策协议编辑")
    @PostMapping("/save")
    @ApiOperation(value="政策协议编辑")
    public AjaxResult<Object> save(@Validated @RequestBody SettingProtocolValidate protocolValidate) {
        iSettingProtocolService.save(protocolValidate);
        return AjaxResult.success();
    }

}
