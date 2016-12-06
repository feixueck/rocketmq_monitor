<#--todo  这个ftl是用来测试的，不能上线。可以先把account-reg.ftl赋值到这个ftl,修改测试通过后，再把这个ftl复制到account-reg.ftl里，--》
<#--todo  注意不要把这两句注释给覆盖掉和copy到account-reg.ftl上 ！！！！！！！！！！！！！！！！！！ -->
<#macro popRegFloat>
<div class="reg-guide-dialog" id="reg-guide-dialog">
    <a class="guide-close">x</a>
    <div class="message"><img src ="http://assets.dajieimg.com.ui/up/login-lay/i/message.png"></div>
    <div class="company-tip">
        <#assign specialCorpIds = "3489427,3490033,3490034,3490037,3490038,3490039,3490041,3490042,3490043,3490044,3490046,3490048,3490049,3490050,3490052,3490054,3490056,3490058,3490059,3490061,3490063,3490064,3490065,3490067,3490068,3490069,3490072,3490095,3490074,3490075,3490078,3490093,3490079,3490080,3490081,3490083,3490084,3490085,3490088">
        <#assign isSpecialCorp = false>
        <#if current_corp??>
                <#if specialCorpIds?contains(current_corp.id?c)>
                        <#assign isSpecialCorp = true>
                </#if>
        </#if>
        <#if isSpecialCorp>
        <p class="tip">你新收到1封职位邀请信</p>
        <#else>
        <p class="tip">你新收到1封<#if jobDetail?? && jobDetail == true && jobPositionFunction??><span>${jobPositionFunction}</span><#elseif current_corp?? && current_corp.name??><span>${current_corp.name}</span><#else>企业</#if>的职位邀请信</p>
        </#if>
        <p class="click-see"><a href="http://${configs['domains.www']}/fl/register.do?domain=${(request.getServerName())!}" target="_blank"><img src ="http://assets.dajieimg.com.ui/up/login-lay/i/see.png"></a></p>
    </div>
</div>

<script type="text/javascript">

    $(function(){
        //注册引导弹窗
        var isStrictMode = document.compatMode != "BackCompat";
        jQuery.extend({
            // 可视高度
            viewHeight: function() {
                return isStrictMode ? document.documentElement.clientHeight : document.body.clientHeight;
            },

            // 文档高度
            docHeight: function() {
                return isStrictMode ? Math.max(document.documentElement.scrollHeight, document.documentElement.clientHeight) : Math.max(document.body.scrollHeight, document.body.clientHeight);
            }
        });

        var guideDialog = function(options){
            var defaultOptions = {
                dialogS:'#reg-guide-dialog',
                closeS:'.guide-close',
                isClose :false
            }
            jQuery.extend(this,defaultOptions,options) ;
            this.init();
        }
        guideDialog.prototype = {
            init:function(){
                if(!this.getStatus()) {
                    this.statics();
                    return ;
                } ;
                this.dialog = $(this.dialogS) ;
                this.closeBtn = this.dialog.find(this.closeS) ;
                this.bindEvent() ;
            },
            getStatus:function(){
                var isShow = false ;
                if(document.referrer.indexOf("hao123.com")>0) {
                    isShow = false  ;
                }else{
                    var auth = $.cookie('dj_auth_v3');
                    if (auth == null || auth.length <= 0) {
                        auth = $.cookie('dj_auth');
                    }
                    var reg_tips = $.cookie("__reg_tips");
                    if (auth == null || auth.length <= 0) {
                        if (reg_tips !== null && reg_tips >= 5) {
                            isShow =false ;
                        }else{
                            isShow =true ;
                        }
                    }
                }
                return isShow ;
            },
            statics:function(){
                //以前统计的逻辑
                if (typeof click_b == 'function') {
                    var auth = $.cookie('dj_auth_v3');
                    if (auth == null || auth.length <= 0) {
                        auth = $.cookie('dj_auth');
                    }
                    typeof click_b == 'function' && click_b("root_page_noLogin_all");
                }
            },
            bindEvent:function(){
                var that =this ;
                this.closeBtn.click(function () {
                    that.dialog.remove();
                    typeof click_b == 'function' && click_b("root_page_noLogin_regFloat_close");
                    that.isClose =true ;
                    return false;
                });
                this.dialog.hover(function () {
                    that.closeBtn.show();
                },function(){
                    that.closeBtn.hide();
                });

                this.dialog.click(function () {
                    var url = that.dialog.find('.click-see  a').attr('href') ;
                    if(!jQuery(this).is(that.closeS)){
                        window.open(url) ;
                        that.isClose =true ;
                        that.dialog.remove();
                    }
                    return false;
                });
                $(window).scroll(function() {
                    if(that.isClose||!root_canShowRegFloat) return ;
                    if (($(window).scrollTop()+$.viewHeight())>=$.docHeight()) {
                        that.animate();
                        that.statics();
                    }else{
                        //console.log('hide')
                    }
                });
            },
            animate:function(){
                var that = this ;
                root_canShowRegFloat =false ;
                that.isClose=true ;
                that.dialog.show().css('bottom',-that.dialog.height()).animate({
                    bottom: 2
                },1000);
                var reg_tips = $.cookie("__reg_tips");
                var currentDate = new Date();
                var cookieExpiredTime = new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate() + 1, 0, 0, 0);
                var reg_tips_values = 1;
                if (reg_tips != null) {
                    reg_tips_values = parseInt(reg_tips) + 1;
                }
                $.cookie('__reg_tips', reg_tips_values, { expires:cookieExpiredTime, path:'/', domain:'dajie.com' });
                typeof click_b == 'function' && click_b("root_page_noLogin_regFloat");
            }
        }

        //初始化
        new guideDialog()
    })

</script>
</#macro>