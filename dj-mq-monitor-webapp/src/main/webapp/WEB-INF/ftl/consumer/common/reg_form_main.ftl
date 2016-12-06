<div class="regist-main">
    <form action="http://${configs['domains.www']}/reg" method="post" id="reg-form">
        <input type="hidden" name="method" value="do"/>
        <#if redir?? && redir!=''>
            <input type="hidden" name="redir" value="${redir}"/>
        </#if>
        <#if code??>
            <input type="hidden" name="code" value="${code}"/>
        </#if>
        <#if uid?? && uid!=0>
            <input type="hidden" name="uid" value="${uid}"/>
        </#if>
        <input type="hidden" name="type" value="${(type)!}" />
        <div class="form regForm">
            <table class="form">
                <col width="85"/>
                <col width="*"/>
                <tr>
                    <td class="label-m reg-label"><label for="reg-email">邮箱地址:</label></td>
                    <td>
                        <#if code?? && email?? && email!="">
                            ${email}
                            <input type="hidden" name="email" value="${email}" />
                        <#else>
                            <div class="textBox floatleft"><input type="text" id="reg-email" name="email" class="text" maxlength="50" autocomplete="off"/></div>
                        </#if>
                    </td>
                </tr>
                <tr>
                    <td class="label-m reg-label"><label for="reg-pwd">密　　码:</label></td>
                    <td>
                        <div class="textBox floatleft"><input type="password" id="reg-pwd" name="password" class="text" maxlength="30" autocomplete="off"/><input type="text" id="passwordBox" class="text wrong" maxlength="30" autocomplete="off" value="密码不足4位" style="display:none;"/>
                        </div><span id="pwdWrong" class="formIcon formWrong" title="密码不足4位" style="display:none; margin-top:5px;"></span><span id="pwdSuccess" class="formIcon formSuccess" style="display:none; margin-top:5px;"></span>
                    </td>
                </tr>
                <tr>
                    <td class="label-m reg-label"><label for="true-name">真实姓名:</label></td>
                    <td>
                        <#if code?? && name??>
                            ${name}
                            <input type="hidden" name="name" value="${name}" />
                        <#else>
                            <div class="textBox floatleft"><input type="text" name="name" class="text" autocomplete="off" id="true-name"/></div>
                        </#if>
                    </td>
                </tr>
                <tr>
                    <td class="label-m reg-label"><label>你的性别:</label></td>
                    <td class="gender"><input name="gender" id="male" value="1" class="checkbox" type="radio"/><label class="checkbox" for="male">男</label><input id="female" name="gender" class="checkbox" value="2" type="radio"/><label class="checkbox" for="female">女</label></td>
                </tr>
                <tr>
                    <td class="label-m reg-label"><label class="switchArrow">你　　是:</label></td>
                    <td><select class="select" name="userIdentify" id="chooseUserIdentity"><option value="-1">请选择身份</option><option value="0">学生</option><option value="1">在职人士</option></select></td>
                </tr>
            </table>
            <table class="statePanel form" id="edu_info" style="display:none;">
                <col width="85"/>
                <col width="*"/>
                <tr>
                    <td class="label-m reg-label"><label for="schoolname-input">学校名称:</label></td>
                    <td><div class="textBox floatleft"><input type="text" id="schoolname-input" class="text" name="schoolName" maxlength="100" autocomplete="off"/></div></td>
                </tr>
                <tr>
                    <td class="label-m reg-label"><label>学　　历:</label></td>
                    <td><select class="select" name="degree" style="width:120px">
                        <option value="-1">请选择学历</option>
                    <#list dictMap.DICT_DEGREE.data as item>
                        <option value="${item.id?c}">${item.name}</option>
                    </#list>
                    </select></td>
                </tr>
                <tr>
                    <td class="label-m reg-label"><label for="majorname-input">专业名称:</label></td>
                    <td><div class="textBox floatleft"><input type="text" id="majorname-input" name="majorName" class="text" maxlength="50"/></div></td>
                </tr>
                <tr id="major-linkup">
                    <td class="label-m reg-label"><label>专业类别:</label></td>
                    <td><select class="select select1" id="specialty-sort-select">
                        <option value="-1">请选择</option>
                    <#list dictMap.DICT_MAJOR.data as item>
                        <option value="${item.id?c}">${item.name}</option>
                    </#list>
                    </select>
                    <select id="edu-major-select" class="select select2" name="major">
                    </select>
                    <#include 'major_suggest.ftl'/></td>
                </tr>
                <tr>
                    <td class="label-m reg-label"><label>在校时间:</label></td>
                    <td><select class="select select4" name="startYear">
                        <option value="0">请选择</option>
                    <#list 1990..2010 as year>
                        <option value="${year}">${year}</option>
                    </#list>
                    </select>
                    至
                    <select class="select select5" name="endYear">
                        <option value="0">请选择</option>
                    <#list 1991..2015 as year>
                        <option value="${year}">${year}</option>
                    </#list>
                    </select></td>
                </tr>
            </table>
            <table class="statePanel form" id="practice_info" style="display:none;">
                <col width="85"/>
                <col width="*"/>
                <tr>
                    <td class="label-m reg-label"><label for="company-name">公司名称:</label></td>
                    <td><div class="textBox floatleft"><input name="corpName" maxlength="80" id="company-name" type="text" class="text"/></div></td>
                </tr>
                <tr>
                    <td class="label-m reg-label"><label>所属行业:</label></td>
                    <td><select class="select select3" name="industry">
                        <option value="0">请选择行业</option>
                    <#list dictMap.DICT_INDUSTRY.data as item>
                        <option value="${item.id?c}">${item.name}</option>
                    </#list>
                    </select></td>
                </tr>
                <tr>
                    <td class="label-m reg-label"><label for="bu">部　　门:</label></td>
                    <td><div class="textBox floatleft"><input name="department" maxlength="80" id="bu" type="text" class="text"/></div></td>
                </tr>
                <tr>
                    <td class="label-m reg-label"><label for="position-input">职位名称:</label></td>
                    <td><div class="textBox floatleft"><input id="position-input" name="position" maxlength="60" type="text" class="text"/></div></td>
                </tr>
                <tr id="profession-linkup">
                    <td class="label-m reg-label"><label>职位类别:</label></td>
                    <td><select id="profession-specialty-sort" class="select select1">
                        <option value="">请选择</option>
                    <#list dictMap.DICT_PROFESSION.data as item>
                        <option value="${item.id?c}">${item.name}</option>
                    </#list>
                    </select>
                    <select id="profession-select" name="profession"  class="select select2">
                    </select>
                    <#include 'profession_suggest_new.ftl' /></td>
                </tr>
                <tr>
                    <td class="label-m reg-label"><label>入职时间:</label></td>
                    <td id="practice-date"><#assign endyear=currentDate?string('yyyy')?number?int />
                    <@dateinput short="yes" id="startDate-input" name='startDate' startyear=1971 endyear=endyear value='' /></td>
                </tr>
            </table>

            <p class="statement">
                <input type="checkbox" id="agreement" class="checkbox" checked="checked">
                <label class="checkbox">已阅读并同意<a id="agreement-link" target="_blank" href="http://${configs['domains.www']}/about/agreement.html">大街网服务条款</a></label>
            </p>
            <p class="btnBox">
                <button class="reg-btn" id="reg-btn" type="button" stat="10001">注 册</button>
                <a href="http://${configs['domains.www']}/login" class="green" id="login-link">已注册用户点击这里登录>></a>
            </p>
            <div class="regLoading large" id="regLoading" style="display:none;"><a class="gc floatright f12" id="cancelRegBtn" href="javascript:void(0);">取消注册</a><img src="<@url>/images/chrome/throbber.gif</@url>"/><span style="vertical-align:middle;">正在验证注册，请稍候……</span></div>
        </div>
    </form>
    <@holder>
    <script type="text/javascript">
        var singleCheck = true;
        // 身份选择
        $('#chooseUserIdentity').change(function() {
            var chooseValue = $(this).val();
            $(this).nextAll("span").remove();
            if (chooseValue == 0) { // 学生
                $(this).after('<span class="formIcon formSuccess"></span>');
                $('#practice_info').hide();
                $('#edu_info').show();
            } else if (chooseValue == 1) { // 在职
                $(this).after('<span class="formIcon formSuccess"></span>');
                $('#edu_info').hide();
                $('#practice_info').show();
            } else {
                $(this).after('<span class="formIcon formWrong" title="请选择身份"></span>');
                $('#edu_info').hide();
                $('#practice_info').hide();
            }
        });

        // email 验证
        var tempEmailValue = '';
        $('#reg-email').blur(function() {
            $(this).removeClass("inputFocus");
            $(this).parents("td").find("span").remove();
            var obj = this;
            var tmp = $(this).val().replace(/ |　/g, '');
            if ("邮箱已被注册，请重试" != tmp) {
                tempEmailValue = tmp;
                this.value = tempEmailValue;
            }
            if (singleCheck && this.value == '') return;
            var pattern = /^[_\.0-9a-zA-Z+-]+@([0-9a-zA-Z]+[0-9a-zA-Z-]*\.)+[a-zA-Z]{2,4}$/;
            //TODO 横杠正则表达式
            if (!pattern.test(this.value)) {
                $(this).addClass('wrong');
                $(this).val('邮箱格式有误，请重试');
                $(this).parent().parent().parent().after('<span class="formIcon formWrong" style="margin-top:5px;" title="邮箱格式有误，请重试"></span>');
                return;
            }
            if (this.value.length > 50) {
                $(this).addClass('wrong');
                $(this).val("邮箱过长，超出50个字符");
                $(this).parent().parent().parent().after('<span class="formIcon formWrong" style="margin-top:5px;" title="邮箱过长，超出50个字符"></span>');
                return;
            }
            $.get('/ajax/emailcheck', {email:this.value,t:new Date().getTime()}, function(r) {
                $(obj).parents("td").find("span").remove();
                if (r == '0') {
                    $(obj).removeClass('wrong');
                    $(obj).parent().parent().parent().after('<span class="formIcon formSuccess" style="margin-top:5px;"></span>');
                    <#if !type?? || type!=1>
                        $.get('/corpinfo', {email:$('#reg-email').val()}, function(r) {
                            var corpinfo = eval(r);
                            if (corpinfo.length > 0 && $('#company-name').val() == '') {
                                $('#company-name').val(corpinfo[0].name);
                                tempCorpNameValue = corpinfo[0].name;
                                $('select[name=industry]').val(corpinfo[0].industry).change();
                            }
                        });
                    </#if>
                } else {
                    $(obj).addClass('wrong');
                    $(obj).val(r.substr(2));
                    $(obj).parent().parent().parent().after('<span class="formIcon formWrong" style="margin-top:5px;" title="'+r.substr(2)+'"></span>');
                }
            });
        });
        $('#reg-email').focus(function(){
            $(this).addClass("inputFocus");
            $(this).parents("td").find("span").remove();
            $(this).removeClass('wrong');
            $(this).val(tempEmailValue);
            setSelectPos(this);
        });

        // email 补全
        var emailhosts = ["@qq.com","@vip.qq.com","@163.com","@126.com","@gmail.com","@sina.com","@hotmail.com","@sohu.com","@yeah.net","@tom.com","@live.cn","@foxmail.com","@139.com", "@21cn.com","@zju.edu.cn","@sina.com.cn","@msn.com","@mail.ustc.edu.cn","@mails.jlu.edu.cn","@sjtu.edu.cn","@fudan.edu.cn","@bsnow.net","@mail.nankai.edu.cn","@stu.xjtu.edu.cn","@stu.edu.cn","@eyou.com","@mail.ecust.edu.cn","@mails.tsinghua.edu.cn","@bjtu.edu.cn","@mail2.sysu.edu.cn","@2008.sina.com","@live.com","@pku.edu.cn","@msn.cn","@ruc.edu.cn","@bupt.cn","@sem.tsinghua.edu.cn","@gsm.pku.edu.cn","@bit.edu.cn","@emails.bjut.edu.cn","@sogou.com","@mail.bnu.edu.cn","@vip.sina.com","@mail.scut.edu.cn","@mails.thu.edu.cn","@njupt.edu.cn","@cuc.edu.cn","@cqu.edu.cn","@mail.sdu.edu.cn","@uestc.edu.cn","@shu.edu.cn","@lzu.cn","@263.net","@tju.edu.cn" ];
        $('#reg-email').matchbox({strict:false,hasTips:false,hasTitle:true,titleLink:'https://mail.qq.com/cgi-bin/loginpage',customQuery:function(q){
            var atIndex = q.indexOf('@');
            if(q.replace(/ |　/g, '').length == 0) {
                return [];
            }
            var matchs = new Array();
            if(atIndex==-1||atIndex==q.length-1) {
                q = q.replace('@', '');
                matchs.push({id:'_Title" class="exceeded',text:'推荐使用 <a href="javascript:void(0);">QQ邮箱</a> 注册'});
                for(var i=0;i<9;i++) {
                    matchs.push({id:q+emailhosts[i],text:sub_email(q)+emailhosts[i]});
                }
            } else {
                var name = q.substr(0, atIndex);
                var host = q.substr(atIndex);
                var flag = true;
                for(i=0;i<emailhosts.length;i++) {
                    if(emailhosts[i].indexOf(host)==0) {
                        if (flag) {
                            matchs.push({id:'_Title" class="exceeded',text:'推荐使用 <a href="javascript:void(0);">QQ邮箱</a> 注册'});
                            flag = false;
                        }
                        matchs.push({id:name+emailhosts[i],text:sub_email(name)+emailhosts[i]});
                    }
                }
            }
            tempEmailValue = this.value;
            return matchs;
        }});
        function sub_email(s) {
            if(s.length>10) {
                s = s.substr(0, 5) + '...' + s.substr(s.length-5);
            }
            return s;
        }

        // 密码验证
        $('#reg-pwd').blur(function() {
            $(this).removeClass("inputFocus");
            if (this.value != '') {
                if (this.value.length < 4) {
                    $(this).hide();
                    $("#pwdSuccess").hide();
                    $("#pwdWrong").css({display:'inline-block'});
                    $("#passwordBox").show();
                } else {
                    $("#pwdWrong").hide();
                    $("#passwordBox").hide();
                    $("#pwdSuccess").css({display:'inline-block'});
                }
            } else if (!singleCheck) {
                $(this).hide();
                $("#pwdSuccess").hide();
                $("#pwdWrong").css({display:'inline-block'});
                $("#passwordBox").show();
            }
        });
        $('#passwordBox').focus(function() {
            $("#pwdWrong").hide();
            $("#passwordBox").hide();
            $("#pwdSuccess").hide();
            $("#reg-pwd").show();
            $("#reg-pwd").focus();
        });
        $('#reg-pwd').focus(function() {
            $(this).addClass("inputFocus");
            $("#pwdSuccess").hide();
            setSelectPos(this);
        });


        // 姓名验证
        var tempNameValue = '';
        $('input[name=name]').blur(function() {
            $(this).removeClass("inputFocus");
            tempNameValue = $(this).val().replace(/ |　/g, '');
            this.value = tempNameValue;
            if (singleCheck && this.value == '') return;
            var re = /[^\u3447-\uFA29]/;
            if (re.test(this.value) || this.value.length < 2 || this.value.length > 5) {
                $(this).addClass('wrong');
                $(this).val("请使用2-5个汉字");
                $(this).parent().after('<span class="formIcon formWrong" style="margin-top:5px;" title="请使用2-5个汉字"></span>');
                return;
            }
            if (this.value.indexOf('大街')>-1 || this.value.indexOf('官方')>-1) {
                $(this).addClass('wrong');
                $(this).val("包含非法关键字");
                $(this).parent().after('<span class="formIcon formWrong" style="margin-top:5px;" title="包含非法关键字"></span>');
                return;
            }
            $(this).parent().after('<span class="formIcon formSuccess" style="margin-top:5px;"></span>');
        });
        $('input[name=name]').focus(function(){
            $(this).addClass("inputFocus");
            $(this).parent().next().remove();
            $(this).removeClass('wrong');
            $(this).val(tempNameValue);
            setSelectPos(this);
        });

        // 性别验证
        $('#male,#female').click(function () {
            gender_check();
        });
        function gender_check() {
            $('.gender').find('.formIcon').remove();
            var gender = -1;
            $('input[name="gender"]').each(function () {
                if ($(this).is(":checked")) {
                    gender = $(this).val();
                }
            });
            if (gender == -1) {
                $('.gender').append('<span class="formIcon formWrong" title="请选择性别"></span>');
                return false;
            } else {
                $('.gender').append('<span class="formIcon formSuccess"></span>');
                return true;
            }
        }

                // 学历验证
                $('select[name=degree]').change(function() {
                    $(this).next().remove();
                    if (this.value == -1) {
                        $(this).after('<span class="formIcon formWrong" title="请选择学历"></span>');
                    } else {
                        $(this).after('<span class="formIcon formSuccess"></span>');
                    }
                });

                // 专业名称
                var tempMajorNameValue = '';
                $('input[name=majorName]').blur(function() {
                    $(this).removeClass("inputFocus");
                    tempMajorNameValue = $(this).val().replace(/ |　/g, '');
                    this.value = tempMajorNameValue;
                    if (singleCheck && this.value == '') return;
                    if (this.value.length < 2) {
                        $(this).addClass('wrong');
                        $(this).val("专业名称2-50字");
                        $(this).parent().after('<span class="formIcon formWrong" style="margin-top:5px;" title="专业名称2-50字"></span>');
                    } else {
                        $(this).parent().after('<span class="formIcon formSuccess" style="margin-top:5px;"></span>');
                    }
                });
                $('input[name=majorName]').focus(function() {
                    $(this).addClass("inputFocus");
                    $(this).removeClass('wrong');
                    $(this).parent().next().remove();
                    $(this).val(tempMajorNameValue);
                    setSelectPos(this);
                });

                // 专业类别
                $('#specialty-sort-select').change(function () {
                    $('#edu-major-select').next().remove();
                    if (this.value == -1) {
                        $('#edu-major-select').after('<span class="formIcon formWrong" title="请选择专业类别"></span>');
                    } else {
                        $('#edu-major-select').after('<span class="formIcon formSuccess"></span>');
                    }
                });

                // 在校时间
                $('select[name=startYear]').change(function() {
                    $('select[name=endYear]').next().remove();
                    if (this.value == 0) {
                        $('select[name=endYear]').after('<span class="formIcon formWrong" title="请选择在校时间"></span>');
                    } else if ($('select[name=endYear]').val() != 0) {
                        if ($('select[name=endYear]').val() <= this.value) {
                            $('select[name=endYear]').after('<span class="formIcon formWrong" title="请输入正确的年份"></span>');
                        } else {
                            $('select[name=endYear]').after('<span class="formIcon formSuccess"></span>');
                        }
                    }
                    var y;
                    if ($(this).val() == 0) {
                        y = $(this).find('option:eq(1)').val();
                    } else {
                        y = $(this).val();
                    }
                    y = Number(y)+1;
                    var endYearValue = $('select[name=endYear]').val();
                    var end = $('select[name=endYear] option:last').val();
                    $('select[name=endYear]').empty().append('<option value="0">请选择</option>');
                    for (var i = y; i <= end; i++) {
                        $('select[name=endYear]').append('<option value="' + i + '">' + i + '</option>');
                    }
                    if(endYearValue >= y && endYearValue <= end) {
                        try {$('select[name=endYear]').val(endYearValue);}catch(e){}
                    }
                });
                $('select[name=endYear]').change(function() {
                    $('select[name=endYear]').next().remove();
                    if (this.value == 0) {
                        $('select[name=endYear]').after('<span class="formIcon formWrong" title="请选择在校时间"></span>');
                    } else if ($('select[name=startYear]').val() != 0) {
                        if ($('select[name=startYear]').val() >= this.value) {
                            $('select[name=endYear]').after('<span class="formIcon formWrong" title="请输入正确的年份"></span>');
                        } else {
                            $('select[name=endYear]').after('<span class="formIcon formSuccess"></span>');
                        }
                    }
                });

                var tempSchoolNameValue = '';
                $('input[name=schoolName]').blur(function() {
                    $(this).removeClass("inputFocus");
                    tempSchoolNameValue = $(this).val().replace(/ |　/g, '');
                    this.value = tempSchoolNameValue;
                    if (singleCheck && this.value == '') return;
                    if (this.value.length < 2) {
                        $(this).addClass('wrong');
                        $(this).val('学校名称2-100字');
                        $(this).parent().parent().parent().after('<span class="formIcon formWrong" style="margin-top:5px;" title="学校名称2-100字"></span>');
                    } else {
                        $(this).parent().parent().parent().after('<span class="formIcon formSuccess" style="margin-top:5px;"></span>');
                    }
                });
                $('input[name=schoolName]').focus(function(){
                    $(this).addClass("inputFocus");
                    $(this).removeClass('wrong');
                    $(this).parent().parent().parent().parent().find('span').remove();
                    if ("学校名称2-100字" == $(this).val()) {
                        $(this).val(tempSchoolNameValue);
                    }
                    setSelectPos(this);
                });
                $('#schoolname-input').matchbox({query: '/ajax/dictli?type=school&s={1}', strict: false, minlength:1,hasTips:false});

                // --在职--
                // 公司名称
                var tempCorpNameValue = '';
                $('input[name=corpName]').blur(function() {
                    $(this).removeClass("inputFocus");
                    tempCorpNameValue = this.value.replace(/ |　/g, '');
                    this.value = tempCorpNameValue;
                    if (singleCheck && this.value == '') return;
                    if (this.value.length < 2) {
                        $(this).addClass('wrong');
                        $(this).val("公司名称2-80字");
                        $(this).parent().after('<span class="formIcon formWrong" style="margin-top:5px;" title="公司名称2-80字"></span>');
                    } else {
                        $(this).parent().after('<span class="formIcon formSuccess" style="margin-top:5px;"></span>');
                    }
                });
                $('input[name=corpName]').focus(function() {
                    $(this).addClass("inputFocus");
                    $(this).removeClass('wrong');
                    $(this).parent().next().remove();
                    $(this).val(tempCorpNameValue);
                    setSelectPos(this);
                });

                // 行业验证
                $('select[name=industry]').change(function() {
                    $(this).next().remove();
                    if (this.value == 0) {
                        $(this).after('<span class="formIcon formWrong" title="请选择行业"></span>');
                    } else {
                        $(this).after('<span class="formIcon formSuccess"></span>');
                    }
                });

                // 部门验证
                var tempDepartmentValue = '';
                $('input[name=department]').blur(function() {
                    $(this).removeClass("inputFocus");
                    tempDepartmentValue = this.value.replace(/ | /g, '');
                    this.value = tempDepartmentValue;
                    if (singleCheck && this.value == '') return;
                    if (this.value.length < 2) {
                        $(this).addClass('wrong');
                        $(this).val("部门2-80字");
                        $(this).parent().after('<span class="formIcon formWrong" style="margin-top:5px;" title="部门2-80字"></span>');
                    } else {
                        $(this).parent().after('<span class="formIcon formSuccess" style="margin-top:5px;"></span>');
                    }
                });
                $('input[name=department]').focus(function() {
                    $(this).addClass("inputFocus");
                    $(this).removeClass('wrong');
                    $(this).parent().next().remove();
                    $(this).val(tempDepartmentValue);
                    setSelectPos(this);
                });

                // 职位名称
                var tempPositionValue = '';
                $('input[name=position]').blur(function() {
                    $(this).removeClass("inputFocus");
                    tempPositionValue = this.value.replace(/ |　/g, '');
                    this.value = tempPositionValue;
                    if (singleCheck && this.value == '') return;
                    $(this).next().remove();
                    if (this.value.length < 2) {
                        $(this).addClass('wrong');
                        $(this).val("职位名称2-60字");
                        $(this).parent().after('<span class="formIcon formWrong" style="margin-top:5px;" title="职位名称2-60字"></span>');
                    } else {
                        $(this).parent().after('<span class="formIcon formSuccess" style="margin-top:5px;"></span>');
                    }
                });
                $('input[name=position]').focus(function() {
                    $(this).addClass("inputFocus");
                    $(this).removeClass('wrong');
                    $(this).parent().next().remove();
                    $(this).val(tempPositionValue);
                    setSelectPos(this);
                });

                // 职位类别
                $('#profession-specialty-sort').change(function() {
                    $('select[name=profession]').next().remove();
                    if (this.value == '') {
                        $('select[name=profession]').after('<span class="formIcon formWrong" title="请选择职位类别"></span>');
                    } else {
                        $('select[name=profession]').after('<span class="formIcon formSuccess"></span>');
                    }
                });

                // 入职时间
                $('select[name=practiceStartYear]').change(function() {
                    $('select[name=practiceEndYear]').next().remove();
                    if (this.value == 0) {
                        $('select[name=practiceEndYear]').after('<span class="formIcon formWrong" title="请选择入职时间"></span>');
                    } else if ($('select[name=practiceEndYear]').val() != 0) {
                        if ($('select[name=practiceEndYear]').val() <= this.value) {
                            $('select[name=practiceEndYear]').after('<span class="formIcon formWrong" title="请输入正确的年份"></span>');
                        } else {
                            $('select[name=practiceEndYear]').after('<span class="formIcon formSuccess"></span>');
                        }
                    }
                });
                $('select[name=practiceEndYear]').change(function() {
                    $('select[name=practiceEndYear]').next().remove();
                    if (this.value == 0) {
                        $('select[name=practiceEndYear]').after('<span class="formIcon formWrong" title="请选择入职时间"></span>');
                    } else if ($('select[name=practiceStartYear]').val() != 0) {
                        if ($('select[name=practiceStartYear]').val() >= this.value) {
                            $('select[name=practiceEndYear]').after('<span class="formIcon formWrong" title="请输入正确的年份"></span>');
                        } else {
                            $('select[name=practiceEndYear]').after('<span class="formIcon formSuccess"></span>');
                        }
                    }
                });
                $('#practice-date select').change(function(){
                    if(this.value=='') {
                        $('#practice-date span').remove();
                        $('#practice-date').append('<span class="formIcon formWrong" title="请选择入职时间"></span>');
                    } else {
                        var hasSelect = true;
                        $('#practice-date select').each(function(){
                            if(this.value=='') {
                                hasSelect = false;
                            }
                        });
                        if(hasSelect) {
                            $('#practice-date span').remove();
                            $('#practice-date').append('<span class="formIcon formSuccess"></span>');
                        }
                    }
                });

                // 大街条款
                $('#agreement').click(function(){
                    $('#agreement-link').next().remove();
                    if(!this.checked) {
                        $('#agreement-link').after('<span class="formIcon formWrong" title="遵守大街网条款才能注册"></span>');
                    }
                });

                $('#reg-btn').click(function() {
                    gender_check();
                    singleCheck = false;
                    $('#reg-pwd').blur();
                    $('#reg-form input:visible').each(function() {
                        if ($(this).parents("td").find('.formWrong').length != 0) {
                            return;
                        }
                        if ($(this).parents("td").find('.formSuccess').length == 0) {
                            $(this).blur();
                        }
                    });
                    $('#reg-form select:visible').each(function() {
                        if ($(this).parent().find('.formSuccess').length == 0) {
                            $(this).change();
                        }
                    });
                    if ($('#chooseUserIdentity').val()==0 && $('select[name=startYear]').val() == 0) {
                        $('select[name=endYear]').next().remove();
                        $('select[name=endYear]').after('<span class="formIcon formWrong" title="请选择在校时间"></span>');
                    }
                    if ($('.formWrong:visible').length == 0) {
                        $('#reg-form input:visible').each(function() {
                            $(this).attr("disabled","disabled");
                        });
                        $('#reg-form select:visible').each(function() {
                            $(this).attr("disabled","disabled");
                        });
                        <#if !email??>
                        $('.btnBox').hide()
                        /*$("#reg-btn").hide();
                        $("#login-link").hide();适应首页*/
                        $("#regLoading").show();
                        $.get('/ajax/emailcheck', {email:$('#reg-email').val(),password:$('#reg-pwd').val(),checkType:61,t:new Date().getTime()});
                        $.get('/ajax/emailcheck', {email:$('#reg-email').val(),password:$('#reg-pwd').val(),checkType:60,t:new Date().getTime()});
                        var regTimer = setTimeout(function() {
                            formEnable();
                            $('#reg-form').submit();
                        }, 6000);
                        $('#cancelRegBtn').click(function(){
                            clearTimeout(regTimer);
                            formEnable();
                            $("#regLoading").hide();
                            /*$("#reg-btn").show();
                            $("#login-link").show();适应首页*/
                            $('.btnBox').show();
                        });
                        <#else>
                        formEnable();
                        $('#reg-form').submit();
                        </#if>
                    }
                    singleCheck = true;
                });

                function formEnable() {
                    $('#reg-form input:visible').each(function() {
                        $(this).removeAttr("disabled");
                    });
                    $('#reg-form select:visible').each(function() {
                        $(this).removeAttr("disabled");
                    });
                }
                function setSelectPos(obj) {
                    try {
                        var textRange =obj.createTextRange();
                        textRange.moveStart('character',obj.value.length);
                        textRange.collapse(true);
                        textRange.select();
                    } catch(e) {}
                }
        </script>
    </@holder>
</div>