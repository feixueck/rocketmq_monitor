<#include "../seajs-config.ftl"/>
<@SeaConfig static={
    'alias' : {
        'login-dialog.css' : "login/util/login-dialog/css/login-dialog.css",
        'login/util/validation/js/jquery.validate' : 'login/util/validation/js/jquery.validate.js',
        'login/util/login-dialog/js/login-dialog' : 'login/util/login-dialog/js/login-dialog.js'
    }
}/>
<script type="text/javascript">
    seajs.use(['login/util/validation/js/jquery.validate','login/util/login-dialog/js/login-dialog'],function (validator,loginDialog) {
        var dialog = loginDialog.createDialog();

        // 登录
        $(document).delegate('#J-header-login','click',function (e) {
            e.preventDefault();
            dialog.open('login');
            $.post("http://${configs['domains.job']}/useraction/flow?keyword=regfu&from=navl");
        });
        // 注册
        $(document).delegate('#J-header-signin','click',function (e) {
            e.preventDefault();
            dialog.open();
            $.post("http://${configs['domains.job']}/useraction/flow?keyword=regfu&from=navr");
        });
        <#if !(dontShowAccountPop?? && dontShowAccountPop) && ((domain?? && (!user?? || request.requestURL.toString()?index_of('/job/index') gt 0) && (domain == configs['domains.job'] || domain == configs['domains.club'] || clubInfo?? )) || (forceLogin?? && forceLogin) || domain == configs['domains.campus'] || (request.requestURL.toString()?index_of('/corp/search') gt 0) ) >
            <#if !(noShowLogin?? && noShowLogin)>
                $(function () {
                    forceLogin();
                });
            </#if>
            function forceLogin(){
                if(document.referrer.indexOf("hao123.com")>0){
                    return;
                }
                var auth = $.cookie('dj_auth_v3');
                if (auth == null || auth.length <= 0) {
                    auth = $.cookie('dj_auth');
                }
                var login_tips = $.cookie("login_tips");
                if(auth==null || auth.length <= 0){
                    if (login_tips == null) {
                        var currentDate = new Date();
                        var cookieExpiredTime=new Date(currentDate.getFullYear(),currentDate.getMonth(),currentDate.getDate(),currentDate.getHours() + 1,currentDate.getMinutes(),currentDate.getMinutes());
                        $.cookie('login_tips','1',{ expires: cookieExpiredTime, path: '/', domain: '${configs["domains.root"]}' });
                        pop_reg();
                        root_canShowRegFloat =false;
                    }
                }
            }
        </#if>
    });
</script>