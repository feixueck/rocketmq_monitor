<div id="profession-dialog-content" class="dialog-content ">
    <#if professionType?? && professionType == "radio" >
        <#assign dialogContentName = "position-profession" >
    <#elseif professionType?? && professionType == "checkbox" >
        <#assign dialogContentName = "position-profession-checkbox" >
    <#else>
        <#assign dialogContentName = "profession" >
    </#if>
    <#include "dialog-content.ftl" >
</div>