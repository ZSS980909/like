package com.zss98.manger.module.controller.system;

import com.zss98.manger.LikeAdminThreadLocal;
import com.zss98.manger.common.aop.Log;
import com.zss98.manger.common.aop.NotPower;
import com.zss98.manger.module.service.ISystemAuthAdminService;
import com.zss98.manger.module.validate.commons.IdValidate;
import com.zss98.manger.module.validate.commons.PageValidate;
import com.zss98.manger.module.validate.system.SystemAdminCreateValidate;
import com.zss98.manger.module.validate.system.SystemAdminSearchValidate;
import com.zss98.manger.module.validate.system.SystemAdminUpInfoValidate;
import com.zss98.manger.module.validate.system.SystemAdminUpdateValidate;
import com.zss98.manger.module.vo.system.SystemAuthAdminDetailVo;
import com.zss98.manger.module.vo.system.SystemAuthAdminListedVo;
import com.zss98.manger.module.vo.system.SystemAuthAdminSelvesVo;
import com.zss98.manger.common.core.AjaxResult;
import com.zss98.manger.common.core.PageResult;
import com.zss98.manger.common.validator.annotation.IDMust;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("api/system/admin")
@Api(tags = "系统用户管理")
public class SystemAuthAdminController {

    @Resource
    ISystemAuthAdminService iSystemAuthAdminService;

    @GetMapping("/list")
    @ApiOperation(value="管理员列表")
    public AjaxResult<PageResult<SystemAuthAdminListedVo>> list(@Validated PageValidate pageValidate,
                                                                @Validated SystemAdminSearchValidate searchValidate) {
        PageResult<SystemAuthAdminListedVo> list = iSystemAuthAdminService.list(pageValidate, searchValidate);
        return AjaxResult.success(list);
    }

    @NotPower
    @GetMapping("/self")
    @ApiOperation(value="管理员信息")
    public AjaxResult<SystemAuthAdminSelvesVo> self() {
        Integer adminId = LikeAdminThreadLocal.getAdminId();
        SystemAuthAdminSelvesVo vo = iSystemAuthAdminService.self(adminId);
        return AjaxResult.success(vo);
    }

    @GetMapping("/detail")
    @ApiOperation(value="管理员详情")
    public AjaxResult<SystemAuthAdminDetailVo> detail(@Validated @IDMust() @RequestParam("id") Integer id) {
        SystemAuthAdminDetailVo vo = iSystemAuthAdminService.detail(id);
        return AjaxResult.success(vo);
    }

    @Log(title = "管理员新增")
    @PostMapping("/add")
    @ApiOperation(value="管理员新增")
    public AjaxResult<Object> add(@Validated @RequestBody SystemAdminCreateValidate createValidate) {
        iSystemAuthAdminService.add(createValidate);
        return AjaxResult.success();
    }

    @Log(title = "管理员编辑")
    @PostMapping("/edit")
    @ApiOperation(value="管理员编辑")
    public AjaxResult<Object> edit(@Validated @RequestBody SystemAdminUpdateValidate updateValidate) {
        Integer adminId = LikeAdminThreadLocal.getAdminId();
        iSystemAuthAdminService.edit(updateValidate, adminId);
        return AjaxResult.success();
    }

    @NotPower
    @Log(title = "管理员更新")
    @PostMapping("/upInfo")
    @ApiOperation(value="当前管理员更新")
    public AjaxResult<Object> upInfo(@Validated @RequestBody SystemAdminUpInfoValidate upInfoValidate) {
        Integer adminId = LikeAdminThreadLocal.getAdminId();
        iSystemAuthAdminService.upInfo(upInfoValidate, adminId);
        return AjaxResult.success();
    }

    @Log(title = "管理员删除")
    @PostMapping("/del")
    @ApiOperation(value="管理员删除")
    public AjaxResult<Object> del(@Validated @RequestBody IdValidate idValidate) {
        Integer adminId = LikeAdminThreadLocal.getAdminId();
        iSystemAuthAdminService.del(idValidate.getId(), adminId);
        return AjaxResult.success();
    }

    @Log(title = "管理员状态")
    @PostMapping("/disable")
    @ApiOperation(value="管理员状态切换")
    public AjaxResult<Object> disable(@Validated @RequestBody IdValidate idValidate) {
        Integer adminId = LikeAdminThreadLocal.getAdminId();
        iSystemAuthAdminService.disable(idValidate.getId(), adminId);
        return AjaxResult.success();
    }

}
