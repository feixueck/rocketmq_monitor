<#assign hotCityList = ['310000','110000','440100','440300','330100','420100','510100','320100','120000','210100','610100','230100','500000','370200','370100','210200','320500'] >
<#assign hotProfessionList = ['1329','1331','1328','1335','1333','1322','1326','1334','1323','1341','1338','1337','1354','1336','1342','1327','1325','1340','0'] >
<#assign hotIndustryList = ['2','26','20','4','7','19','36','1','37','8','6','3','30','5','23']>
<#assign hotItskillList = ['12','13','14','18','19','20','21','22','23','24','25','27','28','29','30','31','33','35','36','39','40','50','52','55','56','57','58','59','62','66']>
<#assign englishCert =  (dictMap.DICT_CERT.map.get('1'?number?int))!>
<#assign computerCert = (dictMap.DICT_CERT.map.get('2'?number?int))!>
<#assign softwareCert = (dictMap.DICT_CERT.map.get('3'?number?int))!>
<#assign certOthers = ['4','5','6','7']>

<#if dialogContentName == "city">
<div id="city-dialog-content-pickarea">
    <div id="city-dialog-selected" style="display:none;">
        <h2>已选择: </h2>
        <ul class="selected clearfix"></ul>
    </div>
    <h2>工作城市: </h2>

    <div class="pool">
        <h3 class="b">热门城市:</h3>
        <#list hotCityList as hotCity>
            <#if hotCity_index % 6 = 0>
            <div class="foldable"></#if>
            <#if (dictMap.DICT_CITY.map.get(hotCity?number?int).name)??>
                <span class="checkable">
                    <input type="checkbox" value="${hotCity}" name="city" id="wholeworld-q-city-${hotCity}-checkbox"><label class="checkbox" for="wholeworld-q-city-${hotCity}-checkbox">${dictMap.DICT_CITY.map.get(hotCity?number?int).name}</label>
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
                    <input type="checkbox" id="wholeworld-city-${city.id?c}-checkbox" name="city" value="${city.id?c}" <#if allowSelectProvince??><#else> style="display:none;"</#if>/><label for="wholeworld-city-${city.id?c}-checkbox" class="checkbox">${city.name}</label>
                </span>
                <#if this_index % 6 = 5 || this_index + 1 = dictMap["DICT_CITY"].data?size></div></#if>
                <#assign this_index=this_index+1/>
            </#if>
        </#list>
    </div>
    <#list dictMap["DICT_CITY"].data as city>
        <#if city.children?size != 0>
            <div class="lowlevel clearfix" style="display:none" id="city-${city.id?c}">
                <ul class="clearfix">
                    <#list city.children as child>
                        <li class="checkable"><@checkbox prefix="wholeworld" name="city" value="${child.id?c}" label="${child.name}" /></li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#list>
</div>
</div>
<#elseif dialogContentName == "itSkill">
<div id="itSkill-dialog-content-pickarea">
    <div id="itSkill-dialog-selected" style="display:none;">
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
                    <input type="checkbox" class="checkbox" value="${item}" name="itSkill" id="wholeworld-q-itSkill-${item}-checkbox"><label class="checkbox" for="wholeworld-q-itSkill-${item}-checkbox">${dictMap.DICT_ITSKILL.map.get(item?number?int).name}</label>
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
                    <input type="checkbox" class="checkbox" id="wholeworld-itSkill-${item.id?c}-checkbox" name="itSkill" value="${item.id?c}" style="display:none"/><label for="wholeworld-itSkill-${item.id?c}-checkbox" class="checkbox" >${item.name}</label>
                </span>
                <#if this_index % 5 = 4 || this_index + 1 = dictMap["DICT_ITSKILL"].data?size></div></#if>
                <#assign this_index=this_index+1/>
            </#if>
        </#list>
    </div>
    <#list dictMap["DICT_ITSKILL"].data as item>
        <#if item.children?size != 0>
            <div class="lowlevel clearfix" style="display:none" id="itSkill-${item.id?c}">
                <ul class="clearfix">
                    <#list item.children as child>
                        <li class="checkable"><@checkbox prefix="wholeworld" name="itSkill" value="${child.id?c}" label="${child.name}" /></li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#list>
