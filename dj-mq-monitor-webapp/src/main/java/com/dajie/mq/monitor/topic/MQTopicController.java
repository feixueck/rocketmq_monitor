package com.dajie.mq.monitor.topic;

import com.dajie.common.dubbo.util.StringUtil;
import com.dajie.common.framework.spring.controller.BaseController;
import com.dajie.common.util.CollectionUtil;
import com.dajie.framework.config.EnvironmentEnum;
import com.dajie.framework.config.impl.DefaultConfigManager;
import com.dajie.mq.monitor.model.MQInfoDetail;
import com.dajie.mq.monitor.model.MQTopic;
import com.dajie.mq.monitor.model.SimplePage;
import com.dajie.mq.monitor.service.MQTopicService;
import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
@RequestMapping("topics")
public class MQTopicController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(MQTopicController.class);
    @Autowired
    private MQTopicService mqTopicService;

    @RequestMapping("all")
    public ModelAndView allTopics(@RequestParam(defaultValue = "1") int page,
                                  @RequestParam(defaultValue = "20") int pageSize) {
        LOGGER.info("get all topics");
        ModelAndView mv = new ModelAndView("topic/list");
        SimplePage<String> mqTopicsByPage = mqTopicService.getAllMQTopicsByPage(page, pageSize);
        List<String> mqTopics = mqTopicsByPage.getData();
        mv.addObject("mqTopics", mqTopics);
        mv.addObject("currentPage", page);
        int pageFlag = mqTopicsByPage.getTotalCount()/pageSize;
        mv.addObject("totalPage", mqTopicsByPage.getTotalCount()%pageSize ==0 ?  pageFlag : pageFlag + 1);
        EnvironmentEnum environment = DefaultConfigManager.getInstance().getEnvironmentEnum();
        if(EnvironmentEnum.TEST.equals(environment)){
            mv.addObject("domain", "http://www.dajie.com");
        }
        if(EnvironmentEnum.PRODUCT.equals(environment)){
            mv.addObject("domain", "http://10.10.65.127:8513");
        }
        return mv;
    }

    @RequestMapping("find")
    public ModelAndView  findTopic(@RequestParam(defaultValue = "topic") String topic){
        ModelAndView mv = new ModelAndView("topic/list");
        if(StringUtil.isEmpty(topic)){
            LOGGER.info("not find {}",topic);
            return mv;
        }
        List<MQInfoDetail> mqInfoDetails = mqTopicService.findByTopicName(topic);
        if(CollectionUtil.isCollectionEmpty(mqInfoDetails)){
            return mv;
        }
        List<String> mqTopics = Lists.newArrayList();
        for(MQInfoDetail mqInfoDetail : mqInfoDetails){
            mqTopics.add(mqInfoDetail.getTopicName());
        }
        mv.addObject("mqTopics", mqTopics);
        return mv;
    }
}
