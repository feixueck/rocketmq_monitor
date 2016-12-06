<#include "assets-mobile-ats.ftl"/>
<#include "header-mobile-ats.ftl"/>
<#include "elements.ftl"/>
<#macro page title="大街网_年轻人专属的社交招聘平台！"
headTitle=title
subtitle=""
nocache=true
assets=[]
appbox="none"
ad="none"
useheader="default"
usefooter="default"
prev="default"
home="default"
currentChannel="NONE"
menu="0"
shareimg=""
description="大街网-中国领先的商务社交网络平台，为你轻松打造职场形象、拓展职业人脉、挖掘商业机会、参加行业交流、获得更好工作机会！找工作，找实习，大学生就业 商务社交" keywords="大街网,大街校园招聘,大街招聘网,校园招聘,找工作,找实习,，实习，全职，就业 商务社交"
flash=[]
crossdomains=[]
footerassets=[]
location=[]
homepageUrl="">
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
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <#if request?? && request.getRequestURL()??>
        <meta http-equiv="mobile-agent" content="format=xhtml; url=${request.getRequestURL()}"/>
        <meta http-equiv="Cache-Control" content="no-transform"/>
    </#if>
    <title><#assign aTitle = headTitle?replace('预见新自己！','年轻人专属的社交招聘平台！','ir')/>${aTitle}</title>
    <link rel="shortcut icon" href="<@url>/images/favicon.ico</@url>"/>
    <meta content="${description}" name="description"/>
    <meta content="${keywords}" name="keywords"/>
<#--不自动识别手机号-->
    <meta content="telephone=no" name="format-detection"/>
    <#if shareimg!=""&&shareimg!="http://fs1.dajie.com/corplogo/100x100.png">
        <meta property="og:image" content="${shareimg}">
        <meta property="ogp:image" content="${shareimg}">
    <#else>
        <meta property="og:image"
              content="http://${configs['domains.assets']}/up/dj-mobile/m-dajie/images/share-logo.png">
        <meta property="ogp:image"
              content="http://${configs['domains.assets']}/up/dj-mobile/m-dajie/images/share-logo.png">
    </#if>
    <meta property="og:title" content="${aTitle}">
    <meta property="ogp:title" content="${aTitle}">
    <#if location??>
        <#list location as item>
            <meta name="location" content="${item}">
        </#list>
    </#if>
    <#if appbox != "none">
        <@AssetsImport assets + ["/up/dj-mobile/js/app.js"] />
    <#else>
        <@AssetsImport assets />
    </#if>
    <@jselement file='/js/pv.js' />
    <@jselement file='/up/dj-mobile/m-dajie/js-common/fastclick.js' />
    <script type="text/javascript"
            src="http://${configs['domains.assets']}/${WrapperAssetsWithVersion("/up/dj-mobile/m-dajie/js-common/weixin.js")}"
            data-title="微信分享"></script>
    <@jselement file='/up/dj-mobile/m-dajie/js-common/baiduLightAPP.js' />
</head>
<body<#if isWzp?? && isWzp> class="wzp"</#if>>
<div class="dj-base-wrap">
    <div class="dj-inner">
        <#if request.getAttribute('isJdCorp')??>
            <input type="hidden" name="isJdCorp" id="isJdCorp"
                   value="${request.getAttribute('isJdCorp')?string('true','false')}"/>
        </#if>
        <#if (useheader != "none" && !isWinxinBrower?? && (!isWzp?? || !isWzp)) || forceShow??>
            <@header title=title subtitle=subtitle ad=ad prev=prev/>
        </#if>
        <#nested/>
        <#if !isWzp?? || !isWzp>
            <#if (usefooter != "none" && !isWinxinBrower??) || forceShow??>
                <#include "footer-mobile-ats.ftl"/>
            </#if>
        </#if>
    </div>
    <#if isWzp?? && isWzp>
        <div class="wzp_footer"></div>
    </#if>
</div>
</body>
</html>
</#macro>