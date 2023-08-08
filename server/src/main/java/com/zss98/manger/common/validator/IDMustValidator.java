package com.zss98.manger.common.validator;

import com.zss98.manger.common.validator.annotation.IDMust;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * 验证主键ID参数
 */
public class IDMustValidator implements ConstraintValidator<IDMust, Integer> {

    @Override
    public void initialize(IDMust constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
    }

    @Override
    public boolean isValid(Integer value, ConstraintValidatorContext constraintValidatorContext) {
        return value != null && value > 0;
    }

}
