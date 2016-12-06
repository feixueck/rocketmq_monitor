<#if dialogContentName == "positionIndustry" >
    <div id="${dialogContentName}-dialog-content-pickarea">
        <div id="${dialogContentName}-dialog-selected" style="display:none;">
            <h2>已选择: </h2>
            <ul class="selected clearfix"></ul>
        </div>
        <div class="pool" style="height:250px; overflow-y:scroll;">
                <#list dictMap["DICT_POSITION_INDUSTRY"].data as newindustry>
                <#if allowSelectProvince?? && allowSelectProvince>
                	<h3 style="margin-top:8px;" class="b checkable">
                		<input type="checkbox" value="${newindustry.id?c}" id="province-${newindustry.id?c}" name="${dialogContentName}"><label class="checkbox"
                                                                                                                            for="province-${newindustry.id?c}">${newindustry.name!}</label>: </h3>
                <#else>
                	<h3 class="b" style="margin-top:8px;">${newindustry.name!}: </h3>
                </#if>
                <ul class="clearfix">
                    <#list dictMap.DICT_POSITION_INDUSTRY.map.get(newindustry.id).children as industry>
                        <li class="item checkable" style="width:150px;"><input type="checkbox" name="${dialogContentName}" id="province-${industry.id?c}" value="${industry.id?c}"/><label for="province-${industry.id?c}" class="checkbox">${industry.name}</label></li>
                    </#list>
                </ul>
                <#--<div class="clearfix"></div>-->
                </#list>
        </div>
    </div>
<#else>
    <div id="${dialogContentName}-dialog-content-pickarea">
        <div id="${dialogContentName}-dialog-selected" style="display:none;">
            <h2>已选择: </h2>
            <ul class="selected clearfix"></ul>
        </div>
        <div class="pool">
            <ul class="content">
                <#list filter.dict.data as item>
                    <li class="foldable checkable<#if  item.children?size==0> expanded</#if>"><@checkbox prefix="wholeworld" name="${filter.key}" value="${item.id}" label="${item.name}" /></li>
                </#list>
            </ul>
        </div>
    </div>
</#if>

<script type="text/javascript">

    <#-- 学校加载慢，延时执行 add by sheak 20130110-->
    setTimeout(function(){
        $('#${dialogContentName}-dialog-content-pickarea .checkable :checkbox').click(function(e) {
            var sa = [];
            $('#${dialogContentName}-dialog-content-pickarea').find('.selected li').each(function() {
                sa.push($(this).attr('rel'));
            });
            if ($(this).attr('checked') && sa.length >= parseInt('${maxSelect!5}')) {
                alert('最多选择${maxSelect!5}项 ');
                e.stopImmediatePropagation();
                $('#${dialogContentName}-dialog-content-pickarea').find(':checkbox[value="' + $(this).val() + '"]').attr('checked', false);
                return false;
            }
            var city = $(this).siblings().text();
            if ($(this).attr('name') == '${dialogContentName}') {
                if ($(this).attr('checked')) {
                    if ($('#${dialogContentName}-dialog-content-pickarea .selected li[rel="' + $(this).val() + '"]').length != 0) return;
                    $('#${dialogContentName}-dialog-content-pickarea .selected').append('<li rel="' + $(this).val() + '"><a class="clean g3" href="javascript:void(0);"><span class="text">' + city + '</span><span class="delete">移除</span></a></li>');
                    $('#${dialogContentName}-dialog-content-pickarea :checkbox[value="' + $(this).val() + '"]').attr('checked', true);
                    if (!$('#${dialogContentName}-dialog-selected').is(':visible')) $('#${dialogContentName}-dialog-selected').show('slow');
                	// 禁用子选项扩展
		            disabledChild:{
		              	var $this = $(this);
		              	var $par = $this.parent();
		              	if($par[0].nodeName !== 'H3'){
		                	break disabledChild;
		              	}
		              	var $childItem = $par.next().find('input:checkbox');
		              	$childItem.filter('[checked]').each(function(){
		                	$(this).removeAttr('checked').click().removeAttr('checked');
		              	});
		              	$childItem.attr('disabled','disabled');
		            }
                } else {
                    $('#${dialogContentName}-dialog-content-pickarea :checkbox[value="' + $(this).val() + '"]').attr('checked', false);
                    $('#${dialogContentName}-dialog-content-pickarea .selected').find('li[rel="' + $(this).val() + '"]').remove();
                    if ($('#${dialogContentName}-dialog-content-pickarea .selected').find('li').length == 0) $('#${dialogContentName}-dialog-selected').hide('slow');
                    disabledChild:{
	              		var $this = $(this);
             			var $par = $this.parent();
	              		if($par[0].nodeName !== 'H3'){
	                		break disabledChild;
	              		}
	              		var $childItem = $par.next().find('input:checkbox');
	              		$childItem.removeAttr('disabled');
	            	}
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
    } , 400);

    $('#${dialogContentName}-dialog-content-pickarea .selected li .delete').live('click', function() {
        var $li = $(this).parents('li');
        var t = $li.attr('rel');
        $li.remove();
        var $checkbox = $('#${dialogContentName}-dialog-content-pickarea :checkbox[value="' + t + '"]').attr('checked', false);
        if($checkbox.parent().is('.close, .open')) $checkbox.triggerHandler('click');
        if ($('#${dialogContentName}-dialog-content-pickarea .selected').find('li').length == 0) $('#${dialogContentName}-dialog-selected').hide('slow');
        disabledChild:{
            var $this = $(this);
            var $par = $this.parent();
            if($par[0].nodeName !== 'A'){
                break disabledChild;
            }
            var $dom =$('#${dialogContentName}-dialog-content-pickarea .pool').find('input:checkbox[value="' + t + '"]').parent().next().find('input:checkbox');
            $dom.each(function(e){
                $(this).removeAttr('disabled');
            })
        }
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
    $('#${dialogContentName}-dialog-content-pickarea').find('[value="1327"], [value="1326"], [value="1340"]').attr('disabled', true);
</script>
