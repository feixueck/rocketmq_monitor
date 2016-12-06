<footer class="dj-footer" id="dj-footer">
    <a href="<#if homepageUrl?? && homepageUrl?length gt 0>${homepageUrl}<#else>http://${configs['domains.mobile']}/job/index</#if>">返回首页</a>
    <a href="http://${configs['domains.mobile']}/about/app">客户端</a>
    <a href="http://${configs['domains.www']}" class="J_PC_VERSION">电脑版</a>
    <a href="http://${configs['domains.mobile']}/about/faq">帮助</a>
    <a href="#">回到顶部</a>
    <p>&copy;2008-${currentDate?string("yyyy")} dajie.com</p>
</footer>
<script type="text/javascript">
    $('.J_PC_VERSION').live('click',function(e){
        e.preventDefault();
        var url = $(this).attr('href');
        if (url == null || url == '#' || url == "") {
            url = "http://${configs['domains.www']}";
        }
        $.ajax({
            type: "GET",
            url:  "http://${configs['domains.mobile']}/account/convertpc",
            success: function (r) {
                window.location.href = url;
            }
        });
    });
</script>