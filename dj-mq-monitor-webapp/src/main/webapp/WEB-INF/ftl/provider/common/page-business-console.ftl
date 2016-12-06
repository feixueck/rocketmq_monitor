<#include "elements.ftl" />
<#include "dialog.ftl" />
<#include "assets_compat_custom.ftl" />
<#macro page title="商业产品管理系统！" assets=[] bodyclass="none" description="" keywords="">
<!DOCTYPE html>
<html class="${uaOS!''} ${uaBrowser!''}">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=7"/>
    <meta name="saoatech-site-verification" content="N2Y5MzU2M2YyNmVhOTllMGQwYmI4NzAwMTIxYmE2ZDU=" />
    <title>${title}</title>
    <link rel="shortcut icon" href="<@url>/images/favicon.ico</@url>" />
    <meta content="${description}" name="description"/>
    <meta content="${keywords}" name="keywords"/>
    <script type="text/javascript">var _head_start = new Date();<#if currentDate??>var _current_date='${currentDate?string('yyyy-MM-dd HH:mm:ss')}';</#if></script>
    <@AssetsImport assets />
    <script type="text/javascript">
        $.domains = {
            www : "${configs['domains.www']}",
            assets : "${configs['domains.assets']}"
        };
        <#if uaBrowser?? && uaBrowser=='ua-ie6'>
        try {document.execCommand('BackgroundImageCache', false, true);} catch(e) {}
        </#if>
    </script>
</head>
<body <#if bodyclass != "none">class="${bodyclass}"</#if>>
<script type="text/javascript">var  _body_start = new Date();</script>

<#nested/>
<#include "footer-business-console.ftl"/>

<#if holderDeposit??>
${holderDeposit}
</#if>
</body>
</html>
</#macro>
