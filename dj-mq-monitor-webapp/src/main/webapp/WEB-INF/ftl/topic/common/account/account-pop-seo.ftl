<#--seo的注册浮层，备份待用-->
<@csselement file="/css/components/misc.css"/>
<@jselement file="/js/jquery.formvalidate.js"/>
<div id="dj-dialog-reg" style="display:none;">
    <div class="nt-info">
		<span class="nt-ava">
			<img src="http://assets.dajieimg.com/up/job-project-2013/i/avatar.png" width="50"/>
		</span>
        <div class="nt-con">
            <p>Hi，现在就使用求职绿色通道：</p>
            <h4 style="padding-right: 80px;`">简单设置，让<strong>心仪</strong>工作机会主动联系你</h4>
        </div>
        <b></b>
    </div>
    <div class="dj-dialog-reg-main" style="padding-bottom: 40px">
        <form id="dj-dialog-reg-form" method="post" action="">

            <input name="d.password" value="47l!g1l*7p2tzQ8Me0po" type="hidden">
            <label class="dj-dialog-reg-list" for="dj-dialog-reg-name" style="position:relative; z-index:100;">
                <span>你的姓名:</span>
                <input type="text" errorinfo="请填写真实姓名，2-5个汉字" blankvalue="真实姓名快速提高HR关注度" reg="^([\u4e00-\u9fa5]){2,5}$" id="dj-dialog-reg-name" class="dj-dialog-reg-input text g9" name="d.name" value="">
            </label>
            <div class="J_Error" style="display:none;"></div>
            <div class="dj-dialog-reg-point">
                <span>性  别:</span>
                <input type="radio" class="radio dj-dialog-reg-input" id="dj-dialog-reg-male" errorinfo="请选择性别" value="1" name="d.gender"><label for="dj-dialog-reg-male" class="radio">男</label>
                <input type="radio" class="radio" id="dj-dialog-reg-female" value="2" name="d.gender" checked="checked"><label for="dj-dialog-reg-female" class="radio">女</label>
            </div>
            <div class="J_Error" style="display:none;"></div>
            <label style="position:relative; z-index:1000;" class="dj-dialog-reg-list" for="dj-dialog-reg-email" >
                <span>常用邮箱:</span>
                <div class="matchbox"><div class="clearfix"><input type="text" errorinfo="邮箱格式错误" blankvalue="验证后即可收到心仪工作机会" maxlength="50" ajaxcheck="true" ajaxreg="email:djDialogRegEmailCheck" reg="email" id="dj-dialog-reg-email" class="dj-dialog-reg-input text g9" mailtype="mate" name="d.email" autocomplete="off" value="" style=""></div><div class="pickpane" style="width: 318px; display: none;"><ul class="menu"></ul></div></div>
            </label>
            <div class="J_Error" style="display:none;"></div>
            <div class="dj-dialog-reg-button">
                <input type="checkbox" checked="checked"
                       style="display:none;">
                <a class="dj-dialog-reg-submit big-fresh" id="dj-dialog-reg-submit" title="" href="javascript:void(0);"><span style="font-weight:normal;">立即加入</span></a>
                <div style="display:inline-block; *display:inline; margin-left: 10px; font-size: 12px;">已有帐号，直接<a href="" id="login">登录</a></div>
            </div>
        </form>
        <a id="dj-dialog-reg-agreement" class="radio J_DialogCancel">以后再说</a>
    </div>
