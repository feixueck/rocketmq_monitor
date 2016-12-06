  <#macro corpicon job={"corpRank":0}  corpiconSize="s" showMember="y">
      <#if (job.corpRank)?? && job.corpRank gt 0>
         <#if  corpiconSize == "s" >
             <#if job.isTop500() >
             <img src="<@url>/images/icons/fortune-16.gif</@url>" align="absmiddle" title="世界500强"/>
                 <#elseif (job.isStock())>
                 <img src="<@url>/images/icons/quoted-16.gif</@url>" align="absmiddle" title="上市公司"/>
             </#if>
         <#if (job.isMember()) && showMember == "y">
                 <img src="<@url>/images/icons/member-16.gif</@url>" align="absmiddle" title="大街会员企业"/>
         </#if>
         <#else >
            <#if job.isTop500() >
             <img src="<@url>/images/icons/fortune-32.gif</@url>" align="absmiddle" title="世界500强"/>
                     <#elseif (job.isStock())>
                     <img src="<@url>/images/icons/quoted-32.gif</@url>" align="absmiddle" title="上市公司"/>
            </#if>
             <#if (job.isMember()) && showMember == "y">
                     <img src="<@url>/images/icons/member-32.gif</@url>" align="absmiddle" title="大街会员企业"/>
             </#if>
         </#if>
      </#if>
</#macro>
