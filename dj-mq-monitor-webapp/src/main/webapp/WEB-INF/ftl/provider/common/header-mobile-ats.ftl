<#macro header title subtitle="" ad="none" prev="default">
<#-- 头部 S -->
<#if ad??&&ad!="none">
<div id="app-box"></div>
</#if>
<#if !isDajieApp?? || !isDajieApp>
<header class="dj-header" id="dj-header">
    <div class="title">
    <#if subtitle?? && subtitle?length gt 0>
        <p class="p-head-name">${title!''}</p>
        <p class="p-head-info">${subtitle!''}</p>
    <#else>
    ${title!''}
    </#if>
    </div>
    <div class="item left-item">
         <a href="<#if prev!="default">${prev!''}<#else>javascript:;</#if>" class="icon prev"></a>
    </div>
</header>
</#if>
<#-- 头部 E -->
</#macro>