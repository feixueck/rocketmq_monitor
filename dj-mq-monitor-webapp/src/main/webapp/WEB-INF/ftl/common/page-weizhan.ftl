<#include "assets-weizhan.ftl"/>
<#include "header-weizhan.ftl"/>
<#include "elements.ftl"/>
<#function replaceImage imgUrl>
    <#assign imgUrl1 = imgUrl?replace("http.*com", "http://fs.m.dajie.com/image", "r")/>
    <#if imgUrl1?index_of('/n/corp_square_logo') gt 0 && imgUrl1?index_of("_c.") gt 0 >
        <#return imgUrl1?replace("_c.","_h.")/>
    </#if>
    <#return imgUrl1/>
</#function>
<#function WordLimit srcString maxLength>
    <#if srcString?length lte maxLength>
        <#return srcString/>
    <#else>
        <#return srcString?substring(0, maxLength - 1) + '...'/>
    </#if>
</#function>
<#macro page title="大街网_年轻人专属的社交招聘平台！"
headTitle=title nocache=true assets=[] 
useheader="default"
usefooter="default" 
useleftnav="default" 
leftnavenable="none" 
prev="default" 
home="default" 
currentChannel="NONE" 
menu="0" 
rightbutton="none" 
righturl="none"
searchButton="none"
doNotShare=true
shareimg=""
shareUrl=""
shareTitle=""
shareDescription=""
description="大街网-中国领先的商务社交网络平台，为你轻松打造职场形象、拓展职业人脉、挖掘商业机会、参加行业交流、获得更好工作机会！找工作，找实习，大学生就业 商务社交"
keywords="大街网,大街校园招聘,大街招聘网,校园招聘,找工作,找实习,，实习，全职，就业 商务社交" flash=[] crossdomains=[] footerassets=[]>
<#if nocache && response??>
    ${response.setHeader("Pragma","no-cache")}
    ${response.setHeader("Cache-Control","no-cache,no-transform")}
    ${response.setDateHeader("Expires", 0)}
<#elseif response??>
    ${response.setHeader("Cache-Control","no-transform")}
</#if>
<!DOCTYPE html>
<html>
<head>
    <meta name="referrer" content="always"/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <meta http-equiv="mobile-agent" content="format=xhtml; url=${request.getRequestURL()}" />
    <#if nocache>
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <#else>
    <meta http-equiv="Cache-Control" content="no-transform" />
    </#if>
    <title><#assign aTitle = headTitle?replace('预见新自己！','年轻人专属的社交招聘平台！','ir')/>${aTitle}</title>
    <link rel="shortcut icon" href="<@url>/images/favicon.ico</@url>" />
    <meta content="${description}" name="description"/>
    <meta content="${keywords}" name="keywords"/>
    <meta property="og:image" content="<#if shareimg?? && shareimg?length gt 0>${replaceImage(shareimg)}<#else>${replaceImage(defaultCorpLogo)}</#if>">
    <meta property="og:title" content="${shareTitle!(aTitle!"")}">
    <meta property="og:description" content="${shareDescription!""}">
    <meta property="og:url" content="${shareUrl!(request.getRequestURL()!"")}">
    <#if dnsPrefetchDomains?? && dnsPrefetchDomains?is_collection && dnsPrefetchDomains?size gt 0>
        <#list dnsPrefetchDomains as dnsPrefetchDomain>
            <link href="//${dnsPrefetchDomain}" rel="dns-prefetch">
        </#list>
        <@jselement file='/js/dns-prefetch.js'/>
        <script>typeof(dns_prefetech) != 'undefined' && dns_prefetech.init();</script>
    </#if>
    <meta content="webkit" name="renderer">
    <@AssetsImport assets />
    <script type="text/javascript">
        $.domains = {
            www : "${configs['domains.www']}",
            weizhan : "${configs['domains.weizhan']}",
            assets : "${configs['domains.assets']}"
        };
    </script>
    <#if isWeiXinBrowser?? && isWeiXinBrowser>
        <script type="text/javascript">
            var js_sdk_config = {
                "timestamp": "${wxTimestamp!0}",
                "appId": "${wxAppId!""}",
                "nonceStr": "${wxNonceStr!""}",
                "signature": "${wxSignature!""}"
            };
        </script>
        <script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
        <@jselement file="/up/dj-mobile/caipital_club/js/common/weixin.js"/>
        <#if doNotShare?? && doNotShare>
        <script type="text/javascript">
            Weixin && Weixin.hideOptionMenu();
        </script>
        </#if>
    </#if>
</head>
<body>
<div class="dj-base-wrap">
    <div class="dj-inner">
        <#if useheader != "none">
            <@header title=title prev=prev home=home leftnavenable=leftnavenable rightbutton=rightbutton righturl=righturl searchButton=searchButton/>
        </#if>
        <#nested/>
        <#if usefooter != "none">
            <#include "footer.ftl"/>
        </#if>
    </div>
</div>
<@jselement file='/js/pv.js' />
</body>
</html>
</#macro>