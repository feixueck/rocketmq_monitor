<#macro comments objectId type order='asc' crossdomain=true>
<div id="comment">
</div>
<@holder>
<script type="text/javascript">
    var commentpage = 1;
    function load_comments(page) {
        <#if crossdomain>
        $('#www-ajax-frame')[0].contentWindow.$.ajax({
        <#else>
        $.ajax({
        </#if>
            url:'http://${configs['domains.www']}/comment/list',
            data:'objectId=${objectId}&type=${type}&currentpage=' + page,
            success: function(r) {
                commentpage = page;
                $('#comment').html(r);
            },
            error: function() {
                $('#comment').text('载入评论失败');
            }
        });
    }
    <#if crossdomain>
    $(window).load(function() {
        load_comments(commentpage);
    });
    <#else>
        load_comments(commentpage);
    </#if>
</script>
</@holder>
</#macro>