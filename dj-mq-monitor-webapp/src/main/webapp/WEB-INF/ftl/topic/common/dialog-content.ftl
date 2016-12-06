<#assign hotCityList = ['310000','110000','440100','440300','330100','420100','510100','320100','120000','210100','610100','230100','500000','370200','370100','210200','320500'] >
<#assign hotProfessionList = ['1329','1331','1328','1335','1333','1322','1326','1334','1323','1341','1338','1337','1354','1336','1342','1327','1325','1340','0'] >
<#assign hotIndustryList = ['2','26','20','4','7','19','36','1','37','8','6','3','30','5','23']>
<#if dialogContentName == "city">
<div id="city-dialog-content-pickarea">
    <div id="city-dialog-selected" style="display:none;">
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
                    <input type="checkbox" id="wholeworld-city-${city.id?c}-checkbox" name="city" value="${city.id?c}" <#if allowSelectProvince??><#else> style="display:none; *display:inline-block; *width:0; *height:0;"</#if>/><label for="wholeworld-city-${city.id?c}-checkbox" class="checkbox">${city.name}</label>
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
                <span id="${major.id?c}"  class="checkable<#if major.children?size != 0> close</#if>">
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

<#elseif dialogContentName == "newMajor">
<div id="${dialogContentName}-dialog-content-pickarea">
    <div id="${dialogContentName}-dialog-selected" style="display:none;">
        <h2>已选择: </h2>
        <ul class="selected clearfix"></ul>
    </div>
    <div class="pool  scroll-hack" style="height:250px;">
        <table class="item-list-table" width="100%">
            <colgroup>
                <col width="120">
                <col width="*">
            </colgroup>
            <#list dictMap["DICT_MAJOR"].data as newMajor>
                <tr <#if newMajor_index % 2 = 0>class="odd"</#if>>
                    <th>${newMajor.name!}:</th>
                    <td>
                        <ul class="clearfix item-list">
                            <#list dictMap.DICT_MAJOR.map.get(newMajor.id).children as major>
                                <li class="item checkable"><input type="checkbox" name="${dialogContentName}"
                                                                  id="new_major-${major.id?c}"
                                                                  value="${major.id?c}"/><label
                                        for="new_major-${major.id?c}" class="checkbox">${major.name}</label></li>
                            </#list>
                        </ul>
                    </td>
                </tr>
            </#list>
        </table>
    </div>
