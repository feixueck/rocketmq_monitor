<#-- 测试使用，请勿引用上线  -->
<#include "elements.ftl" />
<#include "dialog.ftl" />
<#include "header-test.ftl" />
<#include "assets_compat_custom.ftl" />
<#macro djpage title="大街网_年轻人专属的社交招聘平台！" assets=[] useheader="default" usefooter="default" currentChannel="NONE" bodyclass="none" description="" keywords="">
<!DOCTYPE html>
<html class="${uaOS!''} ${uaBrowser!''}">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=7"/>
    <meta property="wb:webmaster" content="51a7e2b32704f6b5" />
    <title>${title?replace('预见新自己！','年轻人专属的社交招聘平台！','ir')}</title>
    <link rel="shortcut icon" href="<@url>/images/favicon.ico</@url>" />
    <meta content="${description}" name="description"/>
    <meta content="${keywords}" name="keywords"/>
    <script type="text/javascript">var _head_start = new Date();<#if currentDate??>var _current_date='${currentDate?string('yyyy-MM-dd HH:mm:ss')}';</#if></script>
    <@AssetsImport assets />
    <script type="text/javascript">
        $.domains = {
            www : "${configs['domains.www']}",
            assets : "${configs['domains.assets']}"
        };
            <#if uaBrowser?? && uaBrowser=='ua-ie6'>
            try {document.execCommand('BackgroundImageCache', false, true);} catch(e) {}
            </#if>
    </script>
</head>
<body <#if bodyclass != "none">class="${bodyclass}"</#if>>
<script type="text/javascript">var  _body_start = new Date();</script>
    <#assign ChannelEnum = {
    'NONE':{'navClass':'','description':'','noSubTitle':false},
    'HOME':{'navClass':'dj-index','description':'','noSubTitle':false},
    'PROFILE':{'navClass':'dj-profile','description':'','noSubTitle':false},
    'CARD':{'navClass':'dj-networks clearfix','description':'人&nbsp;脉','noSubTitle':false},
    'JOB':{'navClass':'dj-job','description':'职&nbsp;位','noSubTitle':false},
    'CORP':{'navClass':'dj-club','description':'公&nbsp;司<span style="font-size:10px; vertical-align:baseline; position:relative; top:-20px; left:10px; font-family:tahoma">BETA</span>','noSubTitle':false},
    'ASK':{'navClass':'dj-ask','description':'问&nbsp;答<span style="font-size:10px; vertical-align:baseline; position:relative; top:-20px; left:10px; font-family:tahoma">BETA</span>','noSubTitle':false},
    'NOTICE':{'navClass':'dj-notice','description':'通&nbsp;知','noSubTitle':false},
    'SETTING':{'navClass':'dj-account','description':'设&nbsp;置','noSubTitle':false},
    'CIRCLE':{'navClass':'dj-job-circle','description':'职业圈','noSubTitle':true},
    'CIRCLE-SEARCH':{'navClass':'dj-job-circle-sch','description':'职业圈','noSubTitle':false},
    'CIRCLE-GUIDE':{'navClass':'dj-job-circle-reg','description':'职业圈','noSubTitle':false},
    'CIRCLE-NEW-GUIDE':{'navClass':'dj-job-circle-hi201','description':'职业圈','noSubTitle':false},
    'CLUB':{'navClass':'dj-club','description':'名企招聘','noSubTitle':false},
    'ENTERPRISE':{'navClass':'dj-enterprise','description':'','noSubTitle':true}
    }/>
    <#assign realChannel = 'NONE'/>
    <#if ChannelEnum[currentChannel]??><#assign realChannel = currentChannel/></#if>
    <#if useheader != "none">
        <@header vary="${useheader}" menu="0" currentChannel="${realChannel}"/>
    </#if>
