<@holder>
<script type="text/javascript">
    $('#profession-linkup').linkup({type: 'profession'});
    $("#profession-select").bind('change.linkup', function() {
        var $select = $(this);
        window.setTimeout(function() {
            $select.find('option[value="' + $select.data('svalue') + '"]').attr('selected', true);
        }, 200);
    });
    $('#profession-sub-select').bind('change.linkup', function(){
        var $this = $(this),
            data = $this.data('prechange');
        if(data){
            $this.each(function(){
                this.removeAttribute('selected');
            });
            $this.find('option[value="' + data + '"]').get(0).setAttribute('selected', 'selected');
        }
        $this.data('prechange', null);
        //$('#position-input').blur();
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
            $('#profession-specialty-sort').val(m[0]).change();
            $('#profession-sub-select').data('prechange', m[1]);
        });
    });
</script>
</@holder>