<#macro recruitLeftNav selectedItem="index">
<div class="nav2-box">
    <ul class="nav2">
        <a href="/recruit/index?from=left_nav" class="my-job<#if selectedItem=="index"> click</#if>">
            <h5>
                <span></span>
                我的招聘
            </h5>
        </a>
    </ul>
    <ul class="nav2">
        <a href="/recruit/job/list?from=left_nav"
           class="position-management<#if selectedItem=="recruitList"> click</#if>">
            <h5>
                <span></span>
                职位管理
            </h5>
        </a>
        <li>
            <a href="/recruit/create?from=left_nav" <#if selectedItem=="recruitCreate">class="click"</#if>>
                <p>
                    发布职位
                </p>
            </a>
        </li>
    </ul>
    <ul class="nav2">
        <a href="/recruit/apply/index?from=left_nav"
           class="candidate-management <#if selectedItem=="candidateManagement">click</#if>">
            <h5>
                <span></span>
                候选人管理
            </h5>
        </a>
        <li>
            <a href="/search/talent/index?from=left_nav" class="<#if selectedItem=="talentSearch"> click</#if>">
                <p>
                    人才搜索
                </p>
            </a>
        </li>

        <li>
            <a href="/bonusinvitation/invitelist?from=left_nav" <#if selectedItem=="bonusInvitation">class="click"</#if>>
                <p>
                    悬赏邀约
                </p>
            </a>
        </li>
    </ul>
    <ul class="nav2 no-border height">
        <a href="/talent/home/index?from=left_nav" class="person-management <#if selectedItem=="talentMenu"> click</#if>">
            <h5>
                <span></span>
                人才库管理
            </h5>
        </a>
    </ul>
</div>
</#macro>