</div>
<#elseif dialogContentName = "cert">
<div id="cert-dialog-content-pickarea">
    <div id="cert-dialog-selected" style="display:none;">
        <h2>已选择: </h2>
        <ul class="selected clearfix"  style="width:692px"></ul>
    </div>
      <div class="pool">
        <#if englishCert??>
        <h3 class="b" style="margin-top:8px;">${englishCert.name!}:</h3>
        <div class="foldable">
        <#list englishCert.children as child>
            <#if (child.name)??>
                <span class="checkable"><input type="checkbox" value="${child.id!}" name="cert" id="wholeworld-q-cert-${child.id!}-checkbox"><label class="checkbox" for="wholeworld-q-cert-${child.id!}-checkbox">${child.name!}</label></span>
            </#if>
        </#list>
        </div>
        </#if>
        <div class="clearfix"></div>
        <#if computerCert ?? >
        <h3 class="b" style="margin-top:8px;">${computerCert.name!}:</h3>
        <div class="foldable">
        <#list computerCert.children as child>
            <#if (child.name)??>
                <span class="checkable"><input type="checkbox" value="${child.id!}" name="cert" id="wholeworld-q-cert-${child.id!}-checkbox"><label class="checkbox" for="wholeworld-q-cert-${child.id!}-checkbox">${child.name!}</label></span>
            </#if>
        </#list>
        </div>
        </#if>
          <div class="clearfix"></div>
          <#if softwareCert?? >
              <h3 class="b" style="margin-top:8px;">${softwareCert.name!}:</h3>
              <div class="foldable">
                  <#list softwareCert.children as child>
                      <#if (child.name)??>
                          <span class="checkable"><input type="checkbox" value="${child.id!}" name="cert" id="wholeworld-q-cert-${child.id!}-checkbox"><label class="checkbox" for="wholeworld-q-cert-${child.id!}-checkbox">${child.name!}</label></span>
                      </#if>
                  </#list>
              </div>
          </#if>
          <div class="clearfix"></div>
          <h3 class="b" style="margin-top:8px;">其他:</h3>
          <#assign this_index=0/>
          <#list 4..13 as index>
              <#assign item =  (dictMap.DICT_CERT.map.get(index?int))!>
              <#if item??>
              <#if this_index % 5 = 0>
              <div class="foldable"></#if>
              <span class="checkable"><input type="checkbox" value="${item.id}" name="cert" id="wholeworld-q-cert-${item.id}-checkbox"><label class="checkbox" for="wholeworld-q-cert-${item.id!}-checkbox">${item.name!}</label></span>
              <#if this_index % 5 = 4 || this_index + 1 = 10></div></#if>
              <#assign this_index=this_index+1/>
              </#if>
          </#list>
    <div class="clearfix" style="margin-top:8px;"></div>
    <#assign this_index=0/>
    <#list 14..21 as index>
        <#assign item =  (dictMap.DICT_CERT.map.get(index?int))!>
        <#if item??>
            <#if this_index % 5 = 0>
        <div class="foldable"></#if>
        <span id="${item.id?c}" class="checkable<#if item.children?size != 0> close</#if>"><input type="checkbox" id="wholeworld-cert-${item.id?c}-checkbox" name="cert" value="${item.id?c}" style="display:none"/><label for="wholeworld-cert-${item.id?c}-checkbox" class="checkbox" >${item.name!}</label></span>
        <#if this_index % 5 = 4 || this_index + 1 = 8></div></#if>
        <#assign this_index=this_index+1/>
        </#if>
    </#list>
    </div>
    <#list 14..21 as index>
        <#assign item =  dictMap.DICT_CERT.map.get(index?int)>
        <#if item.children?size != 0>
            <div class="lowlevel clearfix" style="display:none" id="cert-${item.id?c!}">
                <ul class="clearfix">
                    <#list item.children as child>
                        <li class="checkable"><@checkbox prefix="wholeworld" name="cert" value="${child.id?c!}" label="${child.name!}" /></li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#list>
