package com.zss98.manger.module.service.impl;

import com.zss98.manger.module.service.ISystemCacheService;
import com.zss98.manger.common.cache.ConfigCache;
import org.springframework.stereotype.Service;

/**
 * 系统缓存实现类
 */
@Service
public class SystemCacheServiceImpl implements ISystemCacheService {

    /**
     * 清除系统缓存
     */
    @Override
    public void clear() {
        ConfigCache.clear();
    }


}
