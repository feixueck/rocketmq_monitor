<input type="hidden" id="corp_ctx" value="${corp_ctx}" /> <#-- 此隐藏域供JS调用  -->
<input type="hidden" id="user_id" value="${(loginUser.uid)!}" />
<#--
<input type="hidden" id="backgroundStyle" value="${backgroundStyle!''}" />-->
<#if isInBlack??>
<input type="hidden" id="isInBlack" value="${isInBlack?string}" />
</#if>
<#-- 查询校友和公司雇员用 -->
<input type="hidden" id="J_corpName" value="${corpName!''}" />

    <div class="search-index clearfix">
        <div class="crumbs-nav fl">
            <span>当前位置：</span>
            <a href="/corp/gongsi/">公司索引</a>
            <span> &gt; </span>
            <a href="/corp-s/c_0_0_0_0">公司筛选</a>
        </div>
    </div>
    
<div class="cor-wrap-inner nav-block">
	<div class="cor-nav">
        <ul id="J_corNav" class="nav-list clearfix">
				  		 	<li><a href="${corp_ctx}" <#if pro_cur_nav == "index">class="cur"</#if>>公司首页</a></li>
				  		 	<li><a href="${corp_ctx}/joinus" <#if pro_cur_nav == "joinus">class="cur"</#if>>在招职位</a></li>
				  		 	<li><a href="${corp_ctx}/insight" <#if pro_cur_nav == "insight">class="cur"</#if>>雇员分析</a></li>
				  		 	<li><a href="${corp_ctx}/comment" <#if pro_cur_nav == "comment">class="cur"</#if>>公司点评</a></li>
				  		 	<li><a href="${corp_ctx}/interviewexper" <#if pro_cur_nav == "interviewexper">class="cur"</#if>>面试经验</a></li>
				  		 	<li><a href="${corp_ctx}/welfare" <#if pro_cur_nav == "welfare">class="cur"</#if>>公司福利</a></li>
        </ul>
    </div>
    <#--
    <div class="cor-nav">
        <ul class="nav-list clearfix" id="J_corNav">
		<#if corpNavs??>
		  <#assign charSize=0>
		  <#assign printed = false>
		  <#assign moreHighLight = true>
		  <#assign openNewPage = false>	  
		  <#list corpNavs as nav>
		  		<#if nav.isDisplay >
				  	<#if nav.tabCode?contains('guide') || nav.tabCode?contains('outerLink')>
				  		<#assign openNewPage = true>
				  	<#else>
				  		<#assign openNewPage = false>
				  	</#if>
			  		<#if nav.subCorpNavList?? >
			  			<#if charSize gt 33>
			  				<#if !printed>
				  				<li class="more-select"><a href="##" class="more-tab cor-icon icon-dc <#if moreHighLight>cur</#if>">更多</a>
		                			<ul class="hide-tab">
				  				<#assign printed = true>
		  					</#if>
		  					<#list  nav.subCorpNavList as subNav>
								<li>
									<a href="${corp_ctx}/${subNav.tabCode}" <#if openNewPage>target="_blank"</#if>>${subNav.name}</a>
								</li>
							</#list>
			  			<#else>
					  		<li class="more-select xz-select">
					  		
		  					<#if nav.tabCode == 'index'>
								<a class="cor-icon icon-dc <#if nav.isCurrentPage?? && nav.isCurrentPage()>cur</#if>" href="${corp_ctx}">${nav.name}</a>
		  					<#else>
								<a class="cor-icon icon-dc <#if nav.isCurrentPage?? && nav.isCurrentPage()>cur</#if>" href="${corp_ctx}/${nav.tabCode}">${nav.name}</a>
		  					</#if>
		  					
								<ul class="hide-tab" style="display: none;">
								<#list  nav.subCorpNavList as subNav>
									<li>
										<a href="${corp_ctx}/${subNav.tabCode}" <#if openNewPage>target="_blank"</#if>>${subNav.name}</a>
									</li>
								</#list>
					  		 	</ul>
					  		 </li>
					  		 <#assign charSize = charSize + nav.name?length>
					  		 <#if nav.isCurrentPage?? && nav.isCurrentPage()>
			  		 			<#assign moreHighLight = false>
			  		 		</#if>
			  			</#if>
			  		<#else>
		  				<#if charSize gt 33>
		  					<#if !printed>
				  				<li class="more-select"><a href="##" class="more-tab cor-icon icon-dc <#if moreHighLight>cur</#if>">更多</a>
		                			<ul class="hide-tab">
				  				<#assign printed = true>
		  					</#if>
		  					<#if nav.tabCode == 'index'>
	  						<li><a href="${corp_ctx}" <#if openNewPage>target="_blank"</#if>>${nav.name}</a></li>
		  					<#else>
	  						<li><a href="${corp_ctx}/${nav.tabCode}" <#if openNewPage>target="_blank"</#if>>${nav.name}</a></li>
		  					</#if>
			  			<#else>
		  					<#if nav.tabCode == 'index'>
				  		 	<li><a href="${corp_ctx}" <#if openNewPage>target="_blank"</#if><#if nav.isCurrentPage?? && nav.isCurrentPage()> class="cur" </#if>>${nav.name}</a></li>
		  					<#else>
				  		 	<li><a href="${corp_ctx}/${nav.tabCode}" <#if openNewPage>target="_blank"</#if><#if nav.isCurrentPage?? && nav.isCurrentPage()> class="cur" </#if>>${nav.name}</a></li>
		  					</#if>
			  				<#if nav.isCurrentPage?? && nav.isCurrentPage()>
			  		 			<#assign moreHighLight = false>
			  		 		</#if>
			  		 	</#if>
		  				<#assign charSize = charSize + nav.name?length>
			  		</#if> 
		  		</#if>
		  </#list>
		  <#if printed>
		  					</ul>
		  				</li>
		  </#if>
		 </#if>
        </ul>
    </div>
    -->
</div>

<#-- 宋平辉 -->
<#if current_corp?? && (current_corp.id == 3491454)>
<#assign noShowLogin=true >
</#if> 
