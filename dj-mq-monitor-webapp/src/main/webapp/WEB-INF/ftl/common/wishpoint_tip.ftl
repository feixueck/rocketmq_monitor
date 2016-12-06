
<div id="satisfied-say" style="display:none">
    <#-- 有职位订阅显示 -->
    <div class="room hasinetion" style="display:block;">
        <a href="javascript:void(0)" class="close">关闭</a>
            <h5 class="b">通过期望度，快速挑出最符合心意的职位！</h5>期望度根据您的职位订阅分析得出，随着查看和投递职位次数的增加，期望<br/>度数值会越来越精准。
            <p class="alignright">
                <a href="http://${configs["domains.job"]}/intention/index" class="button default"><span style="padding-left:0">查看职位订阅</span></a>
            </p>
    </div>
    <#-- 无职位订阅显示 -->
    <div class="room noinetion" style="display:none;">
        <a href="javascript:void(0)" class="close">关闭</a>
                <h5 class="b">启用期望度，快速挑出符合心意的职位！</h5>说说您想找什么样的工作，大街网马上告诉您当前职位是不是您喜欢的。<br/>
                <p class="alignright">
                <a href="javascript:void(0)" class="button default" id="add-intention-link-id"><span style="padding-left:0">添加职位订阅</span></a>
                </p>
                <script type="text/javascript">$('#add-intention-link-id').attr("href", 'http://${configs["domains.job"]}/intention/index?from=' + encodeURIComponent(location.href));</script>
    </div>
    <span class="pointer"></span>
</div>

<#-- 点击的效果 -->
<@holder>
    <script type="text/javascript">
        $('.intention-click-tips-class').click(function() {
            var offset = $(this).offset();
            var height= $('#satisfied-say').innerHeight();
            $('#satisfied-say').css({
                'left': (offset.left - 12) + 'px',
                'top': (offset.top - height - 9) + 'px'
            }).show();
        });

        $('.nointention-click-tips-class').click(function() {
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







</script>
</@holder>

<#-- 异步获取部分代码 -->

<@holder>
    <script type="text/javascript">
        var reflushTimes = 1;
        var sh = setInterval(flush_point, 1000*reflushTimes);
        function flush_point(){             
            clearInterval(sh);


            var thejobs = new Array();
            var i =0;
            $(".wishpoint-tag").each(
                function(){
                     thejobs.push($(this).attr('id'));
                });
            if($(".wishpoint-tag").length>0){
                $.post('/person/get-wishpoint' , {jids:thejobs}, function(r) {
                    if(r!='0'){
                        var data = eval(r);
                        if(data[0].intentiontype=='1'){
                            //TODO:  it is 404  response.
                            //intentionStatus();
                            reflushTimes = reflushTimes +1;

                            sh = setInterval(flush_point, 1000*reflushTimes);
                        }else{

                            $(".wishpoint-loading").hide();
                            $(".wishpoint-result-has").show();
                            $.each(data[0].wishpoint,function(i,item){
                                $("#"+item.jid).html(item.point);
                                $("#big-"+item.jid).html(item.point);
                                if(parseInt(item.point) >=80){
                                    $("#"+item.jid).parent().parent().removeClass("small-pleased-position");
                                    $("#big-"+item.jid).parent().parent().removeClass("pleased-position");
                                }
                            });
                        }
                    }else{
                        $(".wishpoint-loading").hide();
                        $(".wishpoint-result-no").show();
                        $(".hasinetion").hide();
                        $(".noinetion").show();
                    }
                });                
            }

        }
        flush_point();
   </script>
</@holder>