</div>

<#elseif dialogContentName == "major">
<div id="major-dialog-content-pickarea">
    <div id="major-dialog-selected" style="display:none;">
        <h2>已选择: </h2>
        <ul class="selected clearfix"></ul>
    </div>
    <h2>按专业分类选择: </h2>
    <div class="pool">
    <#list dictMap["DICT_MAJOR"].data as major>
        <#if major_index % 5 = 0><div class="foldable"></#if>
                <span id="${major.id?c!}"  class="checkable<#if major.children?size != 0> close</#if>">
                    <input type="checkbox" id="wholeworld-major-${major.id?c}-checkbox" name="major" value="${major.id?c}" /><label for="wholeworld-major-${major.id?c}-checkbox" class="checkbox">${major.name}</label>
                </span>
        <#if major_index % 5 = 4 || major_index + 1 = dictMap["DICT_MAJOR"].data?size></div></#if>
        </#list>
    </div>
<#list dictMap["DICT_MAJOR"].data as major>
    <#if major.children?size != 0>
            <div class="lowlevel clearfix" style="display:none" id="major-${major.id?c}">
                <ul class="clearfix">
                    <#list major.children as child>
                        <li class="checkable"><@checkbox prefix="wholeworld" name="major" value="${child.id?c}" label="${child.name}" /></li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#list>
