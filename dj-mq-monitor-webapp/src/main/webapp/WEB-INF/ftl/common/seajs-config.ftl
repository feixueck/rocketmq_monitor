<#macro SeaConfig static>
    <#if static?? && static?size gt 0>
        <#assign dajieUedTest=false/>
        <#if (request.queryString)?? && request.queryString?length gt 0 && request.queryString?index_of('dajieuedtest=1') gte 0>
            <#assign dajieUedTest=true/>
        </#if>
    <#--默认启用master_dstatic.dajieimg.com作为调试域名，这将会访问开发环境master分支的静态文件；
    如果想访问本地资源，需要启用localAssets参数。assetsBranch可以访问开发环境中别的分支的静态资源-->
        <#assign assetsBranch = 'master'/>
        <#if request.getParameter('localAssets')?? && request.getParameter('localAssets')?length gt 0>
            <#assign assetsBranch='ui'/>
        </#if>
        <#if assetsBranch != 'ui' && request.getParameter('assetsBranch')?? && request.getParameter('assetsBranch')?length gt 0>
            <#assign assetsBranch=request.getParameter('assetsBranch')/>
        </#if>
        <#assign staticDomain = "static.dajieimg.com"/>
        <#if configs?? && (configs['domains.static'])??><#assign staticDomain = configs['domains.static']/></#if>
        <#if dajieUedTest?? && dajieUedTest?is_boolean && dajieUedTest><#assign staticDomain = assetsBranch + "_dstatic.dajieimg.com"/></#if>
    <script type="text/javascript">
        var seaConfig = {
            'base': '<#if static.base?? && static.base?length gt 0>${static.base}<#else>https://${staticDomain}</#if>'
            <#if static.alias?? && static.alias?size gt 0 && static.alias?is_hash_ex>
                , 'alias': {
                <#list static.alias?keys as key>
                    <#assign staticValue= static.alias[key]/>
                    <#if staticValue?ends_with('.css')>
                        <#assign staticValuePrefix=staticValue?substring(0,staticValue?last_index_of(".css"))/>
                    <#elseif staticValue?ends_with('.js')>
                        <#assign staticValuePrefix=staticValue?substring(0,staticValue?last_index_of(".js"))/>
                    <#else>
                        <#assign staticValuePrefix=staticValue/>
                    </#if>
                    <#assign assetsPath='/static/' + staticValue/>
                    <#if assetsDataMap[assetsPath]?? && shouldMergeAssets>
                        '${key}': '${staticValuePrefix}.${assetsDataMap[assetsPath]}.<#if staticValue?ends_with('.css')>css<#else>js</#if>'<#if key_has_next>,</#if>
                    <#else>
                        '${key}': '${staticValue}'<#if key_has_next>,</#if>
                    </#if>
                </#list>
            }
            </#if>
            <#if static.preload?? && static.preload?size gt 0 && static.preload?is_sequence>
                , 'preload': [<#list static.preload as item>"${item}"<#if item_has_next>,</#if></#list>]
            </#if>
        };
        seajs.config(seaConfig);
        street.sea.insertStyle(seaConfig);
    </script>
    </#if>
</#macro>