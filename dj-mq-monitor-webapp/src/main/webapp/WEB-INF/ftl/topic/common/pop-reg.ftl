<#macro popreg redir>
<#assign type=1/>
<div id="regist-pop" style="display:none">
    <div id="pop-regist">
    <#include 'reg_form_main.ftl' />
    </div>
</div>
<div id="login-pop" style="display:none">
    <#if isJobFair?? && isJobFair>
        <#assign loginTitle="本次活动需要登录大街网才能预约哦！">
    <#else>
        <#assign loginTitle="欢迎回来！登录享受大街网会员服务！">
    </#if>
    <div id="pop-login">
        <h1>${loginTitle}</h1>
        <div id="login-error" class="error" style="display:none">邮箱地址与密码不符，请重新登录！</div>
    <#include 'login-form.ftl' />
    </div>
</div>
<@holder>
<script type="text/javascript">
    $('#login-link').click(function() {
        $('.dialog').hide();
        $.dialog('#login-pop', {title:'欢迎来到大街网',mercy:false,width:530,mask:true,onabort:function() {
            $('#login-form')[0].reset();
            $('#login-error').hide();
        }});
        return false;
    });
    $('#reg-link').click(function() {
        $('.dialog').hide();
        $.dialog('#regist-pop', {title:'欢迎来到大街网',mercy:false,width:700,mask:true,onabort:function() {
            /*
            $('#reg-form')[0].reset();
            $('#agreement').attr('checked', "checked");
            $('span.formSuccess').remove();
            $('span.formWrong').remove();
            $('input.wrong').removeClass('wrong');
            */
        }});
        return false;
    });
    function pop_reg() {
        $.dialog('#login-pop', {title:'欢迎来到大街网',mercy:false,width:530,mask:true,onabort:function() {
            $('#login-form')[0].reset();
            $('#login-error').hide();
        }});
    }
</script>
</@holder>
</#macro>