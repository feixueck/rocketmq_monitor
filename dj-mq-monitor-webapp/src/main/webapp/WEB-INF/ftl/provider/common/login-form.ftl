<div class="dj-login-box">
    <div class="hd"><h3>使用大街网帐号登录</h3></div>
    <table class="login-table">
        <tr>
            <th>
                <label for="login-email">帐　号:</label>
            </th>
            <td>
                <input id="login-email" class="reg-input-wrap" type="text" tabindex="1" reg="loginname" name="email"
                       maxlength="50" autocomplete="off">

                <div class="error"></div>
            </td>
        </tr>
        <tr>
            <th><label for="login-pwd">密　码:</label></th>
            <td>
                <input id="login-pwd" class="reg-input-wrap" type="password" tabindex="2" name="password">

                <div class="error"></div>
            </td>
        </tr>
        <tr id="login-captcha-tr" <#if !needCaptcha?? || !needCaptcha>style="display: none"</#if>>
            <th><label for="login-captcha">验证码:</label></th>
            <td>
                <input id="login-captcha"<#if needCaptcha?? && needCaptcha> class="reg-input-wrap"</#if> type="text" tabindex="3" name="captcha" style="width:72px" maxlength="10">
            <#if needCaptcha?? && needCaptcha><img id="login-captcha-img" src="http://${configs['domains.www']}/captcha/code" title="验证码" style="vertical-align:middle"></#if>
                <a onclick="reset_captcha();return false;" href="javascript:void(0)" style="vertical-align:middle;font-size:12px;color:#86B5D7">换一换</a>
                <div class="error"></div>
            </td>
        </tr>
        <tr class="spc-tr">
            <th></th>
            <td>
                <div class="fr"><a class="g9" href="http://${configs['domains.www']}/account/lostpassword" title="">忘记密码？</a>
                </div>
                <input type="checkbox" class="checkbox" checked id="J_KeepLoginStatus"><label for="J_KeepLoginStatus" class="checkbox">保持登录状态</label>
            </td>
        </tr>
        <tr class="spc-tr">
            <th></th>
            <td>
            <#if !(needRegButton??)>
                <#assign needRegButton = true/>
            </#if>
            <#if needRegButton?? && needRegButton>
                <a id="reg-link" class="fr" href="http://${configs['domains.www']}/account/reg" title="注册大街网帐号" stat="7026">注册大街网帐号</a>
            </#if>
                <a href="###" title="" id="login-submit" class="goto-login-btn formValidateSubmit" tabindex="3" stat="7021"><b>登&nbsp;&nbsp;录</b></a>
                <input type="hidden" name="method" value="do"/>
                <input type="hidden" id="type" name="type" value="0"/>
                <input type="hidden" name="redir" value="<#if redir??>${redir?html}<#else>/</#if>">
            </td>
        </tr>
    </table>
