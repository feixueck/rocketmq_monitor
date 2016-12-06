<#macro page_corp title="大街网_年轻人专属的社交招聘平台！" nofollow="0" ispro="0" corp_assets=[] static={} useheader="compact" usefooter="default" currentChannel="CORP" bodyclass="none" menu="0" description="" keywords="" flash=[] crossdomains=[] footerassets=[] viewport="0">
    <@page  title="${title?replace('<|>|\"','')}"
    assets=[
    "/images/favicon.ico",
    "/up/corporation/css/global.css",
    "/bd/bd_lib/scripts/plug/raphael-min.js",
    "/bd/bd_lib/scripts/plug/morris.js",
    "/up/corporation/js/dj_corp_config.js",
    "/up/corporation/js/script.js"]
    useheader="${useheader}"
    currentChannel="CORP"
    description="${description}"
    keywords="${keywords}"
    nofollow="${nofollow}"
    viewport="${viewport}"
    >
        <#assign needDefaultAssets = false/>
        <@AssetsImport corp_assets false />
	<#if crossdomains?size!=0>
        <#list crossdomains as domain>
        <iframe src="http://${configs['domains.'+domain]}/crossdomain/proxy.html<#if currentDate??>?t=${currentDate.getTime()}</#if>" id="${domain}-ajax-frame" style="display:none;"></iframe>
        </#list>
    <script type="text/javascript">
        document.domain = '${configs['domains.root']}';
    </script>
    </#if>
    <!-- 这里往上是大街框架 -->
    <div class="cor-wrap custom-pink">
    <#if ispro == "0">
        <#include "corp_header.ftl">
    </#if>
        <!-- custom-pink - 定制样式 -->
        <div class="cor-wrap-inner content-block">
    <#if ispro == "1">
        <#include "corp_header_pro.ftl">
 	</#if>
            <#nested/>
        </div>
    </div>
    <!-- 这里再下面是大街框架 -->

    </@page>
</#macro>


