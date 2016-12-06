<div id="satisfied-say" style="display:none">
    <div class="room">
        <a href="javascript:void(0)" class="close">关闭</a>
        <#if userIntention??>
            <h5 class="b">通过期望度，快速挑出最符合心意的职位！</h5>期望度根据您的职位订阅分析得出，随着查看和投递职位次数的增加，期望<br/>度数值会越来越精准。
            <p class="alignright">
                <a href="http://${configs["domains.job"]}/intention/index" class="button default"><span style="padding-left:0">查看职位订阅</span></a>
            </p>
            <#else>
                <h5 class="b">启用期望度，快速挑出符合心意的职位！</h5>说说您想找什么样的工作，大街网马上告诉您当前职位是不是您喜欢的。<br/>

                <p class="alignright">
                    <a href="javascript:void(0)" class="button default" id="add-intention-link-id"><span style="padding-left:0">添加职位订阅</span></a>
                </p>
                <script type="text/javascript">$('#add-intention-link-id').attr("href", 'http://${configs["domains.job"]}/intention/index?from=' + encodeURIComponent(location.href));</script>
        </#if>
    </div>
    <span class="pointer"></span>
</div>
<@holder>
    <script type="text/javascript">
        $('#joblist-club td .tips, #job-list td .tips , #list td .tips , #serachresult .joblist .aligncenter .tips').click(function() {
            var offset = $(this).offset();
            var height= $('#satisfied-say').innerHeight();
            $('#satisfied-say').css({
                'left': (offset.left - 12) + 'px',
                'top': (offset.top - height - 9) + 'px'
            }).show();
        });
        $('#satisfied-say .close').click(function() {
            $('#satisfied-say').hide();
        });

<#--<#if userIntention?? && userIntention.type == 1>
        $(function() {
            var url = location.href;
            var speed = function() {
                $.ajax({
                    url:'/job/intentionStatus',
                    success: function(r) {
                        if (r == 0) {
                            location.replace(url);
                        }
                    }
                })
            };
            setInterval(speed, 10000);
        });

</#if>-->
</script>

</@holder>