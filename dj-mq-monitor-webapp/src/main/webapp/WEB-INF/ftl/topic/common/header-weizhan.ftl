<#macro header title prev="default" home="default" leftnavenable="none" rightbutton="none" righturl="none">
<!-- 头部 S -->
<header class="dj-header" id="dj-header">
    <div class="title">${title!''}</div>
    <div class="item left-item">
    <#if leftnavenable!="none">
        <a href="javascript:;" class="icon menu"></a>
    <#else>
         <a href="javascript:;" class="icon prev"></a>
    </#if>
    <#if rightbutton??&&rightbutton!="none">
    <div class="item right-item">
        <a href="
        <#if righturl??&&righturl!="none">
        ${righturl}
        <#else>
        #
        </#if>">${rightbutton}</a>
      </div>
    </div>
    </#if>
</header>
<!-- 头部 E -->
</#macro>