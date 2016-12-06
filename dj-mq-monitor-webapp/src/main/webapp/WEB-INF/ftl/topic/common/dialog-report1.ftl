<div id="dialog-report-box" style="display:none;">
<div id="dialog-report">
        <form id="report-form" method="post">
        <h3>您要举报该职位信息存在什么问题？<span style="color:#FF0000;">(类别必选)</span></h3>
        <table id="report">
            <col width="110"/>
            <col width="110"/>
            <col width="*"/>

            <tr>
                <input  name="type" type="hidden" id="report-type">
                <td><input type="checkbox" class="checkbox"/><label class="checkbox">发布虚假职位</label></td>
                <td><input type="checkbox" class="checkbox"/><label class="checkbox">职位已过期</label></td>
                <td><input type="checkbox" class="checkbox"/><label class="checkbox">招聘过程中收取各种费用</label></td>
            </tr>
            <tr>
                <td><input type="checkbox" class="checkbox"/><label class="checkbox">其他</label></td>
                <td></td>
                <td></td>
            </tr>
        </table>
        <textarea name="content" id="report-content" class="textarea" style="overflow-x: hidden;" maxLength="300"></textarea>
        <p><span style="color:#FF0000;">（限300字）</span></p>
        <p><@validate field="#report-content" type="length" data="0~300" message="最多300字" /></p>
         </form>
    </div>
   </div>
<script type="text/javascript">
    $('report-content').blurHint('请填写具体举报内容，并输入您的有效联系方式，便于我们及时与您联系！');
</script>