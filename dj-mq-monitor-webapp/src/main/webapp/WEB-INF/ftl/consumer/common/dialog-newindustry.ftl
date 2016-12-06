<div id="industry-dialog-content" class="dialog-content picksection">
<#if (industryType?? && industryType == "radio") || (d?? && d.industryType?? && d.industryType == "radio")>
    <#assign dialogContentName = "newindustryradio"/>
<#elseif (industryType?? && industryType == "checkbox") || (d?? && d.industryType?? && d.industryType == "checkbox")>
    <#assign dialogContentName = "newindustrychechbox"/>
<#else>
    <#assign dialogContentName = "newindustry"/>
</#if>

<#include "dialog-content.ftl" >
</div>