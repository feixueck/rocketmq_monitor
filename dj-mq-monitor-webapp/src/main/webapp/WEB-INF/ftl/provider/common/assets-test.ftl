<#assign defaultAssets={
"/css/framework/reset.css":1,
"/css/framework/base.css":1,
"/css/framework/utils.css":1,
"/css/site/header-footer.css":1,
"/css/site/links.css":1,
"/css/site/button.css":1,
"/css/site/structures.css":1,
"/css/site/elements.css":1,
"/css/components/misc.css":1,
"/css/components/dialog.css":1,
"/css/layout/master.css":1,
"/css/modules/feed.css":1,
"/css/modules/login.css":1,
"/css/modules/register.css":1,
"/css/modules/form.css":1,
"/css/modules/statebox.css":1,
"/up/new-v2012/css/fix-global.css":1,
"/up/card-tips/css/card-tips.css":1,
"/up/card-tips/css/change-card.css":1,
"/up/perfect-profile/css/perfect.css":1,
"/lib/jquery/jquery.js":1,
"/js/jquery.interactive.js":1,
"/js/startup.js":1,
"/lib/share.js":1,
"/js/jquery.pickpad.js":1,
"/js/jquery.matchbox.js":1,
"/js/jquery.validate.js":1,
"/lib/jquery/jquery.form.js":1,
"/lib/jquery/jquery.cookie.js":1,
"/js/jquery.inputchecknormal.js":1,
"/js/jquery.freemailcheck.js":1,
"/js/jquery.tips.js":1,
"/up/card-tips/js/change-card.js":1,
"/up/card-tips/js/card-tips.js":1,
"/up/perfect-profile/js/perfect-profile.js":1,
"/lib/min/template.min.js":1
} />
<#if !configs?? || configs['dev.mode']=='1' || (request.queryString?? && request.queryString?length gt 0 && request.queryString?index_of('dajieuedtest=1') gte 0)>
    <#assign shouldMergeAssets=false/>
<#else>
    <#assign shouldMergeAssets=true/>
</#if>
<#if (application.assetsMap)??>
    <#assign assetsDataMap = application.assetsMap/>
<#elseif assetsMap??>
    <#assign assetsDataMap = assetsMap/>
<#else>
    <#assign assetsDataMap = {}/>
</#if>
<#function WrapperAssetsWithVersion assets>
    <#if (!assets?ends_with(".css") && !assets?ends_with(".js")) || !shouldMergeAssets || !(assetsDataMap[assets])??>
        <#return assets/>
    </#if>
    <#if assets?ends_with(".css")>
        <#return assets?substring(0,assets?last_index_of(".css")) + "." + assetsDataMap[assets] + ".css"/>
    <#else>
        <#return assets?substring(0,assets?last_index_of(".js")) + "." + assetsDataMap[assets] + ".js"/>
    </#if>
</#function>
<#macro MergeAssets type assets=[] >
    <#assign isStart=true>
    <#assign concatAssets = ''>
    <#list assets as file>
        <#if file?ends_with('.${type}') && !defaultAssets[file]?? && assetsDataMap[file]??>
            <#if isStart>
                <#assign concatAssets = WrapperAssetsWithVersion(file)/>
                <#assign isStart = false/>
            <#else>
                <#assign concatAssets = concatAssets + ',' + WrapperAssetsWithVersion(file)/>
            </#if>
        </#if>
    </#list>
    <#if concatAssets?length gt 0 && type='css'>
    <link rel="stylesheet" type="text/css" href="<@url>??${concatAssets}</@url>"/>
    <#elseif concatAssets?length gt 0 && type='js'>
    <script type="text/javascript" src="<@url>??${concatAssets}</@url>"></script>
    </#if>
</#macro>
<#macro csselement file="">
    <#if file?length gt 0>
    <link rel="stylesheet" type="text/css" href="<@url>${WrapperAssetsWithVersion(file)}</@url>"/>
    </#if>
</#macro>
<#macro jselement file="">
    <#if file?length gt 0>
    <script type="text/javascript" src="<@url>${WrapperAssetsWithVersion(file)}</@url>"></script>
    </#if>
</#macro>
<#macro AssetsImport assets=[]>
    <#if shouldMergeAssets>
        <@csselement file='/css/dajie.css'/>
        <@MergeAssets type="css" assets=assets/>
        <@jselement file='/js/dajie.js'/>
        <@MergeAssets type='js' assets=assets/>
    <#else>
        <#list defaultAssets?keys as file>
            <#if file?ends_with('.js')>
                <@jselement file='${file}' />
            <#else>
                <@csselement file='${file}' />
            </#if>
        </#list>
        <#list assets as file>
            <#if !defaultAssets[file]?? && (file?ends_with('.js') || file?ends_with('.css'))>
                <#if file?ends_with('.js')>
                    <@jselement file='${file}' />
                <#else>
                    <@csselement file='${file}' />
                </#if>
            </#if>
        </#list>
    </#if>
    <#if requiredJs??>
        <#list requiredJs as file>
            <@jselement file='${file}' />
        </#list>
    </#if>
</#macro>
