<#macro popreg redir='/' defaultPop='login' hasDm=false isSpecialInvitation=false platforms=["rr", "sina", "qq", "kx"]>
    <#assign isFromAccountPop=true/>
<script type="text/javascript">
    function pop_reg(redir, defaultPop,popRegFloat) {
        if (arguments.length == 0) {
            redir = '${redir}';
            defaultPop = 'login';
            popRegFloat = false;
        }
        if(redir == '' || redir == '/') {
            redir = document.location.href;
        }
        $('.redirect').val(redir);
        $('.renren a').attr('href', 'http://${configs['domains.www']}/account/rr/login?d.from=newfloat&redir='+encodeURIComponent(redir));
        $('.kaixin a').attr('href', 'http://${configs['domains.www']}/account/kx/login?d.from=newfloat&redir='+encodeURIComponent(redir));
        $('.tencent a').attr('href', 'http://${configs['domains.www']}/account/qq/login?d.from=newfloat&redir='+encodeURIComponent(redir));
        $('.sina a').attr('href', 'http://${configs['domains.www']}/account/sina/login?d.from=newfloat&d.cb=r0&redir='+encodeURIComponent(redir));
        if($.cookie('company_login')){
            dj_hd_reg_login_dialog('login');
        }else{
            dj_hd_reg_login_dialog('reg');
        }
    }

</script>
</#macro>