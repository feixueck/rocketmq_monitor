<#include "elements.ftl" />
<#include "dialog.ftl" />
<#include "header.ftl" />
<#include "assets_compat_custom.ftl" />
<#macro pagewx title="大街网_年轻人专属的社交招聘平台！" assets=[] static={} useheader="default" usefooter="default" currentChannel="NONE" bodyclass="none" menu="0" description="" keywords="" flash=[] crossdomains=[] footerassets=[] nofollow="0" viewport="0" metaExtend=[] linkExtend=[]>
<!DOCTYPE html>
<html class="${uaOS!''} ${uaBrowser!''}">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <#if !(assets?? && assets?size gt 0 && assets?seq_contains('/css/site/no-ie7.css'))>
        <meta http-equiv="x-ua-compatible" content="ie=7"/>
    </#if>
    <meta name="saoatech-site-verification" content="N2Y5MzU2M2YyNmVhOTllMGQwYmI4NzAwMTIxYmE2ZDU=" />
    <title><#assign aTitle = title?replace('预见新自己！','年轻人专属的社交招聘平台！','ir')/><#if isSaeConfigContext?? && isSaeConfigContext?is_boolean && isSaeConfigContext><#assign aTitle = aTitle?replace('大街网_预见新自己','职业圈_年轻人专属的社交招聘平台','ir')/></#if>${aTitle?html}</title>
    <link rel="shortcut icon" href="${AssetsUrl("/images/favicon.ico")}" />
    <meta content="${description}" name="description"/>
    <meta content="${keywords}" name="keywords"/>
    <#if viewport == "1">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    </#if>
    <#if nofollow=="1">
        <meta name="robots" content="nofollow" />
    </#if>
    <#if metaExtend?? &&metaExtend?size gt 0>
        <#list metaExtend as metaItem>
            <#if metaItem?is_hash><meta <#list metaItem?keys as key><#if metaItem[key]??>${key}="${metaItem[key]}"</#if> </#list>/></#if>
        </#list>
    </#if>
    <#if linkExtend?? &&linkExtend?size gt 0>
        <#list linkExtend as linkItem>
            <#if linkItem?is_hash><link <#list linkItem?keys as key><#if linkItem[key]??>${key}="${linkItem[key]}"</#if> </#list>/></#if>
        </#list>
    </#if>
    <script type="text/javascript">
        var _head_start = new Date();<#if currentDate??>var _current_date = '${currentDate?string('yyyy-MM-dd HH:mm:ss')}';</#if>
            <#if (request.djBaseCSRFToken)??>
                <#assign tmpDjBaseCSRFToken = request.djBaseCSRFToken/>
            <#elseif djBaseCSRFToken??>
                <#assign tmpDjBaseCSRFToken = djBaseCSRFToken/>
            <#else>
                <#assign tmpDjBaseCSRFToken = ""/>
            </#if>
        var CSRFToken = '${tmpDjBaseCSRFToken}';
    </script>
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <@AssetsImport assets />
    <@jselement file="/static/libs/seajs/sea.js"/>
    <script id="djnew" type="text/javascript" src="${AssetsUrl("${WrapperAssetsWithVersion('/static/libs/street/street.js')}")}"></script>
    <#if static?? && static?size gt 0>
        <#include "seajs-config.ftl"/>
        <@SeaConfig static=static/>
    </#if>
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
<div id="J_djResourcesVersion" style="display: none;">
    <input type="hidden" name="env" value="${configs['deploy.env']!''}"/>
    <input type="hidden" name="bigVersion" value="${configs['assets.major.version']!''}"/>
    <#if assetsMap??>
        <input type="hidden" name="rollbackId" value="${assetsMap['//rollbackId']!''}"/>
    </#if>
