<#macro sub_email email>
    <#assign atIndex = email?index_of('@') />
    <#assign name = email?substring(0, atIndex) />
    <#assign host = email?substring(atIndex+1) />
    <#if name?length gt 20>
        <#assign name = name?substring(0, 5) + '...' + name?substring(name?length-5) />
    </#if>
    <#if host?length gt 20>
        <#assign host = host?substring(0, 5) + '...' + host?substring(host?length-5) />
    </#if>
    ${name}@${host}
</#macro>