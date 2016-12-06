<@holder>
<script type="text/javascript">
    $('#profession-linkup').linkup({type: 'profession'});
    $("#profession-select").bind('change.linkup', function() {
        var $select = $(this);
        window.setTimeout(function() {
            $select.find('option[value="' + $select.data('svalue') + '"]').attr('selected', true);
        }, 200);
    });
    $('#position-input').blur(function() {
        if (this.value.length < 2) {
            return;
        }
        $.get('/ajax/profession', {s:$('#position-input').val(), t: new Date().getTime()}, function(r) {
            if (r == '') {
                return;
            }
            var m = r.split(",");
            $('#profession-specialty-sort').attr("disabled", true);
            $('#profession-specialty-sort').val(m[0]).change();
            $('#profession-specialty-sort').removeAttr("disabled", true);
            $('#profession-select').attr("disabled", true);
            $("#profession-select").data('svalue', m[1]);
            $('#profession-select').removeAttr("disabled", true);
        });
    });
</script>
</@holder>