</div>

    <#elseif dialogContentName?starts_with("profession")>

    <div id="${dialogContentName}-dialog-content-pickarea">
        <div id="${dialogContentName}-dialog-selected" style="display:none;">
            <h2>已选择: </h2>
            <ul class="selected clearfix"></ul>
        </div>
        <div class="pool">
            <#list hotProfessionList as hotProfessionId>
                <#if hotProfessionId_index % 3 = 0>
                <div class="foldable"></#if>
                <#if (dictMap.DICT_PROFESSION.map.get(hotProfessionId?number?int).name)??>
                    <span id="${hotProfessionId}" class="close checkable">
                        <input type="checkbox" id="wholeworld-${dialogContentName}-${hotProfessionId}-checkbox" name="${dialogContentName}" value="${hotProfessionId}" <#if !allowSelectMajorProfession??>style="display:none"</#if>/><label for="wholeworld-city-${hotProfessionId}-checkbox" class="checkbox">${dictMap.DICT_PROFESSION.map.get(hotProfessionId?number?int).name}</label>
                    </span>
                    <#else >
                        <span id="0" class="close checkable" style="width:200px;">
                            <input type="checkbox" id="wholeworld-${dialogContentName}-0-checkbox" name="${dialogContentName}" value="0" style="display:none"/><label for="wholeworld-${dialogContentName}-0-checkbox" class="checkbox">选择其他职位类别 (13项)</label>
                        </span>
                </#if>
                <#if hotProfessionId_index % 3 = 2 || hotProfessionId_index + 1 = hotProfessionList?size></div></#if>

            </#list>
        <#-----------      子类      ------------->
            <#list hotProfessionList as hotProfessionId>
                <#if (dictMap.DICT_PROFESSION.map.get(hotProfessionId?number?int).name)??>
                    <#assign  profession = dictMap.DICT_PROFESSION.map.get(hotProfessionId?number?int)>
                    <#if profession.children?size != 0>
                        <div class="lowlevel clearfix" style="display:none" id="${dialogContentName}-${profession.id?c}">
                            <ul class="clearfix">
                                <#list profession.children as child>
                                    <li class="checkable"><@checkbox prefix="wholeworld" name="${dialogContentName}" value="${child.id?c}" label="${child.name}" /></li>
                                </#list>
                            </ul>
                        </div>
                    </#if>
                </#if>
            </#list>
        <#-- 其他的子类 -->
            <div class="lowlevel clearfix" style="padding:10px 5px 5px 5px;display:none" id="${dialogContentName}-0">
                <ul class="clearfix">
                    <#list dictMap["DICT_PROFESSION"].data as profession>
                        <#if profession.parentId == 0>
                            <#assign isHot=false/>
                            <#list hotProfessionList as hotProfessionId>
                                <#if profession.id?c == hotProfessionId><#assign isHot=true/><#break></#if>
                            </#list>
                            <#if !isHot>
                                <li class="checkable" style="width:170px;"><@checkbox prefix="wholeworld" name="${dialogContentName}" value="${profession.id?c}" label="${profession.name}"/></li>
                            </#if>
                        </#if>
                    </#list>
                </ul>
            </div>

        </div>
    </div>

    <#elseif dialogContentName == "campus-profession">
        <div id="campus-profession-dialog-content-pickarea">
            <div id="campus-profession-dialog-selected" style="display:none;">
                <h2>已选择: </h2>
                <ul class="selected clearfix"></ul>
            </div>
            <div class="pool">
                <ul class="clearfix">
                    <#list dictMap["DICT_PROFESSION_CAMPUS"].data as campusProfession>
                        <#if campusProfession.parentId == 0>
                            <li class="item checkable"><input type="checkbox" name="campus-profession" id="campus-profession-${campusProfession.id?c}" value="${campusProfession.id?c}"/><label for="campus-profession-${campusProfession.id?c}" class="checkbox">${campusProfession.name}</label></li>
                        </#if>
                    </#list>
                </ul>
                <div class="clearfix"></div>
            </div>
        </div>
    <#elseif dialogContentName == "position-profession">
        <div id="${dialogContentName}-dialog-content-pickarea">
            <div id="${dialogContentName}-dialog-selected" style="display:none;">
                <h2>已选择: </h2>
                <ul class="selected clearfix"></ul>
            </div>
            <div class="pool">
                <ul class="clearfix">
                    <#list dictMap["DICT_POSITION_FUNCTION"].data as profession>
                        <#if profession.parentId == 0>
                            <li class="item checkable" rel="${profession.id?c}"><input type="radio" name="${dialogContentName}" id="${dialogContentName}-${profession.id?c}" value="${profession.id?c}"/><label for="${dialogContentName}-${profession.id?c}" class="radio">${profession.name}</label></li>
                        </#if>
                    </#list>
                </ul>
                <#--<div class="clearfix"></div>-->
            </div>
        </div>
        <#elseif dialogContentName == "position-profession-checkbox">
            <div id="${dialogContentName}-dialog-content-pickarea">
                <div id="${dialogContentName}-dialog-selected" style="display:none;">
                    <h2>已选择: </h2>
                    <ul class="selected clearfix"></ul>
                </div>
                <div class="pool">
                    <ul class="clearfix">
                        <#list dictMap["DICT_POSITION_FUNCTION"].data as profession>
                            <#if profession.parentId == 0>
                                <li class="item checkable" rel="${profession.id?c}"><input type="checkbox" name="${dialogContentName}" id="${dialogContentName}-${profession.id?c}" value="${profession.id?c}"/><label for="${dialogContentName}-${profession.id?c}" class="radio">${profession.name}</label></li>
                            </#if>
                        </#list>
                    </ul>
                <#--<div class="clearfix"></div>-->
            </div>
        </div>

    <#elseif dialogContentName == "industry">
    <div id="industry-dialog-content-pickarea">
        <div id="industry-dialog-selected" style="display:none;">
            <h2>已选择: </h2>
            <ul class="selected clearfix"></ul>
        </div>
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
<#elseif dialogContentName == "newindustry"  || dialogContentName == "positionIndustry" >
    <div id="${dialogContentName}-dialog-content-pickarea">
        <div id="${dialogContentName}-dialog-selected" style="display:none;">
            <h2>已选择: </h2>
            <ul class="selected clearfix"></ul>
        </div>
        <div class="pool" style="height:250px; overflow-y:scroll;">
                <#list dictMap["DICT_POSITION_INDUSTRY"].data as newindustry>
                <h3 class="b" style="margin-top:8px;">${newindustry.name!}: </h3>
                <ul class="clearfix">
                    <#list dictMap.DICT_POSITION_INDUSTRY.map.get(newindustry.id).children as industry>
                        <li class="item checkable" style="width:150px;"><input type="checkbox" name="${dialogContentName}" id="province-${industry.id?c}" value="${industry.id?c}"/><label for="province-${industry.id?c}" class="checkbox">${industry.name}</label></li>
                    </#list>
                </ul>
                <#--<div class="clearfix"></div>-->
                </#list>
        </div>
    </div>
