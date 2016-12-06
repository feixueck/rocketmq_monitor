<input type="hidden" id="corp_ctx" value="${corp_ctx}" /> <#-- 此隐藏域供JS调用  -->
<input type="hidden" id="user_id" value="${(loginUser.uid)!}" />
<input type="hidden" id="backgroundStyle" value="${backgroundStyle!''}" />
<#if isInBlack??>
<input type="hidden" id="isInBlack" value="${isInBlack?string}" />
</#if>
<#-- 查询校友和公司雇员用 -->
<input type="hidden" id="J_corpName" value="${corpName!''}" />
<#if custom_templet_css_url??>
	<@holder>
		<link rel="stylesheet" type="text/css" href="${custom_templet_css_url}"/>
	</@holder>
</#if>
<#if custom_templet_js_url??>
	<@holder>
        <script type="text/javascript" src="${custom_templet_js_url}"></script>
	</@holder>
</#if>
<#if !backgroundStyle?? >
<div class="cor-wrap-inner banner-block">
	<#assign bannerUrl = ""/>
	<#if indexBannerUrl?? && indexBannerUrl?length == 0 >
		<#assign indexBannerUrl="http://${configs['domains.assets']}//up/corporation/i/Campus_default.jpg">
	</#if>
	<#if subPageBannerUrl?? && subPageBannerUrl?length == 0 >
		<#assign subPageBannerUrl="http://${configs['domains.assets']}//up/corporation/i/Campus_default.jpg">
	</#if>
	<#if isIndexPage?? >
		<#assign bannerUrl = indexBannerUrl!'' />
	<#else>
		<#assign bannerUrl = subPageBannerUrl!'' />
	</#if>
    <div <#if isDefaultBanner?? && isDefaultBanner>class="cor-header"<#else>style="background: url('${bannerUrl}') no-repeat 50% 0;"</#if>>
    	<#if isDefaultBanner?? && isDefaultBanner><img src="${bannerUrl}" class="cor-banner" ><#else><div style="overflow:hidden;"><img src="${bannerUrl}" class="cor-banner" style="visibility:hidden;" ></div></#if>
    </div>
</div>
</#if>
<div class="cor-wrap-inner nav-block">
    <div class="cor-nav">
        <div class="cor-logo clearfix">
            <div id="J_addFollow" class="cor-focus fr">
                <b id="J_followNum">${corp_followerCount!0}</b>人已关注
                <#if isFollowed?? && isFollowed>
                	<a class="att-item has-focus cor-icon" style="display:inline-block;" href="javascript:;" title="已关注">已关注</a>
                <#else>
                	<a title="加关注" href="javascript:;" style="display:inline-block;" class="att-item cor-icon add-focus ">加关注</a>	
                </#if>
                <#if isCorpAdmin?? && isCorpAdmin>
                	<a title="管理" href="${corp_ctx}/manage/log" id="J_mgBtn" class="ctrl-item cor-icon icon-mag cor-mag ">管理</a>
                </#if>
             </div>
            <div class="logo" id="J_adminJusty"><!--type = 1 管理员模式-->
                <div class="inner"  mgtype="1">
                	<#assign logo="${CorpLogoUrlEnum.CORP_DEFAULT_LOGO_1X1_LARGE.url}">
                	<#if current_corp?? && current_corp.logoUpload?? && current_corp.logoUpload && current_corp.logo11Large??>
                		<#assign logo="${current_corp.logo11Large}">
                	</#if>
                	<img src="${logo}" class="">
                </div>
            </div>
            <h1><#if current_corp?? && current_corp.name??>${current_corp.name}<#else>公司名称</#if><#if navType?? && navType == NavTypeEnum.SCHOOL_NAV><span class="cor-icon icon-ban">校园版</span></#if></h1>
        	<div class="dj-welfare-ad"></div>
        </div>
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
</div>

<#-- 宋平辉 -->
<#if current_corp?? && (current_corp.id == 3491454)>
<#assign noShowLogin=true >
</#if> 
