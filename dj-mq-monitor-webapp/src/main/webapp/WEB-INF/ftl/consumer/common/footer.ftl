<div id="footer">
    <#if textAssetsMap??>
        <#assign defaultFooterType = 4/>
        <#list textAssetsMap?keys as key>
            <#if key?string == defaultFooterType?string>
                <@nec textAssetsMap.get(key)!''/>
            </#if>
        </#list>
    </#if>
</div>
<script type="text/javascript">
    var _staticFooter = {
        'mobileBrowser' : <#if isMobileBrowser?? && isMobileBrowser>true<#else>false</#if>
    }
</script>
<@holder>
<@jselement file='/js/pv.js'/>
</@holder>