<#elseif dialogContentName == "newindustrychechbox">
    <div id="${dialogContentName}-dialog-content-pickarea">
        <div id="${dialogContentName}-dialog-selected" style="display:none;">
            <h2>已选择: </h2>
            <ul class="selected clearfix"></ul>
        </div>
        <div class="pool  scroll-hack" style="height:250px;">
            <table class="item-list-table" width="100%">
                <colgroup>
                    <col width="120">
                    <col width="*">
                </colgroup>
                <#list dictMap["DICT_POSITION_INDUSTRY"].data as newindustry>
                <tr <#if newindustry_index % 2 = 0>class="odd"</#if>>
                    <th>${newindustry.name!}: </th>
                    <td>
                        <ul class="clearfix item-list">
                    <#list dictMap.DICT_POSITION_INDUSTRY.map.get(newindustry.id).children as industry>
                        <li class="item checkable" ><input type="checkbox" name="${dialogContentName}" id="province-${industry.id?c}" value="${industry.id?c}"/><label for="province-${industry.id?c}" class="checkbox">${industry.name}</label></li>
                    </#list>
                </ul>
                    </td>
                </tr>
                </#list>
            </table>
        </div>
    </div>
<#elseif dialogContentName == "newindustryradio">
    <div id="${dialogContentName}-dialog-content-pickarea">
        <div id="${dialogContentName}-dialog-selected" style="display:none;">
            <h2>已选择: </h2>
            <ul class="selected clearfix"></ul>
        </div>
        <div class="pool  scroll-hack" style="height:250px;">
            <table class="item-list-table" width="100%">
                <colgroup>
                    <col width="120">
                    <col width="*">
                </colgroup>
                <#list dictMap["DICT_POSITION_INDUSTRY"].data as newindustry>
                <tr <#if newindustry_index % 2 = 0>class="odd"</#if>>
                    <th>${newindustry.name!}: </th>
                    <td>
                        <ul class="clearfix item-list">
                    <#list dictMap.DICT_POSITION_INDUSTRY.map.get(newindustry.id).children as industry>
                        <li class="item checkable" rel="${industry.id?c}"><input type="radio" name="${dialogContentName}" id="province-${industry.id?c}" value="${industry.id?c}"/><label for="province-${industry.id?c}" class="radio">${industry.name}</label></li>
                    </#list>
                </ul>
                    </td>
                </tr>
                </#list>
            </table>
        </div>
    </div>
