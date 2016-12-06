<span class="percentage">
    <#if (resume.completePercent)??>
        <#if resume.completePercent lt 60>
            <p class="f12">
                <span class="b">你的职业档案完成度太低：</span>
                <span class="limit" style="display:inline-block;"><span style="width: ${resume.completePercent}%;"></span></span>
                <span class="font"><span>${resume.completePercent}</span>％</span>
            </p>
            <p></p>
            <p class="gaps f12">现在还有机会更新职业档案，让我对你有个全面的了解。<a <#if resumeStat??>stat="${resumeStat}"</#if> href="http://${configs('domains.job')}/resume/index">马上完善职业档案</a></p>
            <#if !resume.completeModel?contains('affix')><p class="f12">同时，你还可以上传英文简历或设计作品。<a <#if affixStat??>stat="${affixStat}"</#if> href="http://${configs('domains.job')}/resume/index#affix-section">上传英文简历/作品</a></p></#if>
        <#elseif resume.completePercent lt 100>
            <p class="f12">
                <span class="b">你的职业档案完成度：</span>
                <span class="limit" style="display:inline-block;"><span style="width: ${resume.completePercent}%;"></span></span>
                <span class="font"><span>${resume.completePercent}</span>％</span>
            </p>
            <p></p>
            <p class="gaps f12">你还有时间完善一下职业档案，让我对你有更全面的了解。<a <#if resumeStat??>stat="${resumeStat}"</#if> href="http://${configs('domains.job')}/resume/index">马上完善职业档案</a></p>
            <#if !resume.completeModel?contains('affix')><p class="f12" >同时，你还可以上传英文简历或设计作品。<a <#if affixStat??>stat="${affixStat}"</#if> href="http://${configs('domains.job')}/resume/index#affix-section">上传英文简历/作品</a></p></#if>
        <#else>
            <#if !resume.completeModel?contains('affix')><p class="f12">你还有时间上传英文简历或设计作品，让我对你有更多了解。<a <#if affixStat??>stat="${affixStat}"</#if> href="http://${configs('domains.job')}/resume/index#affix-section">上传英文简历/作品</a></p></#if>
        </#if>
    </#if>
</span>