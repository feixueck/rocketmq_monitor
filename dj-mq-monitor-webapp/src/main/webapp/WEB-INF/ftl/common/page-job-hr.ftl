<#include "elements.ftl" />
<#include "dialog.ftl" />
<#include "header-test.ftl" />
<#include "assets_compat_custom.ftl" />
<#macro page title="大街网_年轻人专属的社交招聘平台！" assets=[] useheader="default" usefooter="default" currentChannel="NONE" bodyclass="none" menu="0" description="" keywords="" flash=[] crossdomains=[] footerassets=[]>
<!DOCTYPE html>
<html class="${uaOS!''} ${uaBrowser!''}">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=7"/>
    <meta name="saoatech-site-verification" content="N2Y5MzU2M2YyNmVhOTllMGQwYmI4NzAwMTIxYmE2ZDU=" />
    <title><#assign aTitle = title?replace('预见新自己！','年轻人专属的社交招聘平台！','ir')/><#if isSaeConfigContext?? && isSaeConfigContext?is_boolean && isSaeConfigContext><#assign aTitle = aTitle?replace('大街网_预见新自己','职业圈_年轻人专属的社交招聘平台','ir')/></#if>${aTitle}</title>
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
    <#if crossdomains?size!=0>
        <#list crossdomains as domain>
        <iframe src="http://${configs['domains.'+domain]}/crossdomain/proxy.html<#if currentDate??>?t=${currentDate.getTime()}</#if>" id="${domain}-ajax-frame" style="display:none;"></iframe>
        </#list>
    <script type="text/javascript">
        document.domain = '${configs['domains.root']}';
    </script>
    </#if>
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
    'JOB-HR':{'navClass':'dj-employment','description':'','noSubTitle':true}
    }/>
    <#assign realChannel = 'NONE'/>
    <#if ChannelEnum[currentChannel]??><#assign realChannel = currentChannel/></#if>
    <#if useheader != "none">
        <@header vary="${useheader}" menu="${menu}" currentChannel="${realChannel}"/>
    </#if>
<div class="dj-content-wrap <#if useheader = 'default'>${ChannelEnum[realChannel].navClass}</#if>" id="dj-content-wrap">
    <div class="dj-content-inner">
        <#if ChannelEnum[realChannel].noSubTitle>
            <div class="dj-content-shadow">
                <#nested/>
            </div>
        <#else>
            <#if useheader = 'default' && ChannelEnum[realChannel]?? && ChannelEnum[realChannel].navClass!=''>
                <div class="dj-sub-title">
                <#--每个频道的具体内容在header.ftl中控制-->
                    <#if ChannelEnum[realChannel].description?length gt 0><h2>${ChannelEnum[realChannel].description}</h2><#else><h2 style="display:none;"></h2></#if>
                </div>
            </#if>
            <div class="dj-content-shadow">
                <#nested/>
            </div>
        </#if>
    </div>
</div>
    <#if usefooter != "none">
        <#include "footer-test.ftl"/>
    </#if>
    <#if flash?seq_contains("upload") || flash?seq_contains("swfupload")>
        <@jselement file='/lib/flash/swfupload.js' />
    </#if>
    <#if flash?size != 0>
        <@jselement file='/js/jquery.swfajax.js' />
    </#if>
    <#if flash?seq_contains("ajax") || flash?seq_contains("swfajax")>
    <object
            id="swfhttprequest" class="hidden"
            classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
            codebase="http://fpdownload.adobe.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0">
        <param name="movie" value="<@url>/lib/flash/swfhttprequest.swf</@url>"/>
        <param name="allowScriptAccess" value="always"/>
        <embed
                class="hidden"
                src="<@url>/lib/flash/swfhttprequest.swf</@url>"
                allowScriptAccess="always"
                type="application/x-shockwave-flash"
                pluginspage="http://www.adobe.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
        </embed>
    </object>
    </#if>


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
            var auth = $.cookie("dj_auth_v3");
            var login_tips = $.cookie("login_tips");
            if(auth==null || auth.length < 10){
                if (login_tips == null) {
                    var currentDate = new Date();
                    var cookieExpiredTime=new Date(currentDate.getFullYear(),currentDate.getMonth(),currentDate.getDate(),currentDate.getHours() + 1,currentDate.getMinutes(),currentDate.getMinutes());
                    $.cookie('login_tips','1',{ expires: cookieExpiredTime, path: '/', domain: '${configs["domains.root"]}' });
                    pop_reg();
                }
            }
        }
    </script>
    </#if>

    <#if holderDeposit??>
    ${holderDeposit}
    </#if>

    <#list footerassets as file>
        <#if file?ends_with('.js') && !defaultAssets[file]??>
            <@jselement file='${file}' />
        </#if>
    </#list>
</body>
</html>
</#macro>

<#macro dialog>
    <#nested/>
    <#if holderDeposit??>
    ${holderDeposit}
    </#if>
</#macro>