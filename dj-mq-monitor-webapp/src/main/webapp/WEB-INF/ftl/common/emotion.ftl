<div style="position: absolute; width: 260px; display: none;" class="facebox" id="message_face">
    <div class="shadow">
        <div class="faceBoxLayout">
            <div class="pointer"></div>
            <ul class="clearfix">
            <#assign faces={
            "1":"哦","2":"微笑","3":"憨笑","4":"嘻嘻","5":"思考","6":"愤怒","7":"抓狂","8":"委屈","9":"流泪",
            "10":"使坏","11":"晕","12":"汗","13":"困了","14":"害羞","15":"失望","16":"赞","17":"暧昧",
            "18":"得意","19":"骷髅","20":"囧","21":"睡","22":"调皮","23":"亲亲","24":"疑问","25":"闭嘴",
            "26":"难过","27":"无语","28":"奋斗","29":"鄙视","30":"猪头"} />
            <#list faces?keys as face>
                <li><img src="<@hashUrl path="/images/face/${face}.gif" />" id="f-${face}" title="${faces[face]}" class="face_icon">
                </li>
            </#list>
            </ul>
        </div>
    </div>
</div>
<@holder>
<script type="text/javascript">
    function show_face(obj, target_textarea) {
        var offset = obj.find('a').offset();
        show_face_absolute(offset.top + 25, offset.left - 220-($.browser.msie?7:0), target_textarea);
        $('#message_face .pointer').addClass('rightPoint').removeClass('leftPoint');
    }

    function show_face_absolute(top, left, target_textarea) {
        init_face(top, left, target_textarea);
        $('#message_face .pointer').addClass('leftPoint').removeClass('rightPoint');
    }

    function init_face(top, left, target_textarea) {
        $('#message_face').css("top", top + "px").css("left", left + "px").show();

        $('.face_icon').unbind('click').click(function() {
            var id = $(this).attr("id").replace("f-", "");
            var faceText = '[em:' + id + ':]';
            insert_content(target_textarea, faceText);
            $('#message_face').hide();
        });
    }

    function insert_content(target, text) {
        var obj = target[0];
        selection = document.selection;
        obj.focus();
        if (obj.selectionStart) {
            obj.value = obj.value.substr(0, obj.selectionStart) + text + obj.value.substr(obj.selectionEnd);
        } else if (selection && selection.createRange) {
            var sel = selection.createRange();
            sel.text = text;
            //sel.moveStart('character', - str_len(text));
        } else {
            obj.value = text + obj.value;
        }
        target.focus();
    }
    $(document).click(function(e) {
        if($(e.target).hasClass('face-switch') || $(e.target).parent().hasClass('face-switch')) {
            return;
        }
        $('#message_face').hide();
    });
</script>
</@holder>