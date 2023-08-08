package com.zss98.manger.module.mapper.system;

import com.zss98.manger.module.entity.system.SystemAuthAdmin;
import com.zss98.manger.common.core.basics.IBaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 系统管理员Mapper
 */
@Mapper
public interface SystemAuthAdminMapper extends IBaseMapper<SystemAuthAdmin> {

    /**
     * 获取角色管理员
     *
     * @author fzr
     * @param id 文件夹ID
     * @return List<Integer>
     */
    @Select("SELECT id FROM ${prefix}system_auth_admin WHERE is_delete=0 AND FIND_IN_SET(#{id}, role_ids)")
    List<Integer> selectChildrenById(Integer id);

}
