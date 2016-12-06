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
                <#include "dialog-regions.ftl">
                <#--<@holder>-->
                <#--<script type="text/javascript">-->
                 <#--$(function(){-->
                     <#--$('#wholeworld-content-city').load('/job/show/regions?province=1');-->
                 <#--});-->
                <#--</script>-->
                <#--</@holder>-->
            </div>
        <#elseif  filter.key == "profession">
            <div id="wholeworld-content-profession" style="display:none">

                <#include "dialog-position.ftl" >
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