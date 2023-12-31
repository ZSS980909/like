package com.zss98.manger.common.aop;

import com.zss98.manger.common.aop.aspect.RequestType;

import java.lang.annotation.*;

/**
 * 日志记录类
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {

    /**
     * 模块名称
     *
     * @return String
     */
    String title() default "";

    /**
     * 请求类型
     *
     * @return String
     */
    RequestType requestType() default RequestType.Default;

}
