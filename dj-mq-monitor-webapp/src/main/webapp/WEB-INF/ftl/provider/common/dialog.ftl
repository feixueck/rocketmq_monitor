<#macro idialog id width="400">
<div id="${id}" class="dialog" style="display:block;width:${width}px">
    <div class="top"><div class="corner"></div></div>
    <div class="body">
        <div class="titlebar">
            <h1>工作地点</h1>
            <a class="close" href="javascript:void(0);">关闭</a>
        </div>
        <div class="client">
            <div class="scrollable">
                <#nested />
            </div>
        </div>
        <div class="buttons">
            <@button>确定</@button> <@button class="normal">取消</@button>
        </div>
    </div>
    <div class="bottom"><div class="corner"></div></div>
</div>
<@holder>
<script type="text/javascript">
$('.close', $('#${id}')).click(function(){
    $('#${id}').hide();
});
</script>
</@holder>
</#macro>