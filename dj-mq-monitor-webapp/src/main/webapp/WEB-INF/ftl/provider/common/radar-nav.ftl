<#if radarStatus?? && radarStatus != -2><!--学生身份-->
<#if configs['dev.mode']=='0'>
    <link rel="stylesheet" type="text/css" href="<@url>/up/radar/css/radar_global.${configs['assets.version']}.css</@url>"/>
<#else>
    <link rel="stylesheet" type="text/css" href="<@url>/up/radar/css/radar_global.css</@url>"/>
</#if>
<#assign txtMap = {'0':"参加宣讲会",
    '1':"接受邀约",
    '2':"拒绝邀约",
    '3':"收到面试通知",
    '4':"收到笔试通知",
    '5':"HR感兴趣",
    '6':"参加网申",
    '7':"投递职位",
    '8':"testsss",
    '9':"testsss",
    '100':"好友提问"} />
    <#assign classMap = {'0':"num announce-cat",
    '1':"num accept-cat",
    '2':"num refuse-cat",
    '3':"num audition-cat",
    '4':"num written-cat",
    '5':"num favorite-cat",
    '6':"num delivery-cat",
    '7':"num delivery-cat",
    '8':"num",
    '9':"num",
    '100':"num question-cat"} />
<div class="global-radar-tips" id="J_GlobalRadarTips">
    <#if !personCount?? || personCount==0><#assign personCount=5></#if>
    <div class="inner">
        <div style="display: none;" class="radar-counter"><b><a href="javascript:void(0);">${personCount!"5"}</a></b></div>
        <div style="display: none;" class="radar-feed-box">
            <a href="javascript:void(0);" class="remove">&nbsp;</a>
            <div class="hd"><h3><a href="http://${configs['domains.www']}/radar/cluster/index">求职雷达</a></h3></div>
            <div class="bd">
                <#assign typeName=""/>
                <#if d.infoType == "0">
                    <#assign typeName="该宣讲会"/>
                <#elseif d.infoType == "1">
                    <#assign typeName="该校招"/>
                <#elseif d.infoType == "2">
                    <#assign typeName="该职位"/>
                </#if>
                <#if radarStatus == -1><!--未开启雷达-->
                    <#if mayKnowSchoolMates?? && mayKnowSchoolMates?size gt 0>
                     <div class="has-recomend" id="radar-recomend-div-list">
                            <p class="radar-feed-title t-top">添加更多同学，看看他们在关注什么工作：</p>
                            <div class="radar-recomend-list clearfix">
                              <#list mayKnowSchoolMates as u>
                                <dl <#if u_index gt 1 > style="display:none"</#if>>
                                    <dt>
                                        <a target="_blank" href="${u.homepage()}">
                                            <img width="50" height="50" class="radar-rc-pf" title="${u.name!''?html}" src="${u.getAvatarUrl("s")}">
                                        </a>
                                    </dt>
                                    <dd>
                                        <p class=""><a href="${u.homepage()}" class="in_title" target="_blank">${u.name!''?html}</a></p>
                                        <p class="b g6">
                                            <#if u.identity==0>
                                                <#if u.schoolName?? && u.schoolName?length gt 0> <@cutWords words =u.schoolName length =7 suffix = "..."/></#if>
                                             <#else >
                                                <#if u.corpName?? && u.corpName?length gt 0> <@cutWords words =u.corpName length =7 suffix = "..."/></#if>
                                            </#if>
                                        </p>
                                        <p class="">
                                            <a class="radar-add-follow" exchangeuid="${u.uid}" href="javascript:void(0);"><span class="addnew">+</span>交换名片</a>
                                        </p>
                                    </dd>
                                    <a class="radar-remove-rc" href="javascript:void(0)" exchangeuid="${u.uid}"></a>
                                </dl>
                              </#list>
                            </div>
                        </div>
                    </#if>
                    <div class="no-feed-box" id="no-feed-box-id" <#if mayKnowSchoolMates?? && mayKnowSchoolMates?size gt 0>style="display:none"</#if>>
                        <p<#if personCount?? && personCount gt 999> style="font-size:12px" </#if>><b>${personCount!"5"}</b>个同学参与${typeName}</p>
                        <a title="看看他们是谁" href="http://${configs['domains.www']}/radar/index?d.from=nav">看看他们是谁</a>
                    </div>
                <#else>
                    <#if operationList?? && operationCountMap?? && operationList.size() gt 0 && operationCountMap.size() gt 0>
                        <div class="has-feed-box">
                            <h4><a href="http://${configs['domains.www']}/radar/cluster/all?tid=<#if tid?? && tid!=-1>${tid!string}</#if>&infoType=${infoType}&days=7"><em class="num" style="color:#3D990F;font-size:20px;">${personCount!"5"}</em><span style="color:#000;">人参与${typeName}</span></a></h4>
                            <ul class="radar-scan-list">
                                <#list operationList as operation>
                                    <li class="${classMap[operation?string]}">${txtMap[operation?string]}<a title="" href="http://${configs['domains.www']}/radar/cluster/all?tid=<#if tid?? && tid!=-1>${tid!string}</#if>&infoType=${infoType}&days=7&option=${operation?string}" class="cat-num">${operationCountMap.get(operation?int)}人</a></li>
                                </#list>
                            </ul>
                        </div>
                        <div class="btn-box" style="padding-left:0px;"><a title="跟好友打听一下" href="http://${configs['domains.www']}/radar/question/ask<#if tid?? && tid!=-1>?d.tid=${tid}</#if>" class="goto-ask-friends"><b>跟好友打听一下<b></b></b></a></div>
                    <#elseif mayKnowSchoolMates?? && mayKnowSchoolMates?size gt 0>
                        <div class="has-recomend" id="radar-recomend-div-list">
                            <p class="radar-feed-title t-top">没有在这里发现有价值的情报..</p>
                            <p class="radar-feed-title" >添加更多同学，扩大侦测范围：</p>
                            <div class="radar-recomend-list clearfix">
                              <#list mayKnowSchoolMates as u>
                                <dl <#if u_index gt 1 > style="display:none"</#if>>
                                    <dt>
                                        <a target="_blank" href="${u.homepage()}">
                                            <img width="50" height="50" class="radar-rc-pf" title="${u.name!''?html}" src="${u.getAvatarUrl("s")}">
                                        </a>
                                    </dt>
                                    <dd>
                                        <p class=""><a href="${u.homepage()}" class="in_title" target="_blank">${u.name!''?html}</a></p>
                                        <p class="b g6">
                                            <#if u.identity==0>
                                                <#if u.schoolName?? && u.schoolName?length gt 0> <@cutWords words =u.schoolName length =7 suffix = "..."/></#if>
                                             <#else >
                                                <#if u.corpName?? && u.corpName?length gt 0> <@cutWords words =u.corpName length =7 suffix = "..."/></#if>
                                            </#if>
                                        </p>
                                        <p class="">
                                            <a class="radar-add-follow" exchangeuid="${u.uid}" href="javascript:void(0);"><span class="addnew">+</span>交换名片</a>
                                        </p>
                                    </dd>
                                    <a class="radar-remove-rc" href="javascript:void(0)" exchangeuid="${u.uid}"></a>
                                </dl>
                              </#list>
                            </div>
                        </div>
                        <div class="no-feed-box" id="no-feed-box-id" style="display:none">
                            <p>没有在这发现有用的情报</p>
                            <a title="扩大侦测范围" href="http://${configs['domains.www']}/radar/setting/renrenscope">扩大侦测范围</a>
                        </div>
                        <div class="btn-box" style="padding-left:0px;"><a title="跟好友打听一下" href="http://${configs['domains.www']}/radar/question/ask<#if tid?? && tid!=-1>?d.tid=${tid}</#if>" class="goto-ask-friends"><b>跟好友打听一下<b></b></b></a></div>
                    <#else>
                        <div class="no-feed-box">
                            <p>没有在这发现有用的情报</p>
                            <a title="扩大侦测范围" href="http://${configs['domains.www']}/radar/setting/renrenscope">扩大侦测范围</a>
                        </div>
                        <div class="btn-box" style="padding-left:0px;"><a title="跟好友打听一下" href="http://${configs['domains.www']}/radar/question/ask<#if tid?? && tid!=-1>?d.tid=${tid}</#if>" class="goto-ask-friends"><b>跟好友打听一下<b></b></b></a></div>
                    </#if>
                </#if>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
   <#if radarStatus == -1>
        var _has_open_radar = -1;  //未开启雷达
   <#else>
        var _has_open_radar = 1;   //已开启雷达
   </#if>
        // 雷达相关-start
    //右下角求职雷达动态展示
    function radarCounterShow (){
        var rfb = $('.radar-feed-box'),
            rc = $('.radar-counter');
        rfb.slideUp('slow');
        rc.show('slow');
        $("#J_GlobalRadarTips").css({"min-width":"60px"});
        fixedPosition();
    }
    function radarFeedBoxShow (){
        var rfb = $('.radar-feed-box'),
            rc = $('.radar-counter');
        rc.hide();
        rfb.slideDown('slow');
        $("#J_GlobalRadarTips").css({"min-width":"222px"});
        fixedPosition();
    }
    $('.radar-counter a').live('click', function(){ radarFeedBoxShow(); });
    $('.radar-feed-box .remove').live('click', function(){ radarCounterShow(); });
    //右下角求职雷达动态IE6下定位
    function fixedPosition (){
        if($.browser.msie && $.browser.version == 6){
            function positionReset (){
                var boxHeight = $('#J_GlobalRadarTips').height(),
                    targetTop = $(window).height() + $(document).scrollTop() - boxHeight - 10;
                $('#J_GlobalRadarTips').css({top: targetTop + 'px'});
            }
            $(window).scroll(function(){ positionReset(); });
            $('#J_GlobalRadarTips').resize(function(){ positionReset(); });
        }
    }
    fixedPosition();
    //右下角动作脚本--有可能认识的人
    //添加为人脉
    $('.radar-add-follow').live('click', function(event){
        event.preventDefault();
        $this = $(this);
        var _uid = $this.attr("exchangeuid") == undefined ? 0 : $(this).attr("exchangeuid");
        if (_uid > 0) {
            $this.text('等待对方确认');
            $.getScript('http://${configs['domains.www']}/card/exchange/send?ad=3&gids=2&requestInfo=&uid=' + _uid + '&t=' + new Date().getTime());
            _opeanRadar();
            $this.parents("dl").fadeOut("300", function() {
                $this.parents("dl").remove();
                _initCardExchangeBox();
            });
        }
    });
    //删除一个推荐人
    $('.radar-remove-rc').live('click', function(event) {
        event.preventDefault();
        $this = $(this);
        var _uid = $this.attr("exchangeuid") == undefined ? 0 : $(this).attr("exchangeuid");
        if (_uid > 0) {
            $.getScript('http://${configs['domains.www']}/card/deletemayknow?uid=' + _uid+'&t=' + new Date().getTime());
            $this.parents("dl").remove();
            _initCardExchangeBox();
        }
    });
    function _initCardExchangeBox(){
        if ($("#radar-recomend-div-list dl").length > 0) {
            $("#radar-recomend-div-list dl:hidden").eq(0).show();
        } else {
            $("#radar-recomend-div-list").remove();
            $('#no-feed-box-id').show();
        }
    }
    function _opeanRadar() {
        if (typeof _has_open_radar != 'undefined' && _has_open_radar == -1) {
            $.getScript('http://${configs['domains.www']}/radar/open?t=' + new Date().getTime(), function(r) {
                if (r == 0) {
                    _has_open_radar ==1;
                }
            });
        }
    }

    //关闭提示信息框
    $('.tips-box .remove').live("click",function(){
        $('.tips-box').hide();
    });
    // 雷达相关-end
    if ($('#radar-recomend-div-list').length > 0) {
        $('#no-feed-box-id').hide();
    }
</script>
</#if>