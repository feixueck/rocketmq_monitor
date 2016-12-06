package com.dajie.mq.monitor.topic.provider;

import com.dajie.common.cqrs.service.query.Page;
import com.dajie.common.framework.spring.controller.BaseController;
import com.dajie.framework.config.EnvironmentEnum;
import com.dajie.framework.config.impl.DefaultConfigManager;
import com.dajie.mq.monitor.model.MQInfoDetail;
import com.dajie.mq.monitor.service.MQProviderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by yanan.sun on 2016/10/8.
 */
@Controller
@RequestMapping("providers")
public class MQMonitorProviderController  extends BaseController {
    @Autowired
    private MQProviderService mqProviderService;

    @RequestMapping("list")
    public ModelAndView allMQConsumers(@RequestParam(value = "topic") String topicName){
        ModelAndView modelAndView = new ModelAndView("provider/list");
        List<MQInfoDetail> mqInfoDetailList = mqProviderService.findByTopicName(topicName);
        modelAndView.addObject("mqProviders", mqInfoDetailList);
        EnvironmentEnum environment = DefaultConfigManager.getInstance().getEnvironmentEnum();
        if(EnvironmentEnum.TEST.equals(environment)){
            modelAndView.addObject("domain", "http://www.dajie.com");
        }
        if(EnvironmentEnum.PRODUCT.equals(environment)){
            modelAndView.addObject("domain", "http://10.10.65.127:8513");
        }
        return modelAndView;
    }
}
