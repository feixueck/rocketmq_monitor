<div id="transpond-dialog" style="display:none;">
    <div class="transpondBox" id="transpondBox-id">
       
    </div>
</div>
<div style="display:none;" id="transpond-dialog-resume">
    <div class="transpondBox">
        <div class="aligncenter" style="padding:25px 0 55px 0;"><span class="success" id="transpond-dialog-content"></span></div>
    </div>
</div>
<@holder>
<script type="text/javascript">
    $.get('http://${configs['domains.job']}/share/resume/forward', {date:new Date()}, function(r) {
      if ($.trim(r).length > 0) {
        $('#transpondBox-id').html(r);
      }
    });
    function bindTextarea() {
            var $textarea = $('#textearea1'),
                    $tips = $('.inputlimit span'),
                    len = $textarea.val().length,
                    maxLen = 140;
            $tips.text(maxLen - len);
            setLen();
            $textarea.blur(
                    function() {
                        //var v = $textarea.val();
                        //v = v.replace(/^[ 　]+/, '').replace(/\s+$/, '');
                        //$textarea.val(v);
                        setLen();
                    }).keydown(
                    function() {
                        var val = $textarea.val(),//.replace(/\n/g, ''),
                                len = val.length;
                        //if (len <= maxLen) {
                            //$textarea.data('tmpval', $textarea.val());
                        //}
                    }).keyup(function() {
                setLen();
            });

            function setLen() {
                var val = $textarea.val();//.replace(/\n/g, ''),
                        len = val.length;
                if (len > maxLen) {
                    $textarea.val($textarea.val().substr(0, 140));
                    $tips.text(0);
                } else {
                    $tips.text(maxLen - len);
                }
            }
        }
    function share_resume (objectId){
        var corp_bind_flag=$('#isBindCorpFlag').val();
        if(corp_bind_flag=='false'){
           $.dialog('#transpond-dialog', {mask: true, title: '转发职业档案', width:640, mercy: false});
        }else{
          $('#wrong-wanring').hide();
          $('#applyId-input').val(objectId);
          $.dialog('#transpond-dialog', {mask: true, title: '转发职业档案', width:640, mercy: false, oncomplete: function() {
            var value=$('#resume-email-input').val().replace(/^[\s　]+|[\s　]+$/g,"");
            if($.trim(value)==''){
                $('#wrong-wanring').show();
                return false;
            }else{
                var pattern = /^[_\.0-9a-zA-Z+-]+$/;
                if (!pattern.test(value)) {
                    $('#wrong-wanring').show();
                    alert('邮箱格式有误');
                    return false;
                }
            }
            $('#resume-email-input').val(value);
            $('#textearea1').attr("value",$('#textearea1').val().replace(/^[\s　]+|[\s　]+$/g,""));
            $('#resume-share-form').ajaxSubmit({
                success: function(r) {
                    var s= '职业档案转发失败,请稍后再试';
                    if (r.indexOf("0:")>-1) {
                       s= '已成功转发职业档案给&nbsp;'+r.substring(2);
                       $('#resume-email-input').val('');
//                       $('#textearea1').attr("value",'');
                    } else {
                        if(r.indexOf("-1:")>-1 && r.length>3){
                           s='职业档案转发失败,'+r.substring(3);
                        }
                    }
                    $('#transpond-dialog-content').html(s);
                    $.dialog('#transpond-dialog-resume', {mask: true, title: '转发职业档案', width:640, mercy: false});
                }
            });
        }});
          bindTextarea();
        }
    }
</script>
</@holder>