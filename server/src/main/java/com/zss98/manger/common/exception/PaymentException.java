package com.zss98.manger.common.exception;

import com.zss98.manger.common.enums.ErrorEnum;

/**
 * 支付失败异常
 */
public class PaymentException extends BaseException {

    public PaymentException(String msg) {
        super(ErrorEnum.PAYMENT_ERROR.getCode(), msg);
    }

    public PaymentException(String msg, Integer errCode) {
        super(errCode, msg);
    }

}
