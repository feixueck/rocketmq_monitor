<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<#-- <link rel="shortcut icon" href="../../assets/ico/favicon.ico">-->
    <title>Topic:Provider:list</title>
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
    <![endif]-->  </head>
<body role="document">
<!-- Fixed navbar -->
<div class="container theme-showcase" role="main">

    <p>&nbsp;</p>

    <div class="container theme-showcase"><!-- /container  -->
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>Topic</th>
                <th>AppName</th>
                <th>PID</th>
                <th>QueueName</th>
                <th>IP</th>
                <th>AppDesc</th>
            </tr>
            </thead>
            <tbody>
            <#if mqConsumers?? && mqConsumers.size() gt 0>
                <#list mqConsumers as mqConsumer>
                    <#if mqConsumer??>
                    <tr>
                        <td>${mqConsumer.topicName!}</td>
                        <td>${mqConsumer.appName!}</td>
                        <td>${mqConsumer.pid!}</td>
                        <td>${mqConsumer.queueName!}</td>
                        <td>${mqConsumer.ip!}</td>
                        <td>${mqConsumer.appDesc!}</td>
                    </tr>
                    </#if>
                </#list>
            </#if>
            </tbody>
        </table>
    </div>
    <!-- container-->
</div>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>-->
<script src="${domain}/mq/monitor/js/jquery-1.10.2.min.js"></script>
<script src="${domain}/mq/monitor/js/bootstrap.min.js"></script>
<script src="${domain}/mq/monitor/js/docs.min.js"></script>
</body>
</html>