<#assign hasDiscuss = false>
<#if isSpecialCorp?? && isSpecialCorp>
	<#include "corp_header_compat_custom.ftl">
<#else>
<input type="hidden" id="corp_ctx" value="${corp_ctx}" /> <#-- 此隐藏域供JS调用  -->
<input type="hidden" id="user_id" value="${(loginUser.uid)!}" />
<input type="hidden" id="backgroundStyle" value="${backgroundStyle!''}" />
<#if isInBlack??>
<input type="hidden" id="isInBlack" value="${isInBlack?string}" />
</#if>
<#-- 查询校友和公司雇员用 -->
<input type="hidden" id="J_corpName" value="${corpName!''}" />



<#if !backgroundStyle?? >
	<#assign bannerUrl = ""/>
	<#if isIndexPage?? >
		<#assign bannerUrl = indexBannerUrl!'' />
	<#else>
		<#assign bannerUrl = subPageBannerUrl!'' />
	</#if>
	<#-- 默认首页   -->
	<#if isDefaultBanner?? && isDefaultBanner>
	<div class="cor-warp-outer">
	<#else>
	<#-- banner   -->
	<@csselement file='/up/corporation/skin_css/headpic.css' />
	<#if bannerUrl!=''>
	<#-- 有首页banner 有子页banner   -->
	<div class="cor-warp-outer" style="background: url('${bannerUrl}') center 0 no-repeat;">
	<div style="overflow:hidden;">
    <img src="${bannerUrl}" class="cor-banner" style="visibility:hidden;">
    </div>
	<#else>
	<#-- 有首页banner 无子页banner   -->
	<div class="cor-warp-outer">
	<div style="overflow:hidden;height: 154px;background: transparent;">
	</div>
	</#if>
	</#if>
<#else>
<#-- background style   -->
   <div class="cor-warp-outer">
	<@csselement file='/up/corporation/skin_css/whole-bg-pic.css'/>
