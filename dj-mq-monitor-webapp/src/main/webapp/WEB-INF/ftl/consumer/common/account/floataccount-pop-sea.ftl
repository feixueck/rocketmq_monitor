<#include "../seajs-config.ftl"/>
<@SeaConfig static={
'alias' : {
'login/util/login-dialog/css/login-dialog' : "login/util/login-dialog/css/login-dialog.css",
'login/util/login-dialog-school/css/login-dialog' : "login/util/login-dialog-school/css/login-dialog.css",
'login/util/login-dialog-school/css/login-bottom' : 'login/util/login-dialog-school/css/login-bottom.css',
'login/util/validation/js/jquery.validate' : "login/util/validation/js/jquery.validate.js",
'login/util/login-dialog/js/login-dialog': "login/util/login-dialog/js/login-dialog.js",
'login/util/login-dialog-school/js/login-dialog' : "login/util/login-dialog-school/js/login-dialog.js",
'login/util/login-dialog-school/js/login-bottom' : 'login/util/login-dialog-school/js/login-bottom.js'
}
}/>
<script type="text/javascript">
    (function () {
        // 原始登陆注册浮层
        seajs.use(['login/util/validation/js/jquery.validate', 'login/util/login-dialog/js/login-dialog']);
        // 新注册浮层
        seajs.use(['login/util/validation/js/jquery.validate', 'login/util/login-dialog-school/js/login-dialog', 'login/util/login-dialog-school/js/login-bottom'], function (validator, loginDialog, loginBottom) {
            loginBottom.init({
                url : 'http://${configs['domains.www']}/account/footerfloat'
            });
            loginDialog.init('http://${configs['domains.www']}/account/getregurls');
            var $doc = $(document);
            // 登录
            $doc.delegate('#J-header-login', 'click', function (e) {
                e.preventDefault();
                pop_reg('login');
                $.post("http://${configs['domains.job']}/useraction/flow?keyword=regfu&from=navl");
            });
            // 注册
            $doc.delegate('#J-header-signin', 'click', function (e) {
                e.preventDefault();
                pop_reg();
                $.post("http://${configs['domains.job']}/useraction/flow?keyword=regfu&from=navr");
            });
        });
    })();
</script>