</div>
</div>

    <#elseif dialogContentName == "profession">

    <div id="profession-dialog-content-pickarea">
        <div id="profession-dialog-selected" style="display:none;">
            <h2>已选择: </h2>
            <ul class="selected clearfix"></ul>
        </div>
        <h2>职位类别: </h2>

        <div class="pool">
            <#list hotProfessionList as hotProfessionId>
                <#if hotProfessionId_index % 3 = 0>
                <div class="foldable"></#if>
                <#if (dictMap.DICT_PROFESSION.map.get(hotProfessionId?number?int).name)??>
                    <span id="${hotProfessionId}" class="close checkable">
                        <input type="checkbox" id="wholeworld-profession-${hotProfessionId}-checkbox" name="profession" value="${hotProfessionId}" <#if !allowSelectMajorProfession??>style="display:none"</#if>/><label for="wholeworld-city-${hotProfessionId}-checkbox" class="checkbox">${dictMap.DICT_PROFESSION.map.get(hotProfessionId?number?int).name}</label>
                    </span>
                    <#else >
                        <span id="0" class="close checkable" style="width:200px;">
                            <input type="checkbox" id="wholeworld-profession-0-checkbox" name="profession" value="0" style="display:none"/><label for="wholeworld-city-0-checkbox" class="checkbox">选择其他职位类别 (13项)</label>
                        </span>
                </#if>
                <#if hotProfessionId_index % 3 = 2 || hotProfessionId_index + 1 = hotProfessionList?size></div></#if>

            </#list>
        <#-----------      子类      ------------->
            <#list hotProfessionList as hotProfessionId>
                <#if (dictMap.DICT_PROFESSION.map.get(hotProfessionId?number?int).name)??>
                    <#assign  profession = dictMap.DICT_PROFESSION.map.get(hotProfessionId?number?int)>
                    <#if profession.children?size != 0>
                        <div class="lowlevel clearfix" style="display:none" id="profession-${profession.id?c}">
                            <ul class="clearfix">
                                <#list profession.children as child>
                                    <li class="checkable"><@checkbox prefix="wholeworld" name="profession" value="${child.id?c}" label="${child.name}" /></li>
                                </#list>
                            </ul>
                        </div>
                    </#if>
                </#if>
            </#list>
        <#-- 其他的子类 -->
            <div class="lowlevel clearfix" style="padding:10px 5px 5px 5px;display:none" id="profession-0">
                <ul class="clearfix">
                    <#list dictMap["DICT_PROFESSION"].data as profession>
                        <#if profession.parentId == 0>
                            <#assign isHot=false/>
                            <#list hotProfessionList as hotProfessionId>
                                <#if profession.id?c == hotProfessionId><#assign isHot=true/><#break></#if>
                            </#list>
                            <#if !isHot>
                                <li class="checkable" style="width:170px;"><@checkbox prefix="wholeworld" name="profession" value="${profession.id?c}" label="${profession.name}"/></li>
                            </#if>
                        </#if>
                    </#list>
                </ul>
            </div>

        </div>
    </div>



    <#elseif dialogContentName == "industry">
    <div id="industry-dialog-content-pickarea">
        <div id="industry-dialog-selected" style="display:none;">
            <h2>已选择: </h2>
            <ul class="selected clearfix"></ul>
        </div>
        <h2>行业类别: </h2>

        <div class="pool">
            <#if showHostIndustry??>
                <h3 class="b">热门行业: </h3>
                <ul class="clearfix">
                    <#list hotIndustryList as hotIndustry>
                        <#if (dictMap.DICT_INDUSTRY.map.get(hotIndustry?number?int).name)??>
                            <li class="item checkable"><input type="checkbox" name="industry" id="province-q-${hotIndustry}" value="${hotIndustry}"/><label for="province-q-${hotIndustry}" class="checkbox">${dictMap.DICT_INDUSTRY.map.get(hotIndustry?number?int).name}</label></li>
                        </#if>
                    </#list>
                </ul>
                <h3 class="b" style="margin-top:8px;">其他行业: </h3>
                <ul class="clearfix">
                    <#list dictMap["DICT_INDUSTRY"].data as industry>
                        <#assign isHot=false/>
                        <#list hotIndustryList as hotIndustry>
                            <#if industry.id?c == hotIndustry><#assign isHot=true/><#break></#if>
                        </#list>
                        <#if  !isHot>
                            <li class="item checkable"><input type="checkbox" name="industry" id="province-${industry.id?c}" value="${industry.id?c}"/><label for="province-${industry.id?c}" class="checkbox">${industry.name}</label></li>
                        </#if>
                    </#list>
                </ul>
                <div class="clearfix"></div>
                <#else>
                    <ul class="clearfix">
                        <#list dictMap["DICT_INDUSTRY"].data as industry>
                            <li class="item checkable"><input type="checkbox" name="industry" id="province-${industry.id?c}" value="${industry.id?c}"/><label for="province-${industry.id?c}" class="checkbox">${industry.name}</label></li>
                        </#list>
                    </ul>
                    <div class="clearfix"></div>
            </#if>
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
    <#if dialogContentName == "salary">
        <script type="text/javascript">
            $('#salary-dialog-content-pickarea :checkbox').click(function(){
                if($(this).attr('checked')){
                    $('#salary-dialog-content-pickarea :checkbox:checked').filter('[value!="' + $(this).val() + '"]').attr('checked', false).each(function(){
                        $('#salary-dialog-content-pickarea .selected li[rel="' + $(this).val() + '"]').remove();
                    });
                }
            });
        </script>
    </#if>
</#if>

<script type="text/javascript">
    $('#${dialogContentName}-dialog-content-pickarea .checkable :checkbox, #${dialogContentName}-dialog-content-pickarea .lowlevel :checkbox').click(function(e) {
        var sa = [];
        var isNew = true;
        var obj = $(this);
        $('#${dialogContentName}-dialog-content-pickarea').find('.selected li').each(function() {
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
        if($checkbox.parent().is('.close, .open')) $checkbox.triggerHandler('click');
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
    $('#profession-dialog-content-pickarea').find('[value="1327"], [value="1326"], [value="1340"]').attr('disabled', true);
</script>