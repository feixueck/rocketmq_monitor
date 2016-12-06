<@csselement file="/up/reg2013/css/reg-form.css"/>
<@csselement file="/up/reg2013/css/reg-dialog.css"/>
<@jselement file="/js/jquery.formvalidate.js"/>
<@jselement file="/up/reg2013/js/reg-dialog.js"/>
<@jselement file="/up/register-new/js/jquery.placeholder.js"/>
<div id="reg-dialog" style="display:none">
    <div class="public-dialog-box">
        <div class="dialog-wrap clearfix">
            <div class="reg-dialog clearfix" style="overflow:hidden;">
                <div class="reg-public-dialog-main">
                    <div class="form-box">
                        <div class="reg-tit g-yahei">简单设置，免费加入我们：</div>
                        <form action="http://${configs['domains.www']}/account/regsubmit" method="post" id="dialog-reg-form">
                            <input id="appkey" name="appKey" type="hidden" value="normal"/>
                            <input id="token" name="token" type="hidden" value="${token!}"/>
                            <input id="successUrl" name="successUrl" type="hidden" value="${successUrl!''}"/>
                            <input class="redirect" name="redir" type="hidden" value="${redir!'/'}"/>
                            <input id="errorUrl" name="errorUrl" type="hidden" value="http://${configs['domains.www']}/account/reg"/>
                            <input type="text" style="display: none;" id="focus-hidden-input"/>
                            <table>
                                <tr>
                                    <td class="input-wrap">
                                        <input type="text" class="J_dialogInput input-text dialog-email-link" maxlength="50" hasholder="true" reg="email" defaultTip="你的常用邮箱，推荐使用QQ邮箱" errorTip="邮箱格式有误，请重新填写" placeholder="邮箱" name="d.email" value="" id="reg-email"  ajaxreg="regEmail:djDialogRegEmailCheckGlobal" ajaxcheck="true">
                                        <p class="hide-tip"></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="input-wrap">
                                        <input type="password" reg="password" maxlength="20" hasholder="true" defaultTip="4-20个字符，区分大小写" errorTip="密码长度4-20(非中文)，请重新填写" class="J_dialogInput input-text" placeholder="密码" name="d.password" value="" id="reg-pwd">
                                        <p class="hide-tip"></p>
                                    </td>
                                </tr>
                                <tr class="hidden-tr" style="display:none;">
                                    <td class="input-wrap">
                                        <input type="text" ajaxreg="greenDam:dialogNameCheck" hasholder="true" ajaxcheck="true" id="true-name" name="d.name" class="J_dialogInput input-text" reg="name" defaulttip="填写真实姓名，更易获得合作机会" errortip="填写真实姓名，2-5个汉字" placeholder="姓名">
                                        <p class="hide-tip"></p>
                                    </td>
                                </tr>
                                <tr class="hidden-tr" style="display:none;">
                                    <td class="input-wrap">
                                    <span class="copy-input"><em class="tip-text">性别</em>
                                        <span class="sex J_radio">
                                            <input type="radio" style="display:none;" name="d.gender" id="dialog-male" value="1" class="J_dialogInput" errorTip="请选择性别"/><label class="radio-t margin" for="dialog-male">男</label>
                                            <input type="radio" id="dialog-female" style="display:none" name="d.gender" value="2"/><label class="radio-t" for="dialog-female">女</label>
                                        </span>
                                    </span>
                                        <em class="success-icon" style="display: none"></em>
                                        <p class="hide-tip"></p>
                                    </td>
                                </tr>
                                <tr class="last-tr">
                                    <td>
                                        <button class="reg-btn regDialogSubmit" id="J_dialogSubmit">立即注册</button><span class="t">我已阅读并同意服务条款</span></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
                <div class="reg-public-dialog-side reg-public-bg">
                    <p class="login-title">已有帐号，<a href="#" class="J_loginSwitch">点此登录</a></p>
                    <div class="other-login">
                        <ul class="hide J_other-login">
                            <li class="renren"><a href="http://${configs['domains.www']}/account/rr/login?d.from=newfloat&redir=${redir!'/'}"></a></li>
                            <li class="sina"><a href="http://${configs['domains.www']}/account/sina/login?d.from=newfloat&d.cb=r0&redir=${redir!'/'}"></a></li>
                            <li class="tencent"><a href="http://${configs['domains.www']}/account/qq/login?d.from=newfloat&redir=${redir!'/'}"></a></li>
                            <li class="kaixin"><a href="http://${configs['domains.www']}/account/kx/login?d.from=newfloat&redir=${redir!'/'}"></a></li>
                        </ul>
                        <a href="#" class="more-handel J_more">更多合作帐号</a>
                    </div>
                </div>
            </div>
            <div class="login-dialog clearfix" style="overflow:hidden;">
                <div class="reg-public-dialog-side">
                    <p class="login-title">没有帐号？<a href="#" class="J_regSwitch">立即注册</a></p>
                    <div class="other-login">
                        <ul class="hide J_other-login">
                            <li class="renren"><a href="http://${configs['domains.www']}/account/rr/login?d.from=nologin&redir=${redir!'/'}"></a></li>
                            <li class="sina"><a href="http://${configs['domains.www']}/account/sina/login?d.from=nologin&d.cb=r0&redir=${redir!'/'}"></a></li>
                            <li class="tencent"><a href="http://${configs['domains.www']}/account/qq/login?d.from=nologin&redir=${redir!'/'}"></a></li>
                            <li class="kaixin"><a href="http://${configs['domains.www']}/account/kx/login?d.from=nologin&redir=${redir!'/'}"></a></li>
                        </ul>
                        <a href="#" class="more-handel J_more">更多合作帐号</a>
                    </div>
                </div>
                <div class="reg-public-dialog-main">
                    <div class="form-box reg-public-bg">
                        <div class="reg-tit g-yahei">用大街网帐号登录：</div>
                        <form action="http://${configs['domains.www']}/account/newloginsubmit" id='login-form'>
                            <input class="redirect" name="redir" type="hidden" value="${redir!'/'}"/>
                            <table class="login-table">
                                <tr>
                                    <td class="input-wrap">
                                        <input type="text" reg="loginname" tabindex="1" name="email" hasholder="true" id="dialog-login-email" class="input-text J_loginInput dialog-account-link" errortip="邮箱或手机号码无效，请重填" defaulttip="请输入你的邮箱/手机号" placeholder="邮箱/手机号" autocomplete="off">
                                        <p class="hide-tip"></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="input-wrap">
                                        <input type="password" reg="^.{4,20}$" maxlength="20" hasholder="true" defaulttip="4-20个字符，区分大小写" errortip="密码长度4-20，请重填" tabindex="2" id="login-pwd" name="password" class="J_loginInput input-text" placeholder="密码">
                                        <p class="hide-tip"></p>
                                    </td>
                                </tr>
                                <tr class="hidden-tr" id="captcha" style="display: none">
                                    <td class="input-wrap">
                                        <input id="dialog-login-captcha" name="captcha" type="text" reg="^.{4,20}$" blanksubmit="true" hasholder="true" class="J_loginInput input-text yz-input" placeholder="验证码" defaulttip="请输入右方的验证码" errortip="请填写正确验证码" tabindex="3">
                                        <a style="vertical-align:middle;display:inline-block;" class="changeCaptcha" href="javascript:void(0)"><img id="dialog-login-captcha-img" src="http://${configs['domains.www']}/captcha/code" title="点击换图片" style="width:75px;height:36px;vertical-align:middle"></a>
                                        <p class="hide-tip"></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a class="fpwd" href="http://${configs['domains.www']}/account/lostpassword">忘记密码？</a>
                                        <input type="checkbox" value="1" name="rememberMe" hasholder="true" id="hold" checked=""><label class="checkbox" for="hold">保持登录状态</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-top:10px">
                                        <button class="reg-btn loginSubmit" id="J_loginSubmit">登录</button>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#dialog-login-email').val($.cookie("login_email"));
        if ($('#dialog-login-email').val() != '') {
            $('#login-pwd').focus();
        } else {
            $('#dialog-login-email').focus();
        }
    });
    $(function(){
        $.ajax({
            type:'get',
            url:'http://${configs['domains.www']}/account/floatreg',
            dataType:'jsonp',
            jsonpCallback:'REG_CALLBACK',
            success:function(r) {
            }
        });

        function REG_CALLBACK(info){
            var token = info.split(',')[0].split(':')[1].replace('"','').replace('"','');
            var needCaptcha = info.split(',')[1].split(':')[1].replace('"','').replace('"','');
            $('#token').attr("value", token);
            if(needCaptcha == "true"){
                $('#login-captcha').attr("blanksubmit", "false");
                $('#captcha').show();
            }
        }
    })
</script>