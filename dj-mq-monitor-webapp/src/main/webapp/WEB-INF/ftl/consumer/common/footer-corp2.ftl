<#macro CopyRight>
&copy;2008-2013&nbsp;大街网&nbsp;|&nbsp;<a href="http://www.miitbeian.gov.cn" target="_blank" style="color: #999999;">京ICP备09028813号-1</a>&nbsp;|&nbsp;京公网安备11010802008965
</#macro>
<#if isSaeConfigContext?? && isSaeConfigContext?is_boolean && isSaeConfigContext>
<div id="footer" class="footer-smart">
    <address>
        <em class="floatright">
            <iframe width="63" scrolling="no" height="24" frameborder="0" src="http://widget.weibo.com/relationship/followbutton.php?language=zh_cn&amp;width=63&amp;height=24&amp;uid=1737637050&amp;style=1&amp;btn=light&amp;dpc=1" border="0" marginheight="0" marginwidth="0" allowtransparency="true"></iframe>
        </em><em class="floatright g6">关注大街网，年轻人专属的社交招聘平台&nbsp;&nbsp;</em><@CopyRight/>
    </address>
</div>
<div id="weibo_footer_public"></div>
<script type="text/javascript" src="http://tjs.sjs.sinajs.cn/open/apps/js/footer.js"></script>
<link rel="stylesheet" href="http://timg.sjs.sinajs.cn/t4/style/css/module/global/out_frame.css" type="text/css"/>
<#else>
<div id="footer">
</div>
<script type="text/javascript">
    var _staticFooter = {
        'mobileBrowser' : <#if isMobileBrowser?? && isMobileBrowser>true<#else>false</#if>
    }
</script>
<@jselement file='/up/autoheader/loadfooter-2013.js'/>
</#if>
<@holder>
<script type="text/javascript"> var _now = new Date(); </script>
<@jselement file='/js/pv.js'/>
</@holder>