<#elseif dialogContentName == "school">
    <div id="school-dialog-content-pickarea">
        <div id="school-dialog-selected" style="display:none;margin-bottom: 6px;">
            <h2>已选择: </h2>
            <ul class="selected clearfix"></ul>
        </div>
        <div class="filters clearfix">
            <label class="b" style="float:left;padding: 3px 0">目标院校: &nbsp;</label>
            <ul class="selecting" style="float:left">
                <li id="selecting-1" class="itemming" style="width:170px;">
                    <span><p>不限地区</p></span>
                    <div class="subpane dot-line" style="width:150px;display:none;">
                        <a href="javascript:void(0);" class="city" rel="310000">上海</a>
                        <a href="javascript:void(0);" class="city" rel="110000">北京</a>
                        <a href="javascript:void(0);" class="city" rel="120000">天津</a>
                        <a href="javascript:void(0);" class="city" rel="500000">重庆</a>
                        <p>&nbsp;</p>
                        <a href="javascript:void(0);" class="city" rel="220000">吉林</a>
                        <a href="javascript:void(0);" class="city" rel="510000">四川</a>
                        <a href="javascript:void(0);" class="city" rel="370000">山东</a>
                        <a href="javascript:void(0);" class="city" rel="440000">广东</a>
                        <a href="javascript:void(0);" class="city" rel="320000">江苏</a>
                        <a href="javascript:void(0);" class="city" rel="130000">河北</a>
                        <a href="javascript:void(0);" class="city" rel="410000">河南</a>
                        <a href="javascript:void(0);" class="city" rel="330000">浙江</a>
                        <a href="javascript:void(0);" class="city" rel="420000">湖北</a>
                        <a href="javascript:void(0);" class="city" rel="350000">福建</a>
                        <a href="javascript:void(0);" class="city" rel="210000">辽宁</a>
                        <a href="javascript:void(0);" class="city" rel="610000">陕西</a>
                        <a href="javascript:void(0);" class="city" rel="430000">湖南</a>
                        <a href="javascript:void(0);" class="city" rel="530000">云南</a>
                        <a href="javascript:void(0);" class="city" rel="140000">山西</a>
                        <a href="javascript:void(0);" class="city" rel="340000">安徽</a>
                        <a href="javascript:void(0);" class="city" rel="360000">江西</a>
                        <a href="javascript:void(0);" class="city" rel="450000">广西</a>
                        <a href="javascript:void(0);" class="city" rel="460000">海南</a>
                        <a href="javascript:void(0);" class="city" rel="520000">贵州</a>
                        <a href="javascript:void(0);" class="city" rel="620000">甘肃</a>
                        <a href="javascript:void(0);" class="city" rel="630000">青海</a>
                        <a href="javascript:void(0);" class="city" rel="640000">宁夏</a>
                        <a href="javascript:void(0);" class="city" rel="540000">西藏</a>
                        <a href="javascript:void(0);" class="city" rel="650000">新疆</a>
                        <a href="javascript:void(0);" class="city" rel="230000">黑龙江</a>
                        <a href="javascript:void(0);" class="city" rel="150000">内蒙古</a>
                        <a href="javascript:void(0);" class="city" rel="800000">港澳台</a>
                        <a href="javascript:void(0);" class="city" rel="810000">海外</a>
                        <a href="javascript:void(0);" class="city" rel="999999">其他</a>
                        &nbsp;
                        <a href="javascript:void(0);" class="city" rel="0">不限地区</a>
                    </div>
                </li>
                <li id="selecting-2" class="itemming" style="width:110px;"><span><p>不限等级</p></span>
                    <div class="subpane" style="width:90px;display:none;">
                        <a href="javascript:void(0);" class="level" rel="1">985院校</a><br />
                        <a href="javascript:void(0);" class="level" rel="2">211院校</a><br />
                        <a href="javascript:void(0);" class="level" rel="3">普通一本院校</a><br />
                        <a href="javascript:void(0);" class="level" rel="4">普通二本院校</a><br />
                        <a href="javascript:void(0);" class="level" rel="5">普通三本院校</a><br />
                        <a href="javascript:void(0);" class="level" rel="6">高职高专</a><br />
                        <a href="javascript:void(0);" class="level" rel="7">成人高校及其他</a><br />
                        <a href="javascript:void(0);" class="level" rel="8">重点研究生院</a><br />
                        <a href="javascript:void(0);" class="level" rel="10">全球知名院校</a><br />
                        <a href="javascript:void(0);" class="level" rel="0">不限等级</a>
                    </div>
                </li>
                <li id="selecting-3" class="itemming" style="width:80px;"><span><p>不限类型</p></span>
                    <div class="subpane" style="width:60px;display:none;"> 
                        <a href="javascript:void(0);" class="type" rel="1">体育类</a><br />
                        <a href="javascript:void(0);" class="type" rel="2">农林类</a><br />
                        <a href="javascript:void(0);" class="type" rel="3">医科类</a><br />
                        <a href="javascript:void(0);" class="type" rel="4">军事类</a><br />
                        <a href="javascript:void(0);" class="type" rel="5">外语类</a><br />
                        <a href="javascript:void(0);" class="type" rel="6">师范类</a><br />
                        <a href="javascript:void(0);" class="type" rel="7">政法类</a><br />
                        <a href="javascript:void(0);" class="type" rel="8">民族类</a><br />
                        <a href="javascript:void(0);" class="type" rel="9">理工类</a><br />
                        <a href="javascript:void(0);" class="type" rel="10">综合类</a><br />
                        <a href="javascript:void(0);" class="type" rel="11">艺术类</a><br />
                        <a href="javascript:void(0);" class="type" rel="12">财经类</a><br />
                        <a href="javascript:void(0);" class="type" rel="0">不限类型</a>
                    </div>
                </li>
            </ul>
        </div>
        <div class="pool scrollable" style="border: solid 1px #ccc; padding: 8px;margin-top: 8px;height:254px;">
            <ul class="content-data" style="display:none">
                 <li class="checkable"><input type="checkbox" name="school" id="school--1" value="-1"/><label id="label--1" for="school--1" class="checkbox"></label></li>
            </ul>
            <ul class="content">
                
            </ul>
        </div>
     </div>
     <@holder>
     <script type="text/javascript">
     (function(){
        populateSchools($.schools.slice(0, 300));
        $('#school-dialog-content-pickarea .selecting .itemming').hover(function(){
            $(this).find('.subpane').show();
        }, function(){
            $(this).find('.subpane').hide();
        });
        $('#school-dialog-content-pickarea .selecting .itemming .subpane a').click(function(){
           $(this).parents('.itemming').data('value', $(this).attr('rel')).find('span p').text($(this).text());
           $(this).parents('.subpane').hide();
           var result = $.schools;
           var v1 = $('#selecting-1').data('value'), v2= $('#selecting-2').data('value'), v3 = $('#selecting-3').data('value');
           if(v1 && v1 != '0'){
                result = $(result).filter(function(){return this.city == v1});
           }
           if(v2 && v2 != '0'){
                result = $(result).filter(function(){return this.level == v2});
           }
           if(v3 && v3 != '0'){
                result = $(result).filter(function(){return $.inArray(v3, this.type.split(',')) != -1});
           }
           if(result.length > 500) result = result.slice(0, 500);
           populateSchools(result);
            $('#school-dialog-content-pickarea .selected li').each(function() {
                $('#school-dialog-content-pickarea ul.content :checkbox[value="' + $(this).attr('rel') + '"]').attr('checked', true);
            });
            $('#school-dialog-content-pickarea ul.content :checkbox').click(function(){
                __simulateCheck__($(this).val(), $(this).next().text(), $(this).attr('checked'));
            });
        });

        function populateSchools(data){
            var html = '';
            $(data).each(function(){
                html += '<li class="item checkable"><input type="checkbox" name="school" id="school-' + this.id + '" value="' + 
                    this.id + '"/><label for="school-' + this.id + '" class="checkbox">' + this.name + '</label></li>'
            });
            $('#school-dialog-content-pickarea ul.content').empty().html(html);
        }
     })();
     function __simulateCheck__(id, text, checked){
            $('#label--1').text(text);
            $('#school--1').attr('value', id).attr('checked', checked).triggerHandler('click');
     }
     function onAfterPickpadLoad($dialog, value){
         var pined = $dialog.find('.selected li').map(function(){return parseInt($(this).attr('rel'))});
         $(value).each(function(){
            var v = parseInt(this);
            if($.inArray(v, pined) != -1) return;
            var n = $.grep($.schools, function(item){return item.id == v})[0].name;
            __simulateCheck__(v, n, true);
         });
     }
     </script>
     </@holder>
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
    <#if dialogContentName == "salary" || dialogContentName == "experience">
        <script type="text/javascript">
            $('#${dialogContentName!"salary"}-dialog-content-pickarea :checkbox').click(function(){
                if($(this).attr('checked')){
                    $('#${dialogContentName!"salary"}-dialog-content-pickarea :checkbox:checked').filter('[value!="' + $(this).val() + '"]').attr('checked', false).each(function(){
                        $('#${dialogContentName!"salary"}-dialog-content-pickarea .selected li[rel="' + $(this).val() + '"]').remove();
                    });
                }
            });
        </script>
    </#if>
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
    } , 400);

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
    $('#${dialogContentName}-dialog-content-pickarea').find('[value="1327"], [value="1326"], [value="1340"]').attr('disabled', true);
</script>
