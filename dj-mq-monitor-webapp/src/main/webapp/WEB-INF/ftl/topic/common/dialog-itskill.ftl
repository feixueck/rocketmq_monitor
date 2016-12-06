<#assign hotItskillList = ['12','13','14','18','19','20','21','22','23','24','25','27','28','29','30','31','33','35','36','39','40','50','52','55','56','57','58','59','62','66']>
<div id="itskill-dialog-content" class="dialog-content picksection">
<#assign dialogContentName = "itSkill" >
<#assign KeywordOfDialogName=dialogContentName/>
<#if (q.kod)?? && d.kod?trim?length gt 0><#assign KeywordOfDialogName=d.kod/></#if>
    <div id="${KeywordOfDialogName}-dialog-content-pickarea">
        <div id="${KeywordOfDialogName}-dialog-selected" style="display:none;">
            <h2>已选择: </h2>
            <ul class="selected clearfix" style="width:692px;"></ul>
        </div>
        <div class="pool">
            <h3 class="b">常用:</h3>
        <#list hotItskillList as item>
            <#if item_index % 5 = 0>
            <div class="foldable"></#if>
            <#if (dictMap.DICT_ITSKILL.map.get(item?number?int).name)??>
                <span class="checkable">
                    <input type="checkbox" class="checkbox" value="${item}" name="${KeywordOfDialogName}" id="wholeworld-q-${KeywordOfDialogName}-${item}-checkbox"><label class="checkbox" for="wholeworld-q-${KeywordOfDialogName}-${item}-checkbox">${dictMap.DICT_ITSKILL.map.get(item?number?int).name}</label>
                </span>
            </#if>
            <#if item_index % 5 = 4 || item_index + 1 = hotItskillList?size></div></#if>
        </#list>
            <div class="clearfix"></div>
            <h3 class="b" style="margin-top:8px;">其他:</h3>
        <#assign this_index=0/>
        <#list dictMap["DICT_ITSKILL"].data as item>
            <#assign isHot=false/>
            <#list hotItskillList as itskillId>
                <#if item.id?c == itskillId><#assign isHot=true/><#break></#if>
            </#list>
            <#if !isHot>
                <#if this_index % 5 = 0>
                <div class="foldable"></#if>
                <span id="${item.id?c}" class="checkable<#if item.children?size != 0> close</#if>">
                    <input type="checkbox" class="checkbox" id="wholeworld-${KeywordOfDialogName}-${item.id?c}-checkbox" name="${KeywordOfDialogName}" value="${item.id?c}" style="display:none"/><label for="wholeworld-${KeywordOfDialogName}-${item.id?c}-checkbox" class="checkbox" >${item.name}</label>
                </span>
                <#if this_index % 5 = 4 || this_index + 1 = dictMap["DICT_ITSKILL"].data?size></div></#if>
                <#assign this_index=this_index+1/>
            </#if>
        </#list>
        </div>
    <#list dictMap["DICT_ITSKILL"].data as item>
        <#if item.children?size != 0>
            <div class="lowlevel clearfix" style="display:none" id="${KeywordOfDialogName}-${item.id?c}">
                <ul class="clearfix">
                    <#list item.children as child>
                        <li class="checkable"><@checkbox prefix="wholeworld" name="${KeywordOfDialogName}" value="${child.id?c}" label="${child.name}" /></li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#list>
    </div>
</div>
<script type="text/javascript">
    $('#${KeywordOfDialogName}-dialog-content-pickarea .checkable :checkbox, #${KeywordOfDialogName}-dialog-content-pickarea .lowlevel :checkbox').click(function(e) {
        var sa = [];
        var isNew = true;
        var obj = $(this);
        $('#${KeywordOfDialogName}-dialog-content-pickarea').find('.selected li').each(function() {
            sa.push($(this).attr('rel'));
            if($(this).attr('rel')==obj.val()){
                isNew = false;
            }
        });
        if ($(this).attr('checked') && sa.length >= ${maxSelect!5}&&isNew) {
            alert('最多选择${maxSelect!5}项 ');
            e.stopImmediatePropagation();
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
                $('#${KeywordOfDialogName}-' + $(this).val()).find(':checkbox').attr('checked', false).attr('disabled', true).each(function() {
                    $(this).triggerHandler('click');
                    $('#${KeywordOfDialogName}-dialog-content-pickarea').find(':checkbox[value="' + $(this).val() + '"]').attr('disabled', true);
                    $('#${KeywordOfDialogName}-dialog-content-pickarea .selected').find('li[rel="' + $(this).val() + '"]').remove();
                });
            } else {
                $('#${KeywordOfDialogName}-' + $(this).val()).find(':checkbox').attr('disabled', false).each(function() {
                    $('#${KeywordOfDialogName}-dialog-content-pickarea').find(':checkbox[value="' + $(this).val() + '"]').attr('disabled', false);
                });
            }
        }
        e.stopImmediatePropagation();
    });
    $('#${KeywordOfDialogName}-dialog-content-pickarea .selected li .delete').live('click', function() {
        var $li = $(this).parents('li');
        var t = $li.attr('rel');
        $li.remove();
        var $checkbox = $('#${KeywordOfDialogName}-dialog-content-pickarea :checkbox[value="' + t + '"]').attr('checked', false);
        if($checkbox.parent().is('.close, .open')) $checkbox.triggerHandler('click');
        if ($('#${KeywordOfDialogName}-dialog-content-pickarea .selected').find('li').length == 0) $('#${KeywordOfDialogName}-dialog-selected').hide('slow');
        return false;
    });
    $('#${KeywordOfDialogName}-dialog-content-pickarea .close label').live('click', function(e) {
        var $fold = $(this).parent();
        $(this).parents('.pool').find('.lowlevel').hide();
        $(this).parents('.pool').find('.open').removeClass('open').addClass('close');
        var $sub = $('#${KeywordOfDialogName}-' + $fold.attr('id'));
        if ($sub.length == 0) return false;
        $fold.removeClass('close').addClass('open').parent().addClass('border').siblings().removeClass('border');
        var sa = $sub.find(':checkbox:checked').map(function() {
            return $(this).val()
        });
        $sub.insertAfter($fold.parent()).show();
        $(sa).each(function() {
            $sub.find(':checkbox[value="' + this + '"]').attr('checked', true);
        });
        return false;
    });
    $('#${KeywordOfDialogName}-dialog-content-pickarea .open label').live('click', function(e) {
        return false;
    });
    $('#profession-dialog-content-pickarea').find('[value="1327"], [value="1326"], [value="1340"]').attr('disabled', true);
</script>