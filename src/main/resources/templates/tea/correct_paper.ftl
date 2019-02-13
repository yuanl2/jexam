<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>学生答卷</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${request.contextPath}/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${request.contextPath}/css/per-center.css"/>
</head>

<body>

<div id="wrapper">

    <!-- Sidebar -->
    <nav class="navbar navbar-inverse navbar-fixed-top navbar-bg" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${request.contextPath}">首页</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">
                <li><a href="${request.contextPath}/user/tea/add_subject"><i class="fa fa-bell"></i> 添加科目</a></li>
                <li><a href="${request.contextPath}/user/tea/add_student"><i class="fa fa-plus"></i> 添加学生</a></li>
                <li><a href="${request.contextPath}/user/tea/add_paper"><i class="fa fa-edit"></i> 添加试卷</a></li>
                <li><a href="${request.contextPath}/user/tea/manager_paper"><i class="fa fa-edit"></i> 试卷管理</a></li>
                <li class="active-bg"><a href="${request.contextPath}/user/tea/correct_paper"><i class="fa fa-edit"></i> 学生答卷</a></li>
            </ul>

            <h3 style="text-align: center;color: #ffffff;"> 学生答卷</h3>
        </div><!-- /.navbar-collapse -->
    </nav>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th>试卷名称</th>
                            <th>学生</th>
                            <th>科目</th>
                            <th>成绩</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list papers as item>
                        <td>${item.name!}</td>
                        <td>${item.student!}</td>
                        <td>
                            ${item.subject!}
                        </td>
                        <td>
                             <#if  item.type == 1 >
                                 ${item.score!}
                             <#else>
                                 <a href='${request.contextPath}/user/tea/papers/${item.id}/score?student=${item.studentId}'>待批阅</i></a>
                             </#if>
                        </td>
                        </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>
        </div><!-- /.row -->

    </div><!-- /#wrapper -->

    <!-- JavaScript -->
    <script src="${request.contextPath}/js/jquery.min.js"></script>
    <script src="${request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>