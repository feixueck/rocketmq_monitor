<#macro navigation selectItem="full" nav="nav1" cid="" noclickSelf=true >
<div class="nav2-box">
    <#if nav = "nav1">
        <ul class="nav2">
            <li <#if selectItem="full">class="selected"</#if>><a href="http://${configs['domains.job']}/job/index"><span>找全职</span></a></li>
            <li <#if selectItem="campus">class="selected"</#if>><a href="http://${configs['domains.campus']}/campusIndex"><span>校园招聘</span></a></li>
            <li <#if selectItem="intern">class="selected"</#if>><a href="http://${configs['domains.job']}/job/intern"><span>找实习</span></a></li>
            <#--<li <#if selectItem="candidate">class="selected"</#if>><a href="http://${configs['domains.job']}/candidate/campus/search"><span>校园人才库</span></a></li>-->
            <li <#if selectItem="recommend">class="selected"</#if>><a href="http://${configs['domains.job']}/recommend/index"><span>推荐给我的</span></a></li>
            <li <#if selectItem="apply">class="selected"</#if>><a href="http://${configs['domains.job']}/application/index"><span>我投递的职位</span></a></li>
            <li <#if selectItem="intent">class="selected"</#if>><a href="http://${configs['domains.job']}/intention/index"><span>职位订阅</span></a></li>
        </ul>
            <span class="new-job" style="margin-top: -45px;">
                <div class="job-type-select">
                    <p>我要招人</p>
                    <div>
                        <dl>
                            <dt>我要招人</dt>
                            <dd><a class="green" href="http://${configs['domains.job']}/post/create">发布新职位</a></dd>
                            <dd><a class="green" href="http://${configs['domains.job']}/recruit/list">我发布的职位</a></dd>
                            <dd><a class="green" href="http://${configs['domains.job']}/apply/profile/index">收到的职业档案</a></dd>
                            <dd><a class="green" href="http://${configs['domains.job']}/recruit/apply/index?pageType=interview">我的面试安排</a></dd>
                        </dl>
                    </div>
                </div>
                <script type="text/javascript">
                    $('.job-type-select div').overlay();
                    $('.job-type-select').live('mouseover',function(){
                        $(this).addClass('over');
                    }).live('mouseout',function(){
                                $(this).removeClass('over');
                            });
                </script>
            </span>
    <#elseif nav = "nav2">
        <#if bindingCorp?? >
            <#assign corp_url = "http://"+configs["domains.www"]+"/corp/view/showIntro?corpId="+bindingCorp.corpId />
        <#else >
            <#assign corp_url = "http://www.dajie.com/corp/view/default?cid="+cid />
        </#if>
        <ul class="nav2">
            <li <#if selectItem="recruit">class="selected"</#if>><a href="http://${configs['domains.job']}/recruit/list"><span>我发布的职位</span></a></li>
            <li <#if selectItem="receivedResume">class="selected"</#if>><a href="http://${configs['domains.job']}/apply/profile/index"><span>我收到的职业档案</span></a></li>
            <li <#if selectItem="interest">class="selected"</#if>><a href="http://${configs['domains.job']}/apply/profile/fav"><span>我感兴趣的人</span></a></li>
            <li <#if selectItem="interview">class="selected"</#if>><a href="http://${configs['domains.job']}/recruit/apply/index?pageType=interview"><span>我的面试安排</span></a></li>
            <li <#if selectItem="corpProfile">class="selected"</#if>><a href="${corp_url}"><span>我的公司资料</span></a></li>
        </ul>
            <span class="new-job" style="margin-top: -45px;">
                <div class="job-type-select" style="width:122px;">
                    <p style="background-position:108px 10px">我要求职</p>
                    <div style="width:122px;">
                        <dl>
                            <dt>我要求职</dt>
                            <dd><a class="green" href="http://${configs['domains.job']}/job/redirect">找工作</a></dd>
                            <dd><a class="green" href="http://${configs['domains.job']}/recommend/index">推荐给我的职位</a></dd>
                            <dd><a class="green" href="http://${configs['domains.job']}/application/index">我投递的职位</a></dd>
                            <dd><a class="green" href="http://${configs['domains.job']}/intention/index">职位订阅</a></dd>
                        </dl>
                    </div>
                </div>
                <script type="text/javascript">
                    $('.job-type-select div').overlay();
                    $('.job-type-select').live('mouseover',function(){
                        $(this).addClass('over');
                    }).live('mouseout',function(){
                                $(this).removeClass('over');
                            });
                </script>
            </span>
    </#if>
</div>
</#macro>