</div>
<@holder>
<script type="text/javascript">
    $(document).ready(function () {
        $('#login-email').val($.cookie("login_email"));
        if ($('#login-email').val() != '') {
            $('#login-pwd').focus();
        } else {
            $('#login-email').focus();
        }
    });

    $(".reg-input-wrap").bind("keypress", function (e) {
        if (e.keyCode == '13' && $(this).attr('id') != 'login-email') {
            e.preventDefault();
            $("#login-submit").click();
        }
    });
    var aErrorMsg = ['邮箱或手机号码无效，请重填', '密码6-20位字母加数字组合，请重填','请输入正确验证码'];
    $('.reg-input-wrap').formValidate();

    var emailhosts = ["@qq.com", "@vip.qq.com", "@163.com", "@126.com", "@gmail.com", "@sina.com", "@hotmail.com", "@sohu.com", "@yeah.net", "@tom.com", "@live.cn", "@foxmail.com", "@139.com", "@21cn.com", "@zju.edu.cn", "@sina.com.cn", "@msn.com", "@mail.ustc.edu.cn", "@mails.jlu.edu.cn", "@sjtu.edu.cn", "@fudan.edu.cn", "@bsnow.net", "@mail.nankai.edu.cn", "@stu.xjtu.edu.cn", "@stu.edu.cn", "@eyou.com", "@mail.ecust.edu.cn", "@mails.tsinghua.edu.cn", "@bjtu.edu.cn", "@mail2.sysu.edu.cn", "@2008.sina.com", "@live.com", "@pku.edu.cn", "@msn.cn", "@ruc.edu.cn", "@bupt.cn", "@sem.tsinghua.edu.cn", "@gsm.pku.edu.cn", "@bit.edu.cn", "@emails.bjut.edu.cn", "@sogou.com", "@mail.bnu.edu.cn", "@vip.sina.com", "@mail.scut.edu.cn", "@mails.thu.edu.cn", "@njupt.edu.cn", "@cuc.edu.cn", "@cqu.edu.cn", "@mail.sdu.edu.cn", "@uestc.edu.cn", "@shu.edu.cn", "@lzu.cn", "@263.net", "@tju.edu.cn" ];
    $('#login-email').matchbox({strict:false, hasTips:false, hasTitle:false, minlength:1, titleLink:'https://mail.qq.com/cgi-bin/loginpage', customQuery:function (q) {
        var atIndex = q.indexOf('@');
        if (q.replace(/ |　/g, '').length == 0) {
            return [];
        }
        var matchs = new Array();
        var numberMatch = /^\d*$/;
        var i;
        if(numberMatch.test(q)){
            matchs.push({id:q, text:q});
            for (i = 0; i < 9; i++) {
                matchs.push({id:q + emailhosts[i], text:sub_email(q) + emailhosts[i]});
            }
        }else{
            if (atIndex == -1 || atIndex == q.length - 1) {
                q = q.replace('@', '');
                matchs.push({id:'_Title" class="exceeded', text:'推荐使用 <a href="javascript:void(0);">QQ邮箱</a> 注册'});
                for (i = 0; i < 9; i++) {
                    matchs.push({id:q + emailhosts[i], text:sub_email(q) + emailhosts[i]});
                }
            } else {
                var name = q.substr(0, atIndex);
                var host = q.substr(atIndex);
                var flag = true;
                for (i = 0; i < emailhosts.length; i++) {
                    if (emailhosts[i].indexOf(host) == 0) {
                        if (flag) {
                            matchs.push({id:'_Title" class="exceeded', text:'推荐使用 <a href="javascript:void(0);">QQ邮箱</a> 注册'});
                            flag = false;
                        }
                        matchs.push({id:name + emailhosts[i], text:sub_email(name) + emailhosts[i]});
                    }
                }
            }
        }
        return matchs;
    }});

    function sub_email(s) {
        if (s.length > 10) {
            s = s.substr(0, 5) + '...' + s.substr(s.length - 5);
        }
        return s;
    }

    function form_submit() {
        if ($.formValidate.check()) {
            $("#login-submit").unbind("click");
            var rememberMePara = '&rememberMe=1';
            if (!$('#J_KeepLoginStatus')[0].checked) {
                rememberMePara = '';
            }
            if ($('#login-captcha-tr:visible').length > 0) {
                rememberMePara += '&captcha=' + $('#login-captcha').val();
            }
            var mobileReg = /^1\d{10}$/;
            if(mobileReg.test($('#login-email').val())){
                var mobileNum = $('#login-email').val();
                rememberMePara += '&phone=' + mobileNum;
            }
            var redir = $('table.login-table input[name=redir]').val();

            if (redir.indexOf('/account/login') >= 0) {
                redir = '/';
            }
            rememberMePara += '&from=login';
            $('.login-table .error').hide();
            var url = '/account/newloginsubmit';
            $.ajax({
                url:url,
                data:'redir=' + encodeURIComponent(redir) + '&email=' + $('#login-email').val() + '&password=' + encodeURIComponent($('#login-pwd').val()) + rememberMePara,
                type:"POST",
                dataType:"jsonp"
            });
        } else {
            $('.reg-input-wrap').each(function () {
                var r = $.formValidate.check(this),
                        subNum = $('.reg-input-wrap').index(this),
                        $errorBox = $(this).parents('td').children('.error');
                if (!r) {
                    $errorBox.text(aErrorMsg[subNum]);
                } else {
                    $errorBox.text('');
                }
            });
        }
        return false;
    }

    $('.reg-input-wrap').bind('focus', function () {
        $(this).parents('td').find('.error').text('');
    });

    $("#login-submit").bind("click", form_submit);

    $('#reg-link').bind('click', function(){
        if($.cookie('custom_reg')!=null){
            var currentDate = new Date();
            var cookieExpiredTime=new Date(currentDate.getFullYear() -1,currentDate.getMonth(),currentDate.getDate(),currentDate.getHours() ,currentDate.getMinutes(),currentDate.getMinutes());
            $.cookie('custom_reg','',{ expires: cookieExpiredTime, path: '/', domain: '${configs["domains.www"]}' });
        }
    });

    function reset_captcha() {
        $('#login-captcha').val('');
        if($('#login-captcha-img').length > 0) {
            $('#login-captcha-img').attr('src', 'http://${configs['domains.www']}/captcha/code?t'+new Date().getTime())
        } else {
            $('#login-captcha').after('<img id="login-captcha-img" src="http://${configs['domains.www']}/captcha/code" title="验证码" style="vertical-align:middle">');
        }
    }

    function LOGIN_CALLBACK(r) {
        $("#login-submit").bind("click", form_submit);
        reset_captcha();
        var j = $.parseJSON(r);
        var state = j.state,
                msg = j.msg,
                url = j.url;
        switch (state) {
            case 1:
                $('#login-email').parents('td').children('.error').html(msg).show();
                break;
            case 2:
                var info = msg;
                $.alert("<div><div class='bd' style='padding-left: 24px;border-left: 1px solid #E5E5E5'><p class='con' style='font-size: 14px;line-height: 20px;'>" + info + "，你的帐号发生过异常登录。</p><p class='plus' style='font-size: 14px;line-height: 20px;padding-top: 10px;color:#333'>我们已向你的邮箱 <strong style='font-weight: bold;color : #333'>" + info[1] + "</strong> 发送密码重置链接，请立即处理。</p></div></div>", {"title":"大街提示","width":460});
                break;
            case 3:
                captchaShow();
                break;
            case 4:
                msg = '该邮箱未进行过注册。<a href="'+url+'" class="J_regLink">立即注册</a>'
                $('#login-email').parents('td').children('.error').html(msg).show();
                break;
            case 5:
                $('#login-email').parents('td').children('.error').html(msg).show();
                break;
            default:
                document.location.href = url;
        }
    }
    $('.J_regLink').live('click',function(){
        window.location.href = $(this).attr('href');
    });
    function captchaShow(){
        if ($('#login-captcha-tr:visible').length == 0) {
            reset_captcha();
            $('#login-captcha-tr').show();
            $('#login-captcha').addClass('reg-input-wrap');
            $('#login-captcha').bind("keypress", function (e) {
                if (e.keyCode == '13' && $(this).attr('id') != 'login-email') {
                    e.preventDefault();
                    $("#login-submit").click();
                }
            });
        } else {
            $('#login-captcha').parents('td').children('.error').text('请输入正确验证码').show();
        }
    }

</script>
</@holder>