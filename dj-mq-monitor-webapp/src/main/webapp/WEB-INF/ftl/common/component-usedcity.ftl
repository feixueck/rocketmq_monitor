<#macro cityUsedComponent usedCityList=[]>
<#assign hotCityList = ['310000','110000','440100','440300','330100','420100','510100','320100','120000','210100','610100','230100','500000','370200','370100','210200','320500'] >
<#if usedCityList?? && usedCityList?size gt 0>
    <#assign usedCitys=usedCityList>
<#else>
    <#assign usedCitys=hotCityList>
</#if>
<script type="text/javascript">
 <#assign usedCityStr=''/>
 <#assign hotCityStr=''/>
 <#assign commonCityStr=''/>
 <#if usedCitys?size gt 0>
    <#list usedCitys as usedCity>
       <#if (dictMap.DICT_CITY.map.get(usedCity?number?int).name)??>
          <#if usedCityStr?length gt 0><#assign usedCityStr=usedCityStr+','/></#if>
          <#assign usedCityStr=usedCityStr+'["${(dictMap.DICT_CITY.map.get(usedCity?number?int).name)}",${usedCity}]'/>
       </#if>
    </#list>
  </#if>
  <#if hotCityList?? && hotCityList?size gt 0>
    <#list hotCityList as hotCity>
       <#if (dictMap.DICT_CITY.map.get(hotCity?number?int).name)??>
           <#if hotCityStr?length gt 0> <#assign hotCityStr=hotCityStr+','/></#if>
           <#assign hotCityStr=hotCityStr+'["${(dictMap.DICT_CITY.map.get(hotCity?number?int).name)}",${hotCity}]'/>
      </#if>
    </#list>
  </#if>
  <#if dictMap["DICT_CITY"]?? && dictMap["DICT_CITY"]?size gt 0>
      <#list dictMap["DICT_CITY"].data as city>
          <#assign isHot=false/>
          <#list hotCityList as cityId>
              <#if city.id?c == cityId><#assign isHot=true/><#break></#if>
          </#list>
          <#if !isHot && (city.name)??>
              <#assign childCityStr=''/>
              <#if city.children?size != 0>
                  <#list city.children as child>
                     <#if child?? && child.id?? && child.name??>
                         <#if childCityStr?length gt 0><#assign childCityStr=childCityStr+','/></#if>
                         <#assign childCityStr=childCityStr+'["${child.name}",${child.id}]'/>
                     </#if>
                  </#list>
              </#if>
              <#if commonCityStr?length gt 0> <#assign commonCityStr=commonCityStr+','/></#if>
              <#assign commonCityStr=commonCityStr+'{"main":["${(city.name)}",${city.id}],"sub":[${childCityStr!}]}'/>
          </#if>
      </#list>
   </#if>
   var $cityJson = '{"used":[${usedCityStr!}],"hot":[${hotCityStr!}],"normal":[${commonCityStr!}]}';
</script>
</#macro>