<h1>马上体验大街网，通过人脉招人才，找工作。</h1>
<!--<p class="f14 g9">帮你打造完美的职业形象、企业形象，建立良好的职业人脉</p>-->
<#if inviteUser??>
<div class="personal-invite clearfix">
    <div class="dp floatleft"><img width="80" height="80" src="${inviteUser.getAvatarUrl('m')}"></div>
    <div class="info floatleft">
        <div class="pop">
            <div class="arrow"></div>
            <div class="pop-main large"><span class="b green">${inviteUser.name}:</span><#if inviteMsg?? && inviteMsg!=''>${inviteMsg}<#else>最近我的同学都在这个网站上找工作和实习机会，虽然要花两分钟注册一下，还是值得的，你看看吧</#if></div>
        </div>
    </div>
</div>
</#if>
<#include 'reg_form_main.ftl' />