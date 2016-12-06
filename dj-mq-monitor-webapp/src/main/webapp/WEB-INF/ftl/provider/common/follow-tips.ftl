<div id="tops-cont"  style="display:none;">
   <div class="tops-cont">
       <p class="b f14 g3 ">你关注的名企达到上限100家，不能再关注名企了</p>
       <p class="g3">取消已关注的名企，才能继续关注其他名企</p>
       <p class="green">看看<a href="http://${configs['domains.club']}/myfollow">“我关注的名企”</a></p>
   </div>
</div>
<@holder>
    <script type="text/javascript">
        <#if  !followNumFlag??>
          $.get('/follow/follownum',{domain:'${domain!}'}, function(r) {
            $('#member-cnt').text(r);
          });
        </#if>
        $('.concern, #follow-cancel').live('click', function() {
            var obj = $(this);
            var cid = $(this).attr("cid");
            $.ajax({
                url: '/follow/cancel',
                data: 'cid=' + cid,
                async: false,
                success: function(r) {
                    if (r >= 0) {
                        handle_follow_cancel(obj, r);
                    }
                },
                error: function(r) {
                    alert("取消失败")
                }
            });
        });

        $('.unconcern,#follow-club').live('click', function() {
            if(!is_login){
                url = location.href;
                location.href = "http://${configs['domains.www']}/account/login?redir="+url;
        }else{
                var obj = $(this);
                var cid = $(this).attr("cid");
                var res = 0;
                $.ajax({
                    url: '/follow/add',
                    data: 'cid=' + cid,
                    async: false,
                    success: function(r) {
                        if (r >= 0) {
                            handle_follow_add(obj, r);
                        } else if (r == -2) {
                            alert("添加失败，请先登录");
                        } else if (r == -3) {
                            $.dialog('#tops-cont', {
                                mask: true, title: '提示', width:518, mercy: false,
                                oncomplete: function() {
                                    return true;
                                }
                            });
                        } else {
                            alert("添加关注失败,请稍后再试");
                        }
                    },
                    error: function(r) {
                        alert("添加错误!请稍后再试")
                    }
                });
            }
        });
        function handle_follow_cancel(obj,r){
                $("#follow-club").css('display', '');
                $("#follow-cancel").hide();
                $('#member-cnt').text(r);
            }
            function handle_follow_add(obj,r){
                $("#follow-club").hide();
                $("#follow-cancel").css('display', '');
                $('#member-cnt').text(r);
            }

            if(is_login){
                <#if  clubInfo??>
                $.get('/person/is-follow' , {cid:'${clubInfo.cid}'}, function(r) {
                    if(r=='0'){
                        $("#follow-club").show();
                        $("#follow-cancel").hide();
                    }else{
                        $("#follow-club").hide();
                        $("#follow-cancel").show();
                    }
                });
                </#if>
            }
    </script>
</@holder>