<#assign dictProfession = dictMap["DICT_PROFESSION"]>
<#if dictProfession??>
<#assign KeywordOfDialogName='position'/>
<#if (q.kod)?? && d.kod?trim?length gt 0><#assign KeywordOfDialogName=d.kod/></#if>
<div id="wholeworld-${KeywordOfDialogName}-dialog-content" class="dialog-content">
    <div id="${KeywordOfDialogName}-dialog-content-pickarea">
        <div id="${KeywordOfDialogName}-dialog-selected" style="display:none;">
            <h2>已选择: </h2>
            <ul class="selected clearfix"></ul>
        </div>
        <div class="drillpane">
            <div class="column column-left">
                <p class="caption">一级分类</p>
                <ul>
                    <#list dictProfession.data as profession>
                    <#if profession.parentId == 0 && profession.value.get('deprecated')?? && profession.value.get('deprecated') ==0>
                    <li rel="${profession.id}" class="drillable">${profession.name}</li>
                    </#if>
                    </#list>
                </ul>
            </div>
            <div class="column column-middle">
                <p class="caption">二级分类</p>
                <div class="scrollable">
                <#list dictProfession.data as profession>
                    <#if profession.parentId == 0 && profession.value.get('deprecated')?? && profession.value.get('deprecated') ==0>
                    <ul id="wholeworld-${KeywordOfDialogName}-middle-${profession.id}" style="display:none;">
                        <#if profession.children??>
                             <#list profession.children  as level2Profession>
                             <#if (level2Profession.value.get('deprecated'))?? && level2Profession.value.get('deprecated') ==0>
                                <li class="drillable"><input type="checkbox" id="wholeworld-${KeywordOfDialogName}-${level2Profession.id}-checkbox" value="${level2Profession.id}" name="profession" class="checkbox" <#if (q.disabled)?? >style="display
                                :none"</#if> /><label  class="checkbox">${level2Profession.name}</label> </li>
                             </#if>
                             </#list>
                        </ul>
                        </#if>
                    </#if>
                </#list>
                </div>
            </div>
            <div class="column column-right">
                <p class="caption">职位类别</p>
                <div class="scrollable">
                <#list dictProfession.data as profession>
                    <#if profession.parentId == 0>
                        <#if profession.children??>
                             <#list profession.children  as level2Profession>
                                <ul id="wholeworld-${KeywordOfDialogName}-right-${level2Profession.id}" style="display:none;">
                                    <#if level2Profession.children??>
                                         <#list level2Profession.children  as level3Profession>
                                         <#if  level3Profession.value.get('deprecated') ==0>
                                            <li class=""><input class="checkbox" name="profession" class="terminal" value="${level3Profession.id}" id="wholeworld-${KeywordOfDialogName}-${level3Profession.id}-checkbox" type="checkbox"><label class="checkbox" for="wholeworld-${KeywordOfDialogName}-${level3Profession.id}-checkbox">${level3Profession.name}</label> </li>
                                         </#if>
                                         </#list>
                                    </#if>
                                </ul>
                             </#list>
                        </#if>
                    </#if>
                </#list>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>



<script type="text/javascript">
    $('#wholeworld-${KeywordOfDialogName}-dialog-content .column li.drillable').hover(function(){
        if($(this).hasClass('drilled')) return false;
        $(this).addClass('hover');
    }, function(){
        if($(this).hasClass('drilled')) return false;
        $(this).removeClass('hover');
    }).click(function(){
        if($(this).hasClass('drilled')) return false;
        $(this).addClass('drilled').siblings().removeClass('drilled').removeClass('hover');
    });

    $('#wholeworld-${KeywordOfDialogName}-dialog-content .column-left li').click(function(){
        $('#wholeworld-${KeywordOfDialogName}-middle-' + $(this).attr('rel')).show().siblings().hide();
        $('#wholeworld-${KeywordOfDialogName}-dialog-content .column-right ul').hide();
    });

    $('#wholeworld-${KeywordOfDialogName}-dialog-content .column-middle li').click(function(){
        $('#wholeworld-${KeywordOfDialogName}-right-' + $(this).find(':checkbox').val()).show().siblings().hide();
    });

    $('#wholeworld-${KeywordOfDialogName}-dialog-content .column :checkbox').click(function(e) {
        var sa = [];
        $('#${KeywordOfDialogName}-dialog-selected li').each(function() {
            sa.push($(this).attr('rel'));
        });
        <#if q?? && q["max"]??><#assign qMax=q["max"]><#else><#assign qMax="5"></#if>
        if ($(this).attr('checked') && sa.length >= parseInt('${qMax!}')) {
            alert('最多选择${qMax!}项 ');
            e.stopImmediatePropagation();
            $('#wholeworld-${KeywordOfDialogName}-dialog-content').find(':checkbox[value="' + $(this).val() + '"]').attr('checked', false);
            return false;
        }
        var city = $(this).siblings().text();
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
        if(!$(this).hasClass('terminal')) {
            if ($(this).attr('checked')) {
                $('#wholeworld-${KeywordOfDialogName}-right-' + $(this).val()).find(':checkbox').attr('checked', false).attr('disabled', true).each(function() {
                    $('#wholeworld-${KeywordOfDialogName}-dialog-content').find(':checkbox[value="' + $(this).val() + '"]').attr('disabled', true);
                    $('#${KeywordOfDialogName}-dialog-selected').find('li[rel="' + $(this).val() + '"]').remove();
                });
            } else {
                $('#wholeworld-${KeywordOfDialogName}-right-' + $(this).val()).find(':checkbox').attr('disabled', false).each(function() {
                    $('#wholeworld-${KeywordOfDialogName}-dialog-content').find(':checkbox[value="' + $(this).val() + '"]').attr('disabled', false);
                });
            }
            e.stopImmediatePropagation();
        }
        e.stopPropagation();
    });

    $('#${KeywordOfDialogName}-dialog-selected li .delete').live('click', function() {
        var $li = $(this).parents('li');
        var t = $li.attr('rel');
        $li.remove();
        var $checkbox = $('#wholeworld-${KeywordOfDialogName}-dialog-content :checkbox[value="' + t + '"]').attr('checked', false);
        if ($('#${KeywordOfDialogName}-dialog-selected').find('li').length == 0) $('#${KeywordOfDialogName}-dialog-selected').hide('slow');
        return false;
    });

    //$('#wholeworld-position-dialog-content .column-left li:first').addClass('drilled');
    //$('#wholeworld-position-dialog-content .column-middle ul:first').show().find('li:first').trigger('click');
</script>
</#if>