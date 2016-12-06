<#if cid??>
    <#if jid??>
    公司id： ${cid}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    职位id： ${jid}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <#if email??>
    举报人邮箱： ${email}<br/><br/></#if>
    <#else>
    公司id： ${cid}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <#if email??>
    举报人邮箱： ${email}<br/><br/></#if>
    </#if>
</#if>

<#if info??>
    举报信息： ${info}<br/>
</#if>
<#if other??>
    举报内容： ${other}<br/>
</#if>