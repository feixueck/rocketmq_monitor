<html>
<head>
    <title>职业档案分享_大街网_年轻人专属的社交招聘平台！</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table border="0" cellpadding="0" cellspacing="0" style="color:#333;font-size:14px;">

    <tr><td style="padding:19px 0 19px 31px;">
        <p style="line-height:28px;padding:0px;margin:0px;"><#if receiver??>${receiver.name!""}，</#if>你好！</p>
        <p style="line-height:28px;padding:0px;margin:0px;">我给你转发了一个<#if jobName?? && jobName?length gt 0>投 <strong>${jobName!""}</strong> 职位的</#if>职业档案。你看看吧。</p>

    </td></tr>
    <#if comments?? && comments?length gt 0>
    <tr><td style="padding:0px 0 0px 31px;">
        <p style="line-height:28px;padding:0px;margin:0px;">“${comments?html}”</p>
    </td></tr>
    </#if>
    <tr><td></td></tr>
    <tr><td style="padding:0px 0 0px 28px;">点击以下链接立即查看：</td></tr>
    <tr><td style="padding:0px 0 0px 28px;">
        <a href="${sharingUrl}" style="line-height:30px; text-align:center;font-weight:bold;font-size:14px;"> ${sharingUrl}</a></td></tr>
    <tr><td style="padding:0px 0 23px 28px; color: #999999;">如无法点击，请将链接拷贝到浏览器地址栏中直接访问。</td></tr>
    <tr><td></td></tr>
    <tr><td style='padding-left:28px'><div style="border-bottom:1px solid #e0e0e0; font-size:12px; line-height:2px;" height="2"></div></td></tr>
    <tr>
        <td style="padding:8px 0px 23px 28px;color: #999999;">
            <p style="padding:0;margin:0;line-height:20px;font-size:13px;">本邮件包含登录信息，<strong>请勿转发他人</strong>。系统自动发出，<strong>请勿直接回复</strong>。<br/>
                如有疑问或建议，可发送邮件至service@dajie.com，或致电400‐813‐1117。</p>
        </td>
    </tr>
</table>
</body>
</html>