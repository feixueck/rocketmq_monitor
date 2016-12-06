package com.dajie.mq.monitor.topic.consumer;

import com.dajie.common.cqrs.service.query.Page;
import com.dajie.common.framework.spring.controller.BaseController;
import com.dajie.common.util.StringUtil;
import com.dajie.framework.config.EnvironmentEnum;
import com.dajie.framework.config.impl.DefaultConfigManager;
import com.dajie.mq.monitor.model.MQInfoDetail;
import com.dajie.mq.monitor.service.MQConsumerService;
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
@RequestMapping("consumers")
public class MQMonitorConsumerController extends BaseController {
    @Autowired
    private MQConsumerService mqConsumerService;
    @RequestMapping("list")
    public ModelAndView allMQConsumers(@RequestParam(value = "topic") String topicName){
        if(StringUtil.isEmpty(topicName)){
        }
        ModelAndView modelAndView = new ModelAndView("consumer/list");
        List<MQInfoDetail> mqInfoDetailList = mqConsumerService.findByTopicName(topicName);
        modelAndView.addObject("mqConsumers", mqInfoDetailList);
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
