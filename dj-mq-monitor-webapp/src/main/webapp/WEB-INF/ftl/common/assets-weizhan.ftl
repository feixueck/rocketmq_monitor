<#assign defaultAssets={
} />
<#assign dajieUedTest=false/>
<#if request.queryString?? && request.queryString?length gt 0 && request.queryString?index_of('dajieuedtest=1') gte 0>
    <#assign dajieUedTest=true/>
</#if>
<#--默认启用master_dassets.dajieimg.com作为调试域名，这将会访问开发环境master分支的静态文件；
如果想访问本地资源，需要启用localAssets参数。assetsBranch可以访问开发环境中别的分支的静态资源-->
<#assign assetsBranch = 'master'/>
<#if request.getParameter('localAssets')?? && request.getParameter('localAssets')?length gt 0>
    <#assign assetsBranch='ui'/>
</#if>
<#if assetsBranch != 'ui' && request.getParameter('assetsBranch')?? && request.getParameter('assetsBranch')?length gt 0>
    <#assign assetsBranch=request.getParameter('assetsBranch')/>
</#if>
<#if dajieUedTest>
    <#assign shouldMergeAssets=false/>
<#else>
    <#if ((configs['dajie_environment'])?? && configs['dajie_environment'] == 'dev') || ((configs['assets.env'])?? && configs['assets.env'] == 'dev') >
        <#assign shouldMergeAssets=false/>
    <#else>
        <#assign shouldMergeAssets=true/>
    </#if>
</#if>
<#if (configs['dajie_environment'])?? && configs['dajie_environment'] == 'product'>
    <#assign shouldCheckAssetsVersion = true/>
<#else>
    <#assign shouldCheckAssetsVersion = false/>
</#if>
<#if (application.assetsMap)??>
    <#assign assetsDataMap = application.assetsMap/>
<#elseif assetsMap??>
    <#assign assetsDataMap = assetsMap/>
<#else>
    <#assign assetsDataMap = {}/>
</#if>
<#function AssetsUrl file="">
<#--用macro宏会导致空格的出现，所以换成function-->
    <#assign assetsDomain = "assets.dajieimg.com"/>
    <#if configs?? && (configs['domains.assets'])??><#assign assetsDomain = configs['domains.assets']/></#if>
    <#if dajieUedTest?? && dajieUedTest?is_boolean && dajieUedTest><#assign assetsDomain = assetsBranch + "_dassets.dajieimg.com"/></#if>
    <#if file?index_of("/") == 0><#return "https://${assetsDomain}${file}"/><#else> <#return "https://${assetsDomain}/${file}"/></#if>
</#function>
<#function WrapperAssetsWithVersion assets>
    <#if (!assets?ends_with(".css") && !assets?ends_with(".js")) || !shouldMergeAssets || !(assetsDataMap[assets])??>
        <#return assets/>
    </#if>
    <#if assetsDataMap[assets]?is_number><#assign assetsVersion=assetsDataMap[assets]?c/><#else><#assign assetsVersion=assetsDataMap[assets]/></#if>
    <#if assets?ends_with(".css")>
        <#return assets?substring(0,assets?last_index_of(".css")) + "." + assetsVersion + ".css"/>
    <#else>
        <#return assets?substring(0,assets?last_index_of(".js")) + "." + assetsVersion + ".js"/>
    </#if>
</#function>
<#macro MergeAssets type assets=[] >
    <#assign isStart=true>
    <#assign concatAssets = ''>
    <#list assets as file>
        <#if file?ends_with('.${type}') && !defaultAssets[file]?? && (assetsDataMap[file]?? || !shouldCheckAssetsVersion)>
            <#if isStart>
                <#assign concatAssets = WrapperAssetsWithVersion(file)/>
                <#assign isStart = false/>
            <#else>
                <#assign concatAssets = concatAssets + ',' + WrapperAssetsWithVersion(file)/>
            </#if>
        </#if>
    </#list>
    <#if concatAssets?length gt 0 && type='css'>
    <link rel="stylesheet" type="text/css" href="${AssetsUrl("??${concatAssets}")}"/>
    <#elseif concatAssets?length gt 0 && type='js'>
    <script type="text/javascript" src="${AssetsUrl("??${concatAssets}")}"></script>
    </#if>
</#macro>
<#macro csselement file="">
    <#if file?length gt 0>
    <link rel="stylesheet" type="text/css" href="${AssetsUrl("${WrapperAssetsWithVersion(file)}")}"/>
    </#if>
</#macro>
<#macro jselement file="">
    <#if file?length gt 0>
    <script type="text/javascript" src="${AssetsUrl("${WrapperAssetsWithVersion(file)}")}"></script>
    </#if>
</#macro>
<#macro AssetsImport assets=[]>
    <#if !unIncludeDefaultAssets??>
        <#assign newAssets = [
        "/up/dj-mobile/school-time/css/reset.css",
        "/up/dj-mobile/weizhan/css-common/frame.css",
        "/up/dj-mobile/m-dajie/css-common/tool.css",
        "/up/dj-mobile/m-dajie/css-common/button.css",
        "/up/dj-mobile/vcard/lib/zepto.js",
        "/up/dj-mobile/m-dajie/js-common/base.js",
        "/up/dj-mobile/js/touch.js",
        "/up/dj-mobile/js/zepto.cookie.js"
        ] + assets/>
    <#else>
        <#assign newAssets = assets/>
    </#if>
    <#if shouldMergeAssets>
        <@MergeAssets type='css' assets=newAssets/>
        <@MergeAssets type='js' assets=newAssets/>
    <#else>
        <#list defaultAssets?keys as file>
            <#if file?ends_with('.js')>
                <@jselement file='${file}' />
            <#else>
                <@csselement file='${file}' />
            </#if>
        </#list>
        <#list newAssets as file>
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