<div class="dj-content-wrap <#if useheader = 'default'>${ChannelEnum[realChannel].navClass}</#if>" id="dj-content-wrap">
    <div class="dj-content-inner">
        <#if ChannelEnum[realChannel].noSubTitle>
            <div class="dj-content-shadow">
                <#escape x as x?html>
                <#nested/>
            </#escape>
            </div>
        <#else>
            <#if useheader = 'default' && ChannelEnum[realChannel]?? && ChannelEnum[realChannel].navClass!=''>
                <div class="dj-sub-title">
                <#--每个频道的具体内容在header.ftl中控制-->
                    <#if ChannelEnum[realChannel].description?length gt 0><h2>${ChannelEnum[realChannel].description}</h2><#else><h2 style="display:none;"></h2></#if>
                </div>
            </#if>
            <div class="dj-content-shadow">
                <#escape x as x?html>
                <#nested/>
            </#escape>
            </div>
        </#if>
    </div>
</div>
    <#if usefooter != "none">
        <#include "footer.ftl"/>
    </#if>
    <script type="text/javascript">
        var root_canShowRegFloat = true;
    </script>
    <#assign domain = request.getServerName()>
    <#if !(dontShowAccountPop?? && dontShowAccountPop) && ((domain?? && (!user?? || request.requestURL.toString()?index_of('/job/index') gt 0) && (domain == configs['domains.job'] || domain == configs['domains.club'] || clubInfo?? )) || (forceLogin?? && forceLogin)) >
        <@csselement file='/css/modules/register-pop.css' />
        <#include 'account/account-pop.ftl'/>
        <@popreg defaultPop='common-reg' hasDm=true/>
    <script type="text/javascript">
            <#if !(noShowLogin?? && noShowLogin)>
            forceLogin();
            </#if>
        function forceLogin(){
            var auth = $.cookie('dj_auth_v3');
            if (auth == null || auth.length <= 0) {
                auth = $.cookie('dj_auth');
            }
            var login_tips = $.cookie("login_tips");
            if(auth==null || auth.length <= 0){
                if (login_tips == null) {
                    var currentDate = new Date();
                    var cookieExpiredTime=new Date(currentDate.getFullYear(),currentDate.getMonth(),currentDate.getDate(),currentDate.getHours() + 1,currentDate.getMinutes(),currentDate.getMinutes());
                    $.cookie('login_tips','1',{ expires: cookieExpiredTime, path: '/', domain: '${configs["domains.root"]}' });
                    pop_reg('/','common-reg',true);
                    root_canShowRegFloat =false;
                }
            }
        }
    </script>
    </#if>

    <#if ((domain?? && (!user??) && (domain == configs['domains.job'] || domain == configs['domains.club'] || clubInfo?? ))) >
        <#include 'account/account-reg.ftl'/>
        <@csselement file='/up/login-lay/css/login.css' />
        <@jselement file='/up/login-lay/js/login.js' />
        <@popRegFloat needPassword=(domain == configs['domains.job']) />
    <script type="text/javascript">
        $(function () {
            if (root_canShowRegFloat) {
                forceRegAcount();
            }
            function forceRegAcount() {
                var auth = $.cookie('dj_auth_v3');
                if (auth == null || auth.length <= 0) {
                    auth = $.cookie('dj_auth');
                }
                var reg_tips = $.cookie("__reg_tips");
                if (auth == null || auth.length <= 0) {
                    if (reg_tips == null || reg_tips < 5) {
                        var currentDate = new Date();
                        var cookieExpiredTime = new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate() + 1, 0, 0, 0);
                        var reg_tips_values = 1;
                        if (reg_tips != null) {
                            reg_tips_values = parseInt(reg_tips) + 1;
                        }
                        $.cookie('__reg_tips', reg_tips_values, { expires:cookieExpiredTime, path:'/', domain:'${configs["domains.root"]}' });
                        pop_reg_float();
                        typeof click_b == 'function' && click_b("root_page_noLogin_regFloat");
                    }
                }
            }

            window['forceRegAcount'] = forceRegAcount;

            var auth = $.cookie('dj_auth_v3');
            if (auth == null || auth.length <= 0) {
                auth = $.cookie('dj_auth');
            }
            if (auth == null || auth.length <= 0) {
                typeof click_b == 'function' && click_b("root_page_noLogin_all");
            }
        }, false);

    </script>
    </#if>

    <#if holderDeposit??>
    ${holderDeposit}
    </#if>
</body>
</html>
</#macro>

<#macro dialog>
    <#nested/>
    <#if holderDeposit??>
    ${holderDeposit}
    </#if>
</#macro>