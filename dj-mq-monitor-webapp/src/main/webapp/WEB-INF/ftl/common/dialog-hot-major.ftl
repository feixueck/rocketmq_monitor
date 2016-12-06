<#assign dialogContentName='major'/>
<div id="wholeworld-dialog-content" class="dialog-content clearfix">
    <div class="floatleft">
        <div id="${dialogContentName}-dialog-content-pickarea">
            <div id="${dialogContentName}-dialog-selected" style="display:none;">
                <h2>已选择: </h2>
                <ul class="selected clearfix"></ul>
            </div>
            <div class="pool">
                <ul class="content">
                <#if (dictMap['DICT_MAJOR_SIM'].data)?? && dictMap['DICT_MAJOR_SIM'].data?size gt 0>
                    <#list dictMap['DICT_MAJOR_SIM'].data?reverse as element>
                        <li class="foldable checkable">
                            <input type="checkbox" id="wholeworld-major-${element.id?c}-checkbox" value="${element.id?c}"
                                   name="major"
                                   class="checkbox">
                            <label for="wholeworld-major-${element.id?c}-checkbox"
                                   class="checkbox">${element.name}</label>
                    </#list>
                </#if>
                </ul>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#${dialogContentName}-dialog-content-pickarea .checkable :checkbox, #${dialogContentName}-dialog-content-pickarea .lowlevel :checkbox').click(function(e) {
        var sa = [];
        $('#${dialogContentName}-dialog-content-pickarea').find('.selected li').each(function() {
            sa.push($(this).attr('rel'));
        });
        if ($(this).attr('checked') && sa.length >= parseInt('${maxSelect!5}')) {
            alert('最多选择${maxSelect!5}项 ');
            e.stopImmediatePropagation();
            return false;
        }
        var city = $(this).siblings().text();
        if ($(this).attr('name') == '${dialogContentName}') {
            if ($(this).attr('checked')) {
                if ($('#${dialogContentName}-dialog-content-pickarea .selected li[rel="' + $(this).val() + '"]').length != 0) return;
                $('#${dialogContentName}-dialog-content-pickarea .selected').append('<li rel="' + $(this).val() + '"><a class="clean g3" href="javascript:void(0);"><span class="text">' + city + '</span><span class="delete">移除</span></a></li>');
                $('#${dialogContentName}-dialog-content-pickarea :checkbox[value="' + $(this).val() + '"]').attr('checked', true);
                if (!$('#${dialogContentName}-dialog-selected').is(':visible')) $('#${dialogContentName}-dialog-selected').show('slow');
            } else {
                $('#${dialogContentName}-dialog-content-pickarea :checkbox[value="' + $(this).val() + '"]').attr('checked', false);
                $('#${dialogContentName}-dialog-content-pickarea .selected').find('li[rel="' + $(this).val() + '"]').remove();
                if ($('#${dialogContentName}-dialog-content-pickarea .selected').find('li').length == 0) $('#${dialogContentName}-dialog-selected').hide('slow');
            }
        }
        if ($(this).parent().is('.open, .close')) {
            if ($(this).attr('checked')) {
                $('#${dialogContentName}-' + $(this).val()).find(':checkbox').attr('checked', false).attr('disabled', true).each(function() {
                    $(this).triggerHandler('click');
                    $('#${dialogContentName}-dialog-content-pickarea').find(':checkbox[value="' + $(this).val() + '"]').attr('disabled', true);
                    $('#${dialogContentName}-dialog-content-pickarea .selected').find('li[rel="' + $(this).val() + '"]').remove();
                });
            } else {
                $('#${dialogContentName}-' + $(this).val()).find(':checkbox').attr('disabled', false).each(function() {
                    $('#${dialogContentName}-dialog-content-pickarea').find(':checkbox[value="' + $(this).val() + '"]').attr('disabled', false);
                });
            }
        }
        e.stopImmediatePropagation();
    });
    $('#${dialogContentName}-dialog-content-pickarea .selected li .delete').live('click', function() {
        var $li = $(this).parents('li');
        var t = $li.attr('rel');
        $li.remove();
        var $checkbox = $('#${dialogContentName}-dialog-content-pickarea :checkbox[value="' + t + '"]').attr('checked', false);
        if ($checkbox.parent().is('.close, .open')) $checkbox.triggerHandler('click');
        if ($('#${dialogContentName}-dialog-content-pickarea .selected').find('li').length == 0) $('#${dialogContentName}-dialog-selected').hide('slow');
        return false;
    });
    $('#${dialogContentName}-dialog-content-pickarea .close label').live('click', function(e) {
        var $fold = $(this).parent();
        $(this).parents('.pool').find('.lowlevel').hide();
        $(this).parents('.pool').find('.open').removeClass('open').addClass('close');
        var $sub = $('#${dialogContentName}-' + $fold.attr('id'));
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
    $('#${dialogContentName}-dialog-content-pickarea .open label').live('click', function(e) {
        return false;
    });
</script>