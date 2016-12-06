<#--vary 包含'default','compact'两种值，分别对应大导航与小导航-->
<#assign isSaeConfigContext=false/>
<#macro header vary="default" menu="1" currentChannel="NONE">
    <#if vary != 'default' && vary != 'compact'><#assign vary='default'/></#if>
    <#if loginUser??>
        <@jselement file="/up/autoheader/loadheader-2013.js"/>
    </#if>
    <div id="dj-header-wrap" class="dj-header-wrap">
        <div id="header-fix" class="dj-header-fix">
        <#if !loginUser?? && textAssetsMap??>
            <#if vary == 'compact'>
                <#assign baseNavType = 1/>
            <#else>
                <#assign baseNavType = 0/>
            </#if>
            <#list textAssetsMap?keys as key>
                <#if key?string == baseNavType?string>
                    <@nec textAssetsMap.get(key)!''/>
                </#if>
            </#list>
        </#if>
        </div>
    </div>
    <script type="text/javascript">
        var is_login = $.cookie('dj_auth') != null || $.cookie('dj_auth_v3') != null; //必须是全局变量，别的项目有用
        window['is_login'] = is_login;
        _staticHeader = {
            isMini : <#if vary == 'default'>false<#else>true</#if>,
            isC : false,
            isRecruit : <#if vary == 'recruit'>true<#else>false</#if>,
            currentChannel: '${currentChannel!"NONE"}',
            isBusinessCorp: <#if isBusinessCorp?? && isBusinessCorp>true<#else>false</#if>
        };
        <#if loginUser??>
            G_dj_head_getHeader();
        </#if>
    </script>
</#macro>