<#macro CopyRight>
&copy;2008-2013&nbsp;大街网&nbsp;|&nbsp;京ICP证090373号&nbsp;|&nbsp;京公网安备11010802008965
</#macro>
<#-- 
<div id="footer">
    <address>
        <span class="floatright">
        <a href="http://${configs['domains.www']}/about/">关于</a>

        | <a href="http://s.${configs['domains.root']}/">招聘</a>
        | <a href="http://123.${configs['domains.root']}/">企业</a>
        | <a href="http://city.${configs['domains.root']}/">城市</a>
        | <a href="http://biz.${configs['domains.root']}/">行业</a>
        | <a href="http://${configs['domains.club']}/sub/exam/bs">笔经</a>

        | <a href="http://${configs['domains.club']}/sub/exam/ms">面经</a>
        | <a href="mailto:service@dajie.com">意见反馈</a>
        | <a href="http://${configs['domains.www']}/about/privacy.html">服务与声明</a>
        </span><@CopyRight/>
    </address>
</div> -->
<@holder>
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