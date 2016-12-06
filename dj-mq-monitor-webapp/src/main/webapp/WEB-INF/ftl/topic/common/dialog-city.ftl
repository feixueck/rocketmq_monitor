<#assign hotCityList = ['310000','110000','440100','440300','330100','420100','510100','320100','120000','210100','610100','230100','500000','370200','370100','210200','320500'] >
<div id="city-dialog-content" class="dialog-content">
    <#assign KeywordOfDialogName = "city" >
    <#if (q.kod)?? && d.kod?trim?length gt 0><#assign KeywordOfDialogName=d.kod/></#if>
    <div id="${KeywordOfDialogName}-dialog-content-pickarea">
        <div id="${KeywordOfDialogName}-dialog-selected" style="display:none;">
            <h2>已选择: </h2>
            <ul class="selected clearfix"></ul>
        </div>
        <div class="pool">
            <h3 class="b">热门城市:</h3>
            <#list hotCityList as hotCity>
                <#if hotCity_index % 6 = 0>
                <div class="foldable"></#if>
                <#if (dictMap.DICT_CITY.map.get(hotCity?number?int).name)??>
                    <span class="checkable">
                        <input type="checkbox" value="${hotCity}" name="${KeywordOfDialogName}" id="wholeworld-q-${KeywordOfDialogName}-${hotCity}-checkbox"><label class="checkbox" for="wholeworld-q-${KeywordOfDialogName}-${hotCity}-checkbox">${dictMap.DICT_CITY.map.get(hotCity?number?int).name}</label>
                    </span>
                </#if>
                <#if hotCity_index % 6 = 5 || hotCity_index + 1 = hotCityList?size></div></#if>
            </#list>
            <div class="clearfix"></div>
            <h3 class="b" style="margin-top:8px;">其他:</h3>
            <#assign this_index=0/>
            <#list dictMap["DICT_CITY"].data as city>
                <#assign isHot=false/>
                <#list hotCityList as cityId>
                    <#if city.id?c == cityId><#assign isHot=true/><#break></#if>
                </#list>
                <#if !isHot>
                    <#if this_index % 6 = 0>
                    <div class="foldable"></#if>
                    <span id="${city.id?c}" class="checkable<#if city.children?size != 0> close</#if>">
                        <input type="checkbox" id="wholeworld-${KeywordOfDialogName}-${city.id?c}-checkbox" name="${KeywordOfDialogName}" value="${city.id?c}" <#if allowSelectProvince??><#else>style="display:none; *display:inline-block; *width:0; *height:0;"</#if>/><label for="wholeworld-${KeywordOfDialogName}-${city.id?c}-checkbox" class="checkbox">${city.name}</label>
                    </span>
                    <#if this_index % 6 = 5 || this_index + 1 = dictMap["DICT_CITY"].data?size></div></#if>
                    <#assign this_index=this_index+1/>
                </#if>
            </#list>
        </div>
    <#list dictMap["DICT_CITY"].data as city>
        <#if city.children?size != 0>
            <div class="lowlevel clearfix" style="display:none" id="${KeywordOfDialogName}-${city.id?c}">
                <ul class="clearfix">
                    <#list city.children as child>
                        <li class="checkable"><@checkbox prefix="wholeworld" name="${KeywordOfDialogName}" value="${child.id?c}" label="${child.name}" /></li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#list>
    </div>

    <script type="text/javascript">
        $('#${KeywordOfDialogName}-dialog-content-pickarea .checkable :checkbox').click(function (e) {
            var sa = [];
            $('#${KeywordOfDialogName}-dialog-content-pickarea').find('.selected li').each(function () {
                sa.push($(this).attr('rel'));
            });
            if ($(this).attr('checked') && sa.length >= parseInt('${maxSelect!5}')) {
                alert('最多选择${maxSelect!5}项 ');
                e.stopImmediatePropagation();
                $('#${KeywordOfDialogName}-dialog-content-pickarea').find(':checkbox[value="' + $(this).val() + '"]').attr('checked', false);
                return false;
            }
            var city = $(this).siblings().text();
            if ($(this).attr('name') == '${KeywordOfDialogName}') {
                if ($(this).attr('checked')) {
                    if ($('#${KeywordOfDialogName}-dialog-content-pickarea .selected li[rel="' + $(this).val() + '"]').length != 0) return;
                    $('#${KeywordOfDialogName}-dialog-content-pickarea .selected').append('<li rel="' + $(this).val() + '"><a class="clean g3" href="javascript:void(0);"><span class="text">' + city + '</span><span class="delete">移除</span></a></li>');
                    $('#${KeywordOfDialogName}-dialog-content-pickarea :checkbox[value="' + $(this).val() + '"]').attr('checked', true);
                    if (!$('#${KeywordOfDialogName}-dialog-selected').is(':visible')) $('#${KeywordOfDialogName}-dialog-selected').show('slow');
                } else {
                    $('#${KeywordOfDialogName}-dialog-content-pickarea :checkbox[value="' + $(this).val() + '"]').attr('checked', false);
                    $('#${KeywordOfDialogName}-dialog-content-pickarea .selected').find('li[rel="' + $(this).val() + '"]').remove();
                    if ($('#${KeywordOfDialogName}-dialog-content-pickarea .selected').find('li').length == 0) $('#${KeywordOfDialogName}-dialog-selected').hide('slow');
                }
            }
            if ($(this).parent().is('.open, .close')) {
                if ($(this).attr('checked')) {
                    $('#${KeywordOfDialogName}-' + $(this).val()).find(':checkbox').attr('checked', false).attr('disabled', true).each(function () {
                        $(this).triggerHandler('click');
                        $('#${KeywordOfDialogName}-dialog-content-pickarea').find(':checkbox[value="' + $(this).val() + '"]').attr('disabled', true);
                        $('#${KeywordOfDialogName}-dialog-content-pickarea .selected').find('li[rel="' + $(this).val() + '"]').remove();
                    });
                } else {
                    $('#${KeywordOfDialogName}-' + $(this).val()).find(':checkbox').attr('disabled', false).each(function () {
                        $('#${KeywordOfDialogName}-dialog-content-pickarea').find(':checkbox[value="' + $(this).val() + '"]').attr('disabled', false);
                    });
                }
            }
            e.stopImmediatePropagation();
        });
        $('#${KeywordOfDialogName}-dialog-content-pickarea .selected li .delete').live('click', function () {
            var $li = $(this).parents('li');
            var t = $li.attr('rel');
            $li.remove();
            var $checkbox = $('#${KeywordOfDialogName}-dialog-content-pickarea :checkbox[value="' + t + '"]').attr('checked', false);
            if ($checkbox.parent().is('.close, .open')) $checkbox.triggerHandler('click');
            if ($('#${KeywordOfDialogName}-dialog-content-pickarea .selected').find('li').length == 0) $('#${KeywordOfDialogName}-dialog-selected').hide('slow');
            return false;
        });
        $('#${KeywordOfDialogName}-dialog-content-pickarea .close label').live('click', function (e) {
            var $fold = $(this).parent();
            $(this).parents('.pool').find('.lowlevel').hide();
            $(this).parents('.pool').find('.open').removeClass('open').addClass('close');
            var $sub = $('#${KeywordOfDialogName}-' + $fold.attr('id'));
            if ($sub.length == 0) return false;
            $fold.removeClass('close').addClass('open').parent().addClass('border').siblings().removeClass('border');
            var sa = $sub.find(':checkbox:checked').map(function () {
                return $(this).val()
            });
            $sub.insertAfter($fold.parent()).show();
            $(sa).each(function () {
                $sub.find(':checkbox[value="' + this + '"]').attr('checked', true);
            });
            return false;
        });
        $('#${KeywordOfDialogName}-dialog-content-pickarea .open label').live('click', function (e) {
            return false;
        });
        $('#${KeywordOfDialogName}-dialog-content-pickarea').find('[value="1327"], [value="1326"], [value="1340"]').attr('disabled', true);
    </script>
</div>