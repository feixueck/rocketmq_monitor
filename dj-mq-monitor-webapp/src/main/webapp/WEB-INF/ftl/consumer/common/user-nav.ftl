<#if callback?? && callback?size gt 0>${callback}(</#if>
{
    "isLogin":<#if loginUser??>true<#else>false</#if>,
    "isActive":<#if loginUser?? && loginUser.status?? && loginUser.status gte 1>true<#else>false</#if>,
    "navVersion":${(userNavigation.version.code)!-1},
    "isMatch":<#if userNavigation?? && userNavigation.match?? && !userNavigation.match>false<#else>true</#if>,
    "loginUserName":"${(loginUser.name)!""}",
    "loginUserAvatar":"${(loginUser.getAvatarUrl("ss"))!""}",
    "require" : {
        "recruiter":<#if isHr?? && isHr>true<#else>false</#if>
    }
}
<#if callback?? && callback?size gt 0>)</#if>