</#if>

    <div class="cor-wrap-inner nav-block">
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
<#-- ColorSet -->
<#if colorset??>
<@csselement file='/up/corporation/skin_css/${colorset}.css' />
</#if>
<#-- ColorSetEnd -->

        <div class="cor-nav clearfix">
        <div class="cor-nav-bottom-shadow"></div>
            <div class="cor-logo-img">
                    <#assign logo="${CorpLogoUrlEnum.CORP_DEFAULT_LOGO_1X1_LARGE.url}">
                	<#if current_corp?? && current_corp.logoUpload?? && current_corp.logoUpload && current_corp.logo11Large??>
                		<#assign logo="${current_corp.logo11Large}">
                	</#if>
                <img src="${logo}" alt="">
            </div>


            <div class="half-opacity-box"></div>


            <div class="cor-box-right clearfix">
                <div class="cor-logo clearfix">
                			<#if isCorpAdmin?? && isCorpAdmin>
                			<a href="${corp_ctx}/manage/log" id="J_mgBtn" class="style-setting"></a>
                			</#if>  
                    <!-- <span class="cor-focus">
                        <em>13424</em>人已关注
                        <i></i>
                        <a href="javascript:;" class="att-item add-focus cor-icon"></a>
                    </span> -->
					<#if currentChannel?? && currentChannel=="CORP" && (!corpTalentStatus?? || !corpTalentStatus)>
                    <div id="J_addFollow" class="cor-focus">
                        <b id="J_followNum">${corp_followerCount!0}</b>人已关注
                            <#if isFollowed?? && isFollowed>
                	        <a class="att-item has-focus" style="display:inline-block;" href="javascript:;" title="已关注">已关注</a>
                            <#else>
                            <a title="加关注" href="javascript:;" style="display:inline-block;" class="att-item add-focus ">加关注</a>	
                            </#if>

                     </div>
					</#if>
                    <h1><#if current_corp?? && current_corp.name??>${current_corp.name}<#else>公司名称</#if><#if navType?? && navType == NavTypeEnum.SCHOOL_NAV><span class="l-icon-content"><i></i>校园版</span></#if></h1>
                </div>
                <ul class="nav-list clearfix" id="J_corNav">
            <#if corpNavs??>
		  <#assign charSize=0>
		  <#assign printed = false>
		  <#assign moreHighLight = true>
		  <#assign openNewPage = false>	  
		  <#assign seq=0>
		  <#assign lenn="com.dajie.corp.common.interceptor.util.FtlGetCharNum"?new()>
		  <#-- 这里声明计算长度的函数    -->
		  <#list corpNavs as nav>
		  		<#if nav.isDisplay >
		  		<#assign seq=seq+1>
		  			<#if nav.tabCode?contains('discuss')>
		  				<#assign hasDiscuss = true>
				  	</#if>
		  		
				  	<#if nav.tabCode?contains('guide') || nav.tabCode?contains('outerLink')>
				  		<#assign openNewPage = true>
				  	<#else>
				  		<#assign openNewPage = false>
				  	</#if>
			  		<#if nav.subCorpNavList?? >
			  			<#if charSize gt 260>
			  				<#if !printed>
				  				<li class="more-select"><a href="##" class="more-tab  icon-dc <#if moreHighLight>cur</#if>">更多<i></i></a>
		                			<ul class="hide-tab" style="min-width:127px; display: none;">
				  				<#assign printed = true>

		  					</#if>
		  					<#list  nav.subCorpNavList as subNav>
								<li>
									<a href="${corp_ctx}/${subNav.tabCode}" <#if openNewPage>target="_blank"</#if>>${subNav.name}</a>
								</li>
							</#list>
							<#--  有下拉列表的因为有小箭头会多占一个位置    -->
							<#assign charSize = charSize + lenn(nav.name) + 10>
			  			<#else>
			  				<#if nav.tabCode == 'index'>
					  		<li class="more-select xz-select <#if seq==1>nav-list-first</#if>">
								<a class="icon-dc <#if nav.isCurrentPage?? && nav.isCurrentPage()>cur</#if>" href="${corp_ctx}">${nav.name}<i></i></a>
		  					<#else>
		  					<li class="more-select xz-select <#if seq==1>nav-list-first</#if> ">
								<a class="icon-dc <#if nav.isCurrentPage?? && nav.isCurrentPage()>cur</#if>" href="${corp_ctx}/${nav.tabCode}">${nav.name}<i></i></a>
		  					</#if>
		  					
								<ul class="hide-tab" style="display: none;">
								<#list  nav.subCorpNavList as subNav>
									<li>
										<a href="${corp_ctx}/${subNav.tabCode}" <#if openNewPage>target="_blank"</#if>>${subNav.name}</a>
									</li>
								</#list>
					  		 	</ul>
					  		 </li>
					  		 <#--  有下拉列表的因为有小箭头会多占一个位置    -->
							<#assign charSize = charSize + lenn(nav.name) + 10>
					  		 <#if nav.isCurrentPage?? && nav.isCurrentPage()>
			  		 			<#assign moreHighLight = false>
			  		 		</#if>
			  			</#if>
			  		<#else>
		  				<#if charSize gt 260>
		  					<#if !printed>
				  				<li class="more-select "><a href="##" class="more-tab icon-dc <#if moreHighLight>cur</#if>">更多<i></i></a>
		                			<ul class="hide-tab" style="min-width:127px; display: none;">
				  				<#assign printed = true>
		  					</#if>
		  					<#if nav.tabCode == 'index'>
	  						<li><a href="${corp_ctx}" <#if openNewPage>target="_blank"</#if>>${nav.name}</a></li>
		  					<#else>
	  						<li><a href="${corp_ctx}/${nav.tabCode}" <#if openNewPage>target="_blank"</#if>>${nav.name}</a></li>
		  					</#if>
		  					<#--  有下拉列表的因为有小箭头会多占一个位置    -->
							<#assign charSize = charSize + lenn(nav.name) + 10>
			  			<#else>
		  					<#if nav.tabCode == 'index'>
				  		 	<li class="<#if seq==1>nav-list-first</#if>"><a href="${corp_ctx}" <#if openNewPage>target="_blank"</#if><#if nav.isCurrentPage?? && nav.isCurrentPage()> class="cur" </#if>>${nav.name}</a></li>
		  					<#else>
				  		 	<li class="<#if seq==1>nav-list-first</#if>"><a href="${corp_ctx}/${nav.tabCode}" <#if openNewPage>target="_blank"</#if><#if nav.isCurrentPage?? && nav.isCurrentPage()> class="cur" </#if>>${nav.name}</a></li>
		  					</#if>
			  				<#if nav.isCurrentPage?? && nav.isCurrentPage()>
			  		 			<#assign moreHighLight = false>
			  		 		</#if>
			  		 		<#assign charSize = charSize + lenn(nav.name)>
			  		 	</#if>
		  				
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
    </div>

</div>

<#-- 宋平辉 -->
<#if current_corp?? && (current_corp.id == 3491454)>
<#assign noShowLogin=true >
</#if> 
</#if>