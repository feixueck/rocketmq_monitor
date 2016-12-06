<div id="dialog-report-box" style="display:none;">
<div id="dialog-report">
    <form id="report-form" action="/corp/report" method="post">
        <h3>您要举报该公司信息存在什么问题？<span style="color:#FF0000;">(类别必选)</span></h3>
        <table>
            <col width="100"/>
            <col width="140"/>
            <col width="*"/>

            <tr id="report">
                <input  name="cid" type="hidden" value="${corpProfile.cid}">
                <input  name="info" type="hidden" id="report-info">
                <td><input type="checkbox" class="checkbox"/><label class="checkbox">发布虚假职位</label></td>
                <td><input type="checkbox" class="checkbox"/><label class="checkbox">招聘者非该公司人员</label></td>
                <td><input type="checkbox" class="checkbox"/><label class="checkbox">招聘过程中收取各种费用</label></td>
            </tr>
            <tr>
                <td><input type="checkbox" class="checkbox"/><label class="checkbox">其他</label></td>
                <td></td>
                <td></td>
            </tr>
        </table>
        <textarea name="other" id="other_info" class="textarea"></textarea>
        <p>（限300字）</p>
        <p><@validate field="#other_info" type="length" data="0~300" message="最多300字" /></p>
        </form>
    </div>
</div>
<script type="text/javascript">
    $('#other_info').blurHint('请填写具体举报内容，并输入您的有效联系方式，便于我们及时与您联系！');
</script>
<#--//$.dialog('#dialog-report2', {mask: true, title: '信息举报', width:460, mercy: false})-->