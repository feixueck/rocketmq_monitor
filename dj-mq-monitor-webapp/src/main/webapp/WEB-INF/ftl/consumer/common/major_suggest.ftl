<script type="text/javascript">
    var __edu_major_check_true_info;
    $('#major-linkup').linkup({type: 'major'});
//    $("#edu-major-select").bind('change.linkup', function() {
//        var $select = $(this);
//        window.setTimeout(function() {
//            $select.find('option[value="' + $select.data('svalue') + '"]').attr('selected', true);
//            if(__edu_major_check_true_info){
//                window['__edu_major_check_true'] ? __edu_major_check_true() : null;
//            }
//        }, 200);
//    });
    $("#specialty-sort-select").bind('change.linkup', function() {
        var $select = $('#edu-major-select');
        window.setTimeout(function() {
            $select.find('option[value="' + $select.data('svalue') + '"]').attr('selected', true);
            if(__edu_major_check_true_info){
                window['__edu_major_check_true'] ? __edu_major_check_true() : null;
            }
        }, 200);
    });
    $('#majorname-input').blur(function() {
        if (this.value.length < 2) {
            window['__edu_major_check_false'] ? __edu_major_check_false() : null;
            window['__edu_major_check_true_info'] = 0;
            return;
        }
        $.get('/ajax/major', {s:$('#majorname-input').val(), t: new Date().getTime()}, function(r) {
            if (r == '') {
                window['__edu_major_check_false'] ? __edu_major_check_false() : null;
                window['__edu_major_check_true_info'] = 0;
                return;
            }
            var m = r.split(",");
            $('#specialty-sort-select').attr("disabled", true);
            $('#specialty-sort-select').val(m[0]).change();
            $('#specialty-sort-select').removeAttr("disabled", true);
            $('#edu-major-select').attr("disabled", true);
            $("#edu-major-select").data('svalue', m[1]);
            $('#edu-major-select').removeAttr("disabled", true);
            window['__edu_major_check_true_info'] = 1;
        });
    });
</script>