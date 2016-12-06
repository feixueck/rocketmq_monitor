<#--校园招聘，项目进度页新浮层-->
<div id="wholeworld-dialog-content" class="dialog-content clearfix">
    <div class="tabBar clearfix">
        <ul>
            <#list filters as filter>
                <li><a class="nav_tab" href="javascript:void(0)" id="menulink-${filter.key}">${filter.name}</a></li>
            </#list>
        </ul>
    </div>
    <div class="content-container">
    <#list filters as filter>
        <#if filter.key == "city">
            <div id="wholeworld-content-city" style="display:none">
    			<#assign allowSelectProvince = true >
                <#include "dialog-city.ftl">
            </div>
        <#elseif  filter.key == "positionIndustry">
            <div id="wholeworld-content-positionIndustry" style="display:none">
            	<#assign allowSelectProvince = true >
                <#assign dialogContentName = filter.key>
                <#include "dialog-positionindustry-new.ftl" >
            </div>
        <#else>
            <div id="wholeworld-content-${filter.key}" style="display:none">
                <#assign dialogContentName = filter.key>
                <#include "dialog-content.ftl" >
            </div>
        </#if>
    </#list>
    </div>
    <script type="text/javascript">
        $('#wholeworld-dialog-content .tabBar a').click(function() {
            $(this).parent().addClass('current').siblings().removeClass('current');
            $('#' + this.id.replace('menulink-', 'wholeworld-content-')).show().siblings().hide();
            return false;
        });
        function populateDialog(string) {
            $('#wholeworld-dialog-content :checked').attr('checked', false);
            $('#wholeworld-dialog-content .selected').empty();
            $(string).each(function() {
                var r = this.split(':');
                $('#wholeworld-dialog-content').find(':checkbox[name="' + r[0] + '"]').filter('[value="' + r[1] + '"]').attr('checked', true).triggerHandler('click');
            });
        }
        function switchDialog(key) {
            $('#menulink-' + key).click();
        }
    </script>
</div>