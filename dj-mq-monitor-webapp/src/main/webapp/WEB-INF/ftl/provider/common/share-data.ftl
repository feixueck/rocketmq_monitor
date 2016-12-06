<input type="hidden" id="isBindCorpFlag" value="${(isBindCorpEmail?string)!"false"}"/>
<#if  isBindCorpEmail?? && isBindCorpEmail>
<form action="http://${configs['domains.job']}/share/resume/add" method="POST" name="resume-share-form"  id="resume-share-form">
    <input type="hidden" name="sharingId" value="" id="sharingId-input">
    <table width="100%">
        <col width="55"/>
        <col width="*"/>
        <tr>
            <td class="b"><#if  shareType?? && shareType=="job_sharing">共享给：<#else>转发给：</#if></td>
            <td>
                <ul class="selecting floatleft">
                    <li style="padding-right:0">
                        <input type="text" class="text" autocomplete="off" name="email" id="resume-email-input">
                        <#if emailMap?? && emailMap?size gt 0>
                            <#list emailMap.keySet() as domain>
                                <#assign emails = emailMap.get(domain)>
                                <ul class="subList" style="display:none;" rel="${domain}">
                                    <#list emails.keySet() as email>
                                        <li style="display:block"><a href="javascript:void(0)" value="${email}">${emails.get(email)}</a></li>
                                    </#list>
                                </ul>
                            </#list>
                        </#if>
                    </li>
                </ul>
                @
                <#if domainList?size gt 1>
                    <select id="domain_list" name="domain">
                        <#list domainList as domain>
                            <option value="${domain}">${domain}</option>
                        </#list>
                    </select>
                <#--防止input框回车提交-->
                <input type="text" style="display: none;"/>
                <#else>
                    <span value="${domainList.get(0)}" id="domain_list">${domainList.get(0)}</span>
                    <input name="domain" value="${domainList.get(0)}" style="display:none;">
                </#if>
                    <span title="邮箱不能为空" class="formIcon formWrong" id="wrong-wanring" style="display:none"></span>
                <script type="text/javascript">
                    $('#resume-email-input').focus(function() {
                        var $domain = $('#domain_list').attr('value');
                        var $selector = '.subList[rel="'+$domain+'"]';
                        if($($selector+' li').length == 0){
                            return;
                        }
                        var $offset = $(this).offset()
                        if ($(this).parent().find($selector).is(":hidden")) {
                            $(this).find('p').width($(this).width());
                            $('.screenSub').hide();
                            if ($(this).parent().find($selector).height() > 144) {
                                $(this).parent().find($selector).css({width: $(this).innerWidth() + 'px',height: 144 + 'px','overflow-x':'hidden','overflow-y':'auto',left:80 + 'px',top:75 +'px'}).show().css('visibility', 'visible');;
                            } else {
                                $(this).parent().find($selector).css({width: $(this).innerWidth() + 'px',left: 80 +'px',top:75 +'px'}).show().css('visibility', 'visible');
                            }
                        } else {
                            $(this).parent().find('.selecting li .subList').hide().css('visibility', 'hidden');
                        }

                    });
                    $(document).click(function(e) {
                        if ($(e.target).closest('.selecting li .subList').length > 0 || $(e.target).closest('#resume-email-input').length > 0) {
                            return;
                        }
                        $('.selecting li .subList').hide().css('visibility', 'hidden');;
                    });
                    $('li a').click(function() {
                        $('#resume-email-input').val($(this).attr('value'));
                        $('.selecting li .subList').hide().css('visibility', 'hidden');;
                    });
                    $('#domain_list').change(function(){
                        $('#resume-email-input').val("");
                    });
                </script>
            </td>
        </tr>
        <tr>
            <td></td>
            <td class="alignright"><p class="inputlimit">还可以输入<span>140</span>字</p></td>
        </tr>
        <tr>
            <td valign="top" class="b">附 言：</td>
            <td><textarea id="textearea1" class="textarea" name="comments"></textarea></td>
        </tr>
    </table>
</form>
    <#else>
    <div style="padding:20px 0;"">
        <div class="errorAlert">
            <div>
                <h3>开通 <#if  shareType?? && shareType=="job_sharing">共享职位<#else>职业档案转发</#if> 服务需提供企业邮箱地址</h3>

                <p>请用你的企业邮箱发一封标题为“开通职业档案转发服务”的邮件到</p>

                <p>service@dajie.com，邮件内容要包含你在大街网的登录邮箱及姓名。</p>
            </div>
        </div>
    </div>
</#if>
