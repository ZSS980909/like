package com.zss98.manger.module.validate.setting;

import com.zss98.manger.module.vo.setting.SettingPaymentMethodVo;
import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.util.List;

@Data
@ApiModel("支付方式设置参数")
public class SettingPayMethodValidate {

    List<List<SettingPaymentMethodVo>> data;

}
