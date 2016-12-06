<#macro sharing type title>
<div id="transpond-dialog" style="display:none;">
    <div class="transpondBox" id="transpondBox-id">

    </div>

</div>
<div style="display:none;" id="transpond-dialog-resume">
    <div class="transpondBox">
        <div class="aligncenter" style="padding:25px 0 55px 0;"><span class="success alignleft" id="transpond-dialog-content"></span></div>
    </div>
    <div class="dialog-footer"><button class="normal closeDialog"><span><span>关闭</span></span></button></div>
    <div class="buttons" style="display:none;"><button class="default"><span><span>确定</span></span></button> <button class="normal"><span><span>取消</span></span></button></div>
</div>

<@holder>
<script type="text/javascript">
    var sharing_type='${type!"resume_sharing"}';
    if (sharing_type == 'job_sharing') {
        var sharing_url = "/share/job/forward";
    } else {
        var sharing_url = "/share/resume/forward";
    }
    $.get(sharing_url, {date:new Date()}, function(r) {
      if ($.trim(r).length > 0) {
        $('#transpondBox-id').html(r);
      }
    });
    function bindTextarea() {
            var $textarea = $('#textearea1'),
                    $tips = $('.inputlimit span'),
                    len = $textarea.val().length,
                    maxLen = 70;
            $tips.text(maxLen - len);
            setLen();
            $textarea.blur(
                    function() {
                        var v = $textarea.val();
                        v = v.replace(/^[ 　]+/, '').replace(/\s+$/, '');
                        $textarea.val(v);
                        setLen();
                    }).keydown(
                    function() {
                        var val = $textarea.val().replace(/\n/g, ''),
                                len = val.length;
                        if (len < maxLen) {
                            $textarea.data('tmpval', $textarea.val());
                        }
                    }).keyup(function() {
                setLen();
            });

            function setLen() {
                var val = $textarea.val().replace(/\n/g, ''),
                        len = val.length;
                if (len > maxLen) {
                    $textarea.val($textarea.data('tmpval'));
                    $tips.text(0);
                } else {
                    $tips.text(maxLen - len);
                }
            }
        }
    function closeTips(){}
    function sharing(objectId){
        closeTips();
        var corp_bind_flag=$('#isBindCorpFlag').val();
        if(corp_bind_flag=='false'){
            $.dialog('#transpond-dialog', {mask: true, title: "${title!"转发职业档案"}", width:640, mercy: false});
        }else{
          $('#wrong-wanring').hide();
          $('#sharingId-input').val(objectId);
          $.dialog('#transpond-dialog', {mask: true, title: "${title!"转发职业档案"}", width:640, mercy: false, oncomplete: function() {
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
                if(value.length > 18){
                    $('#wrong-wanring').show();
                    alert('邮箱不能超过18个字符');
                    return false;
                }
            }
            $('#resume-email-input').val(value);
            $('#textearea1').attr("value",$('#textearea1').val().replace(/^[\s　]+|[\s　]+$/g,""));
            if(sharing_type == 'job_sharing'){
              $('#resume-share-form').attr("action","/share/job/add"); 
            }
            $('#resume-share-form').ajaxSubmit({
                success: function(r) {
                    var s = '${title}' + '失败,请稍后再试';
                    if (r.indexOf("0:") > -1) {
                        if (sharing_type == 'job_sharing') {
                            if(r.indexOf("0:[")> -1){
                              var array=eval(r.substring(2));
                              s = '该职位已成功共享给&nbsp;' +array[0];
                              addSharing($('#sharingId-input').val(),array[1],array[2]);
                            }else{
                              s = '该职位已成功共享给&nbsp;' + r.substring(2);
                            }

                        } else {
                            s = '已成功转发职业档案给&nbsp;' + r.substring(2);
                        }
                        $('#resume-email-input').val('');
                        $('.scrollMain .current .iconResent').show();
                    } else {
                        if(r.indexOf("-1:")>-1 && r.length>3){
                           if (sharing_type == 'job_sharing') {
                              s='职位共享失败,'+r.substring(3);
                           }else{
                             s='职业档案转发失败,'+r.substring(3);
                           }
                        }
                    }
                    $('#transpond-dialog-content').html(s);
                    $.dialog('#transpond-dialog-resume', {mask: true, title: "${title!"转发职业档案"}", width:640, mercy: false});
                    $('.closeDialog').click(function(){
                        $('#interactive-box-transpond-dialog-resume,#interactive-mask').hide()
                    })
                }
            });
        }});
          bindTextarea();
        }
    }
</script>
</@holder>
</#macro>