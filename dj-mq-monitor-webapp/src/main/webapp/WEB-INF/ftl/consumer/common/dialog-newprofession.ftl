<div id="profession-dialog-content" class="dialog-content ">
    <#if (professionType?? && professionType == "radio") || (d?? && d.professionType?? && d.professionType == "radio")>
        <#assign dialogContentName = "position-profession" >
    <#else>
        <#assign dialogContentName = "position-profession-checkbox" >
    </#if>
    <#assign KeywordOfDialogName=dialogContentName/>
    <#if (q.kod)?? && d.kod?trim?length gt 0><#assign KeywordOfDialogName=d.kod/></#if>
    <#if dialogContentName == "position-profession">
        <div id="${KeywordOfDialogName}-dialog-content-pickarea">
            <div id="${KeywordOfDialogName}-dialog-selected" style="display:none;">
                <h2>已选择: </h2>
                <ul class="selected clearfix"></ul>
            </div>
            <div class="pool">
                <ul class="clearfix">
                    <#list dictMap["DICT_POSITION_FUNCTION"].data as profession>
                        <#if profession.parentId == 0>
                            <li class="item checkable" rel="${profession.id?c}"><input type="radio" name="${KeywordOfDialogName}" id="${KeywordOfDialogName}-${profession.id?c}" value="${profession.id?c}"/><label for="${KeywordOfDialogName}-${profession.id?c}" class="radio">${profession.name}</label></li>
                        </#if>
                    </#list>
                </ul>
                <#--<div class="clearfix"></div>-->
            </div>
        </div>
    <#elseif dialogContentName == "position-profession-checkbox">
        <div id="${KeywordOfDialogName}-dialog-content-pickarea">
            <div id="${KeywordOfDialogName}-dialog-selected" style="display:none;">
                <h2>已选择: </h2>
                <ul class="selected clearfix"></ul>
            </div>
            <div class="pool">
                <ul class="clearfix">
                    <#list dictMap["DICT_POSITION_FUNCTION"].data as profession>
                        <#if profession.parentId == 0>
                            <li class="item checkable" rel="${profession.id?c}"><input type="checkbox" name="${KeywordOfDialogName}" id="${KeywordOfDialogName}-${profession.id?c}" value="${profession.id?c}"/><label for="${KeywordOfDialogName}-${profession.id?c}" class="radio">${profession.name}</label></li>
                        </#if>
                    </#list>
                </ul>
            </div>
        </div>
    </#if>
</div>
<script type="text/javascript">
    $('#${KeywordOfDialogName}-dialog-content-pickarea .checkable :checkbox').click(function(e) {
        var sa = [];
        $('#${KeywordOfDialogName}-dialog-content-pickarea').find('.selected li').each(function() {
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
    $('#${KeywordOfDialogName}-dialog-content-pickarea').find('[value="1327"], [value="1326"], [value="1340"]').attr('disabled', true);
</script>