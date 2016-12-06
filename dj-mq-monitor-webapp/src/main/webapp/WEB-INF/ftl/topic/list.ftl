<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<#-- <link rel="shortcut icon" href="../../assets/ico/favicon.ico">-->
    <title>Topic:list</title>
    <!-- Bootstrap core CSS -->
    <link href="${domain}/mq/monitor/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="${domain}/mq/monitor/css/bootstrap-theme.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${domain}/mq/monitor/css/theme.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]>
    <script src="/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        *{ margin:0; padding:0; list-style:none;}
        a{ text-decoration:none;}
        a:hover{ text-decoration:none;}
        .tcdPageCode{padding: 15px 20px;text-align: right;color: #ccc;}
        .tcdPageCode a{display: inline-block;color: #428bca;display: inline-block;height: 25px;	line-height: 25px;	padding: 0 10px;border: 1px solid #ddd;	margin: 0 2px;border-radius: 4px;vertical-align: middle;}
        .tcdPageCode a:hover{text-decoration: none;border: 1px solid #428bca;}
        .tcdPageCode span.current{display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;color: #fff;background-color: #428bca;	border: 1px solid #428bca;border-radius: 4px;vertical-align: middle;}
        .tcdPageCode span.disabled{	display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;	color: #bfbfbf;background: #f2f2f2;border: 1px solid #bfbfbf;border-radius: 4px;vertical-align: middle;}
    </style>

</head>
<body role="document">
<!-- Fixed navbar -->
<div class="container theme-showcase" role="main">

    <div style="padding: 15px 20px;text-align: right;color: #ccc;">
        <input type="text" id="topic_keyword" name="topicName" style="width:200px;height:30px;">
        <button id="topic_button" type="button" class="btn btn-sm btn-info" onclick="find()">
            搜索
        </button>
    </div>

    <div class="container theme-showcase"><!-- /container  -->
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>Topic</th>
                <th>operations</th>
            </tr>
            </thead>
            <tbody>
            <#if mqTopics?? && mqTopics.size() gt 0>
                <#list mqTopics as topic>
                    <#if topic??>
                    <tr>
                        <td>${topic}</td>
                        <td>
                            <button class="btn btn-sm btn-info" type="button" onclick="provider('${topic}')">
                                Provider
                            </button>
                            &nbsp;&nbsp;
                            <button class="btn btn-sm btn-info" type="button" onclick="consumer('${topic}')">
                                Consumer
                            </button>
                        </td>
                    </tr>
                    </#if>
                </#list>
            </#if>
            </tbody>
        </table>
    </div>
    <!-- container-->
    <script language="javascript">
        function provider(topicName) {
            window.location.href = "/mq/monitor/providers/list?topic=" + topicName;
        }
        function consumer(topicName) {
            window.location.href = "/mq/monitor/consumers/list?topic=" + topicName;
        }
        function find(){
            var topicName = $("#topic_keyword").val();
            window.location.href = "/mq/monitor/topics/find?topic=" + topicName;
        }
        /*$(document).ready(function(){
            $("#topic_button").click(function(){
                var topicName = $("#topic_keyword").val();
                window.location.href = "/mq/monitor/topics/find?topic=" + topicName;
            });
        }*/
    </script>
    <div class="tcdPageCode">
    </div>
</div>



<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>-->
<script src="${domain}/mq/monitor/js/jquery-1.10.2.min.js"></script>
<script src="${domain}/mq/monitor/js/bootstrap.min.js"></script>
<script src="${domain}/mq/monitor/js/docs.min.js"></script>
<script src="${domain}/mq/monitor/js/jquery.page.js"></script>
</body>
<script>
    $(".tcdPageCode").createPage({
        pageCount:${totalPage},
        current:${currentPage},
        backFn:function(p){
            window.location.href ="${domain}/mq/monitor/topics/all?page=" + p + "&pageSize=20";
        }
    });
</script>

</html>