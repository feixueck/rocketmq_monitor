<@page currentChannel="NONE"  title="导航切换_大街网_年轻人专属的社交招聘平台！" useheader="compact"
assets=["/up/job-v2/css/common.css","/up/job-v2/css/job-v2.css","/up/job-v2/css/no-banner.css","/up/job-v2/css/intercept.css"] >


<div id="content">

    <!-- content begin -->
    <div class="dj-section">
        <div id="intercept" class="job-v2-boxshadow">
            <img src="http://${configs['domains.assets']}/up/job-v2/images/intercept.jpg" id="intercept-pic" width="196"/>

            <div id="intercept-con">
                <#if isCampus?? && isCampus>
                    <#assign description = "Campus" />
                <#else >
                    <#assign description = "Pro" />
                </#if>
                <h3>哎呦！该内容仅在${description}版大街网中可用哦，</h3>
                <strong>确认要切换到${description}版吗？</strong>
                <ul>
                    <li>Pro：专为职场人士提供的职业互动平台</li>
                    <li>Campus：专为学生提供的求职交流平台</li>
                </ul>
                <form id="navigation-form" action="/navigation/doSwitch" method="post">
                    <input type="hidden" name="targetCode" value="${targetCode}">
                    <a href="##" id="J_submitForm">我要切换</a>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#J_submitForm').click(function (e) {
        if($('#J_submitForm').hasClass("wait")){
            return;
        }
        $('#J_submitForm').addClass("wait");
        $('#navigation-form').ajaxSubmit({
            success:function (r) {
                $('#J_submitForm').removeClass("wait");
                if (r == 0) {
                    location.href = "${redir}";
                } else {
                    alert(r.substr(2));
                }
            },
            error:function (xht, status, e) {
                $('#J_submitForm').removeClass("wait");
                alert("系统忙");
            }
        });
        return false;
    });
</script>

</@page>