</div>
<link rel="stylesheet" type="text/css" href="http://assets.dajieimg.com/up/dj-test/css/test10-4.52105.css"/>
<link rel="stylesheet" type="text/css" href="http://assets.dajieimg.com/js/pv.49294.js"/>
<script type="text/javascript">
    function pop_reg() {
        $('.J_Error').hide();
        $.dialog('#dj-dialog-reg', {
            mask : true,
            title : '提示',
            width : 720,
            bare: true,
            mercy : false,
            defbtn : false,
            customClass : 'dd-reg-test',
            onabort:function(){
                typeof click_b =='function' && click_b("seoreg_close");
            }
        });
        var redir = location.href;
        typeof click_b == 'function' && click_b("seoreg");
        var $regInput = $('.dj-dialog-reg-input');
        var $regSubmit = $('#dj-dialog-reg-submit');
        var strRegSubmitClass = 'dj-dialog-reg-submit';
        $('table.login-table input[name=redir]').val(redir);
        $('.dj-dialog-reg-renren a').attr('href', 'http://www.dajie.com/account/rr/login?d.from=seoreg&redir='+encodeURIComponent(redir));
        $('.dj-dialog-reg-kaixin a').attr('href', 'http://www.dajie.com/account/kx/login?d.from=seoreg&redir='+encodeURIComponent(redir));
        $('.dj-dialog-reg-qq a').attr('href', 'http://www.dajie.com/account/qq/login?d.from=seoreg&redir='+encodeURIComponent(redir));
        $('.dj-dialog-reg-sina a').attr('href', 'http://www.dajie.com/account/sina/login?d.from=seoreg&d.cb=r0&redir='+encodeURIComponent(redir));
        $('#dj-dialog-reg-form').attr('action', 'http://www.dajie.com/account/regsubmit?d.from=seoreg&d.template=club_reg&redir='+encodeURIComponent(redir));
        $('#login').attr('href', 'http://www.dajie.com/account/login?d.from=seoreg&redir='+encodeURIComponent(redir));
        $regInput.formValidate({
            button : strRegSubmitClass
        });
        $regInput.bind('click focus', function(){
            var $this = $(this);
            $this.parents('label').next('.J_Error').hide();
        });
        $regSubmit.click(function(){
            $.formValidate.submit(strRegSubmitClass, function(r){
                if(r){
                    $('#dj-dialog-reg-form').submit();
                }else{
                    $regInput.each(function(){
                        if(!$.formValidate.check(strRegSubmitClass, this)){
                            var $this = $(this);
                            $this.parents('label').next('.J_Error').html($this.attr('errorinfo')).show();
                        }
                    })
                }
            });
        });
    }

    // 异步验证邮箱的回调函数
    function djDialogRegEmailCheck(r, obj){
        var errorinfo='该邮箱已注册，请<a href="http://www.dajie.com/account/logout?d.from=seoreg">直接登录</a>';
        if(!r){
            var $this = $(this);
            $this.parents('label').next('.J_Error').html(errorinfo).show();
        }
    }

    $(function(){
        // 邮箱联想
        var emailhosts = ["@qq.com","@vip.qq.com","@163.com","@126.com","@gmail.com","@sina.com","@hotmail.com","@sohu.com","@yeah.net","@tom.com","@live.cn","@foxmail.com","@139.com", "@21cn.com","@zju.edu.cn","@sina.com.cn","@msn.com","@mail.ustc.edu.cn","@mails.jlu.edu.cn","@sjtu.edu.cn","@fudan.edu.cn","@bsnow.net","@mail.nankai.edu.cn","@stu.xjtu.edu.cn","@stu.edu.cn","@eyou.com","@mail.ecust.edu.cn","@mails.tsinghua.edu.cn","@bjtu.edu.cn","@mail2.sysu.edu.cn","@2008.sina.com","@live.com","@pku.edu.cn","@msn.cn","@ruc.edu.cn","@bupt.cn","@sem.tsinghua.edu.cn","@gsm.pku.edu.cn","@bit.edu.cn","@emails.bjut.edu.cn","@sogou.com","@mail.bnu.edu.cn","@vip.sina.com","@mail.scut.edu.cn","@mails.thu.edu.cn","@njupt.edu.cn","@cuc.edu.cn","@cqu.edu.cn","@mail.sdu.edu.cn","@uestc.edu.cn","@shu.edu.cn","@lzu.cn","@263.net","@tju.edu.cn" ];
        $('#dj-dialog-reg-email').matchbox({strict:false,hasTips:false,hasTitle:true,minlength:1,titleLink:'https://mail.qq.com/cgi-bin/loginpage',customQuery:function(q) {
            if ($(this).attr('mailtype') == 'hr') {
                return;
            }
            var atIndex = q.indexOf('@');
            if (q.replace(/ |　/g, '').length == 0) {
                return [];
            }
            var matchs = new Array();
            if (atIndex == -1 || atIndex == q.length - 1) {
                q = q.replace('@', '');
                matchs.push({id:'_Title" class="exceeded',text:'推荐使用 <a href="javascript:void(0);">QQ邮箱</a> 注册'});
                for (var i = 0; i < 9; i++) {
                    matchs.push({id:q + emailhosts[i],text:sub_email(q) + emailhosts[i]});
                }
            } else {
                var name = q.substr(0, atIndex);
                var host = q.substr(atIndex);
                var flag = true;
                for (i = 0; i < emailhosts.length; i++) {
                    if (emailhosts[i].indexOf(host) == 0) {
                        if (flag) {
                            matchs.push({id:'_Title" class="exceeded',text:'推荐使用 <a href="javascript:void(0);">QQ邮箱</a> 注册'});
                            flag = false;
                        }
                        matchs.push({id:name + emailhosts[i],text:sub_email(name) + emailhosts[i]});
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
    });
</script>