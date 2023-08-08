package com.zss98.manger.module.controller.system;

import com.alibaba.fastjson2.JSONArray;
import com.zss98.manger.common.aop.NotPower;
import com.zss98.manger.module.service.ISystemAuthDeptService;
import com.zss98.manger.module.validate.commons.IdValidate;
import com.zss98.manger.module.validate.system.SystemDeptCreateValidate;
import com.zss98.manger.module.validate.system.SystemDeptSearchValidate;
import com.zss98.manger.module.validate.system.SystemDeptUpdateValidate;
import com.zss98.manger.module.vo.system.SystemAuthDeptVo;
import com.zss98.manger.common.core.AjaxResult;
import com.zss98.manger.common.validator.annotation.IDMust;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("api/system/dept")
@Api(tags = "系统部门管理")
public class SystemAuthDeptController {

    @Resource
    ISystemAuthDeptService iSystemAuthDeptService;

    @NotPower
    @GetMapping("/all")
    @ApiOperation(value="部门所有")
    public AjaxResult<List<SystemAuthDeptVo>> all() {
        List<SystemAuthDeptVo> list = iSystemAuthDeptService.all();
        return AjaxResult.success(list);
    }

    @GetMapping("/list")
    @ApiOperation(value="部门列表")
    public AjaxResult<JSONArray> list(@Validated SystemDeptSearchValidate searchValidate) {
        JSONArray list = iSystemAuthDeptService.list(searchValidate);
        return AjaxResult.success(list);
    }

    @GetMapping("/detail")
    @ApiOperation(value="部门详情")
    public AjaxResult<SystemAuthDeptVo> detail(@Validated @IDMust() @RequestParam("id") Integer id) {
        SystemAuthDeptVo vo = iSystemAuthDeptService.detail(id);
        return AjaxResult.success(vo);
    }

    @PostMapping("/add")
    @ApiOperation(value="部门新增")
    public AjaxResult<Object> add(@Validated @RequestBody SystemDeptCreateValidate createValidate) {
        iSystemAuthDeptService.add(createValidate);
        return AjaxResult.success();
    }

    @PostMapping("/edit")
    @ApiOperation(value="部门编辑")
    public AjaxResult<Object> edit(@Validated @RequestBody SystemDeptUpdateValidate updateValidate) {
        iSystemAuthDeptService.edit(updateValidate);
        return AjaxResult.success();
    }

    @PostMapping("/del")
    @ApiOperation(value="部门删除")
    public AjaxResult<Object> del(@Validated @RequestBody IdValidate idValidate) {
        iSystemAuthDeptService.del(idValidate.getId());
        return AjaxResult.success();
    }

}