</div>
    <#assign ChannelEnum = {
    'NONE':{'navClass':'','description':'','noSubTitle':false},
    'HOME':{'navClass':'dj-index','description':'','noSubTitle':false},
    'PROFILE':{'navClass':'dj-profile-mini','description':'','noSubTitle':false},
    'CARD':{'navClass':'dj-networks clearfix','description':'人&nbsp;脉','noSubTitle':false,'enName':'CONTACT'},
    'JOB':{'navClass':'dj-job','description':'&nbsp;','noSubTitle':false},
    'RESUME':{'navClass':'dj-resume','description':'简&nbsp;历','noSubTitle':false},
    'CORP':{'navClass':'','description':'','noSubTitle':true},
    'ASK':{'navClass':'dj-ask','description':'问&nbsp;答<span style="font-size:10px; vertical-align:baseline; position:relative; top:-20px; left:10px; font-family:tahoma">BETA</span>','noSubTitle':false},
    'NOTICE':{'navClass':'dj-notice','description':'通&nbsp;知','noSubTitle':false},
    'INVITATION-BOX':{'navClass':'dj-notice','description':'邀约箱','noSubTitle':false},
    'SETTING':{'navClass':'dj-account','description':'设&nbsp;置','noSubTitle':false},
    'CIRCLE':{'navClass':'dj-job-circle','description':'职业圈','noSubTitle':true,'enName':'CIRCLE'},
    'CIRCLE-SEARCH':{'navClass':'dj-job-circle-sch','description':'职业圈','noSubTitle':false},
    'CIRCLE-GUIDE':{'navClass':'dj-job-circle-reg','description':'职业圈','noSubTitle':false},
    'CIRCLE-NEW-GUIDE':{'navClass':'dj-job-circle-hi201','description':'职业圈','noSubTitle':false},
    'CLUB':{'navClass':'dj-club','description':'名企招聘','noSubTitle':false},
    'IDENTIFY':{'navClass':'dj-job-value-site','description':'','noSubTitle':false},
    'JOB-HR':{'navClass':'dj-employment','description':'','noSubTitle':true},
    'JOB-RECRUITER-PRO':{'navClass':'dj-job dj-recruiter-pro','description':'招聘<em>RECRUITER<span class="status">付费版</span></em>','noSubTitle':false},
    'JOB-RECRUITER':{'navClass':'dj-job dj-recruiter','description':'招聘<em>RECRUITER</em>','noSubTitle':false},
    'ENTERPRISE':{'navClass':'dj-enterprise','description':'','noSubTitle':true},
    'GROUP':{'navClass':'dj-group','description':'圈子','noSubTitle':false,'enName':'Group<span class="status">Beta</span>'},
    'SKILLGO':{'navClass':'dj-skillgo','description':'技能闯关','noSubTitle':true},
    'TALENT':{'navClass':'dj-job','description':'人才库<em>TALENT&nbsp;POOL</em>','noSubTitle':false},
    'COMPETITOR':{'navClass':'dj-same-job','description':'行业库','noSubTitle':true}
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
                    <#if ChannelEnum[realChannel].description?length gt 0><h2>${ChannelEnum[realChannel].description}<#if (ChannelEnum[realChannel].enName)??><em>${ChannelEnum[realChannel].enName}</em></#if></h2><#else><h2 style="display:none;"></h2></#if>
                </div>
            </#if>
            <div class="dj-content-shadow">
                <#nested/>
            </div>
        </#if>
    </div>
</div>
    <#if usefooter != "none">
        <#include "footer.ftl"/>
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
        <param name="movie" value="${AssetsUrl("/lib/flash/swfhttprequest.swf")}"/>
        <param name="allowScriptAccess" value="always"/>
        <embed
                class="hidden"
                src="${AssetsUrl("/lib/flash/swfhttprequest.swf")}"
                allowScriptAccess="always"
                type="application/x-shockwave-flash"
                pluginspage="http://www.adobe.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
        </embed>
    </object>
    </#if>

<script type="text/javascript">
    var root_canShowRegFloat = true;
    $(function(){
        var is_login = $.cookie('dj_auth') != null || $.cookie('dj_auth_v3') != null;
    });
</script>
    <#if !(user?? || loginUser??) >
        <@csselement file='/up/login-lay/css/login.css' />
    <#-- 控制右下角弹出窗口出现 notShowRightFooter=true不出现-->
        <#if !(notShowRightFooter?? && notShowRightFooter)><#include 'account/account-reg.ftl'/></#if>
    <#--控制定制浮层出现   notShowCustomReg=true不出现-->
        <#if !(notShowCustomReg?? && notShowCustomReg)><#include 'account/floataccount-pop-sea.ftl'/></#if>
    <#--<@csselement file='/up/autoheader/css/guanke-bottom-float.css' />-->
    <#--<@jselement file="/up/autoheader/js/guanke-bottom-float.js"/>-->
    <#-- <@jselement file="/up/autoheader/js/guanke-whole-float.js"/>-->
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