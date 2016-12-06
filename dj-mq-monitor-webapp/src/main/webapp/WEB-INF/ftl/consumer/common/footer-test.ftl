<#macro CopyRight>
&copy;2008-2012&nbsp;大街网&nbsp;|&nbsp;京ICP证090373号&nbsp;|&nbsp;京公网安备11010802008965
</#macro>
<#if isSaeConfigContext?? && isSaeConfigContext?is_boolean && isSaeConfigContext>
<div id="footer" class="footer-smart">
    <address>
        <em class="floatright">
            <iframe width="63" scrolling="no" height="24" frameborder="0"
                    src="http://widget.weibo.com/relationship/followbutton.php?language=zh_cn&amp;width=63&amp;height=24&amp;uid=1737637050&amp;style=1&amp;btn=light&amp;dpc=1"
                    border="0" marginheight="0" marginwidth="0" allowtransparency="true"></iframe>
        </em><em class="floatright g6">关注大街网，年轻人专属的社交招聘平台&nbsp;&nbsp;</em><@CopyRight/>
    </address>
</div>
<div id="weibo_footer_public"></div>
<script type="text/javascript" src="http://tjs.sjs.sinajs.cn/open/apps/js/footer.js"></script>
<#else>
<div id="footer">
    <address>
        <span class="floatright">
        <a href="http://${configs['domains.www']}/about/">关于</a>

        | <a href="http://<#if isMobileBrowser?? && isMobileBrowser>${configs['domains.mobile']}<#else>${configs['domains.www']}/html/phone/index-test.html</#if>">手机版</a>
        | <a href="http://s.${configs['domains.root']}/">招聘</a>
        | <a href="http://123.${configs['domains.root']}/">企业</a>
        | <a href="http://city.${configs['domains.root']}/">城市</a>
        | <a href="http://biz.${configs['domains.root']}/">行业</a>
        | <a href="http://${configs['domains.club']}/sub/exam/bs">笔经</a>

        | <a href="http://${configs['domains.club']}/sub/exam/ms">面经</a>
        | <a href="http://www.dajie.com/account/feedback">意见反馈</a>
        | <a href="http://${configs['domains.www']}/about/privacy.html">服务与声明</a>
        </span><@CopyRight/>
    </address>
</div>
</#if>
<@holder>
<script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-8089983-1']);
    _gaq.push(['_addOrganic', 'baidu', 'word']);
    _gaq.push(['_addOrganic', 'soso', 'w']);
    _gaq.push(['_addOrganic', '3721', 'name']);
    _gaq.push(['_addOrganic', 'yodao', 'q']);
    _gaq.push(['_addOrganic', 'vnet', 'kw']);
    _gaq.push(['_addOrganic', 'sogou', 'query']);
    _gaq.push(['_setDomainName', '.dajie.com']);

    _gaq.push(['_trackPageview']);
        <#if user??>_gaq.push(['_setVar', '${(user.uid)!0}']);</#if>
    (function () {
        var ga = document.createElement('script');
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        ga.setAttribute('async', 'true');
        document.documentElement.firstChild.appendChild(ga);
    })();
</script>
<script src='http://js.dajie.com/pv.2010061801.js' type='text/javascript'></script>
<script type="text/javascript">
    var _now = new Date();
    var _style_count = $('link[rel=stylesheet]').length;
    var _script_count = $('script[src]').length;
    var url = "http://st.dajie.com/performance.st";
    var i = new Image(1, 1);
    try {
        i.src = url + "?h=" + (_body_start - _head_start) + "&b=" + (_now - _body_start) + "&s=" + _style_count + "&j=" + _script_count;
        i.onload = function () {
            _uVoid();
        }
    } catch (e) {
    }
</script>
</@holder>